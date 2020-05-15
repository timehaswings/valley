#!/usr/bin/env python
# -*- coding:utf-8 -*-

from rest_framework.views import APIView
from django.contrib.auth import authenticate
from django.contrib.auth import login
from backend.models import User, RefreshToken
from rest_framework.authtoken.models import Token
from rest_framework.response import Response
from rest_framework import status
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.authentication import SessionAuthentication
from django.core.cache import cache
from django.contrib.auth import logout
from django.db.models import Q
from django.utils import timezone
import logging

logger = logging.getLogger('valley')


class CustomAuthToken(ObtainAuthToken):
    authentication_classes = [SessionAuthentication]

    def post(self, request, *args, **kwargs):
        data = request.data
        refresh_token_key = data.get('refreshToken')
        user_id = request.user.id

        refres_token = RefreshToken.objects.filter(key=refresh_token_key).first()
        if refres_token is None:
            return Response({
                'success': False,
                'msg': 'RefreshTokenNotExists'
            }, status=status.HTTP_400_BAD_REQUEST)

        # 如果refresh token过期则删除
        if timezone.now() > (refres_token.created + timedelta(minutes=settings.REFRESH_TOKEN_EXPIRE_TIME)):
            refres_token.delete()
            return Response({
                'success': False,
                'msg': 'RefreshTokenExpired'
            }, status=status.HTTP_401_UNAUTHORIZED)

        user = User.objects.filter(id=user_id).first()
        if user is None:
            return Response({
                'success': False,
                'msg': '刷新token失败，用户不存在'
            }, status=status.HTTP_400_BAD_REQUEST)
        elif user.is_active == 1 and user.is_delete == 0:
            token, created = Token.objects.get_or_create(user=user)
            return Response({
                'token': token.key,
                'msg': '获取token成功',
                'success': True
            }, status.HTTP_200_OK)
        elif user.is_active == 0:
            return Response({
                'success': False,
                'msg': '刷新token失败，用户已被禁用'
            }, status=status.HTTP_400_BAD_REQUEST)
        elif user.is_delete == 1:
            return Response({
                'success': False,
                'msg': '刷新token失败，用户已被删除'
            }, status=status.HTTP_400_BAD_REQUEST)


class LoginView(APIView):
    '''
    登录系统
    '''
    permission_classes = []
    authentication_classes = []

    # 登录api
    # 登录成功后，在请求头中加入：Authorization: Token xxxx
    def post(self, request, format=None):
        result = {}
        try:
            data = request.data
            account = data.get('username')
            user = User.objects.filter(Q(username=account) | Q(mobile=account) | Q(email=account)) \
                .filter(is_delete=0, is_active=1).first()
            if not user:
                result['msg'] = '登录失败,用户不存在或者已被禁用'
                result['success'] = False
                return Response(result, status.HTTP_404_NOT_FOUND)
            else:
                account = user.username

            password = data.get('password')
            # 图片验证码
            captcha = data.get('captcha')
            # 验证用户名和密码，返回用户对象
            user = authenticate(request, username=account, password=password, is_delete=0)
            if user is not None:
                login(request, user)  # 用户登陆
                # 更新Token
                try:
                    # 如果已经存在则删除
                    token = Token.objects.get(user=user)
                    token.delete()
                except Token.DoesNotExist as e:
                    pass

                refresh_token = RefreshToken.objects.filter(user_id=user.id).first()
                if refresh_token:
                    refresh_token.delete()

                token = Token.objects.create(user=user)

                refresh_token_key = str(token.user_id) + token.key
                refresh_token = RefreshToken(key=refresh_token_key, created=token.created, user_id=token.user_id)
                refresh_token.save()

                result['msg'] = '登录成功'
                result['success'] = True
                result['data'] = {}
                result['data']['username'] = user.username
                result['data']['name'] = user.name
                result['data']['userId'] = user.id
                result['data']['token'] = token.key
                result['data']['refreshToken'] = refresh_token_key
                result['data']['isSuperuser'] = user.is_superuser
                return Response(result, status.HTTP_200_OK)
            else:
                user = User.objects.filter(username=account).first()
                if user:
                    if not user.is_active:
                        result['msg'] = '登录失败,用户已被禁用'
                        result['success'] = False
                        return Response(result, status.HTTP_200_OK)
                    elif user.is_delete:
                        result['msg'] = '登录失败,用户已删除'
                        result['success'] = False
                        return Response(result, status.HTTP_200_OK)

                result['msg'] = '登录失败,用户名或密码错误'
                result['success'] = False
                return Response(result, status.HTTP_200_OK)
        except Exception as e:
            result['msg'] = '%s' % e
            result['success'] = False
            return Response(result, status.HTTP_500_INTERNAL_SERVER_ERROR)


class LogoutView(APIView):
    '''
    退出系统
    '''
    permission_classes = []
    authentication_classes = []

    def post(self, request, format=None):
        try:
            result = {}
            user_id = request.user.id

            logout(request)  # 删除会话
            cache.clear()  # 清空缓存

            # 删除Token
            token = Token.objects.filter(user_id=user_id).first()
            if token:
                token.delete()

            refresh_token = RefreshToken.objects.filter(user_id=user_id).first()
            if refresh_token:
                refresh_token.delete()

            result['msg'] = '退出成功'
            result['success'] = True
            return Response(result, status.HTTP_200_OK)
        except Exception as e:
            result['msg'] = '%s' % e
            result['success'] = False
            return Response(result, status.HTTP_500_INTERNAL_SERVER_ERROR)
