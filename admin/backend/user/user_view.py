#!/usr/bin/env python
# -*- coding:utf-8 -*-

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from backend.models import User, SysRole, SysUserRole
from backend.serializers import UserSerializer
from django.contrib.auth.hashers import make_password
from rest_framework.authentication import SessionAuthentication
import logging

logger = logging.getLogger('valley')


class UserAPIView(APIView):
    '''
    系统管理-系统配置-用户管理，新增，修改，删除用户
    '''

    # 新增用户
    def post(self, request, format=None):
        result = {}
        try:
            data = request.data
            account = data.get('account')
            email = data.get('email')
            mobile = data.get('mobile')
            password = data.get('password')

            # 创建者id
            if request.user.id is None:
                data['creater_id'] = data.get("creater_id")
            else:
                data['creater_id'] = request.user.id

            if not account:
                data['account'] = mobile

            if 'name' not in data.keys() or data.get('name') == '':
                data['name'] = account

            data['updater_id'] = data['creater_id']
            data['is_delete'] = False
            data['password'] = make_password(password)

            users = User.objects.filter(username=account, is_delete=0)
            if users.exists():
                result['msg'] = '新增失败：用户名已存在'
                result['success'] = False
                return Response(result, status.HTTP_400_BAD_REQUEST)
            elif User.objects.filter(email=email, is_delete=0).exists():
                result['msg'] = '新增失败：邮箱已存在'
                result['success'] = False
                return Response(result, status.HTTP_400_BAD_REQUEST)
            elif User.objects.filter(mobile=mobile, is_delete=0).exists():
                result['msg'] = '新增失败：手机号已存在'
                result['success'] = False
                return Response(result, status.HTTP_400_BAD_REQUEST)

            try:
                serializer = UserSerializer(data=data)
                serializer.is_valid(raise_exception=True)
                serializer.save()
            except Exception as e:
                result['msg'] = '新增失败：%s' % e
                result['success'] = False
                return Response(result, status.HTTP_400_BAD_REQUEST)

            result['msg'] = '新增成功'
            result['success'] = True
            result['data'] = serializer.data
            return Response(result, status.HTTP_200_OK)
        except Exception as e:
            result['msg'] = '%s' % e
            result['success'] = False
            return Response(result, status.HTTP_500_INTERNAL_SERVER_ERROR)

    # 修改用户
    def patch(self, request, format=None):
        result = {}
        try:
            data = request.data
            if request.user.id == data.get('id') and 'is_active' in data.keys() and not data.get('is_active'):
                result['msg'] = '操作失败,不能禁用自身账号'
                result['success'] = False
                return Response(result, status.HTTP_400_BAD_REQUEST)

            # 修改者id
            if request.user.id is None:
                data['updater_id'] = data.get("updater_id")
            else:
                data['updater_id'] = request.user.id

            obj = User.objects.filter(id=data.get('id')).first()
            del data['id']
            if obj:
                account = data.get('account')
                email = data.get('email')
                mobile = data.get('mobile')
                users = User.objects.exclude(id=obj.id).filter(username=account, is_delete=0)
                if users.exists():
                    result['msg'] = '修改失败：用户名已存在'
                    result['success'] = False
                    return Response(result, status.HTTP_400_BAD_REQUEST)
                elif User.objects.exclude(id=obj.id).filter(email=email, is_delete=0).exists():
                    result['msg'] = '修改失败：邮箱已存在'
                    result['success'] = False
                    return Response(result, status.HTTP_400_BAD_REQUEST)
                elif User.objects.exclude(id=obj.id).filter(mobile=mobile, is_delete=0).exists():
                    result['msg'] = '修改失败：手机号已存在'
                    result['success'] = False
                    return Response(result, status.HTTP_400_BAD_REQUEST)

                try:
                    serializer = UserSerializer(obj, data=data, partial=True)
                    serializer.is_valid(raise_exception=True)
                    serializer.save()
                except Exception as e:
                    result['msg'] = '修改失败：%s' % e
                    result['success'] = False
                    return Response(result, status.HTTP_400_BAD_REQUEST)

                result['msg'] = '修改成功'
                result['success'] = True

                temp_data = {}
                data_keys = list(data.keys())
                data_keys.append('update_time')
                for key in data_keys:
                    temp_data[key] = serializer.data.get(key)
                result['data'] = temp_data
                return Response(result, status.HTTP_200_OK)
            else:
                result['msg'] = '修改失败,用户不存在'
                result['success'] = False
                return Response(request, status.HTTP_404_NOT_FOUND)
        except Exception as e:
            result['msg'] = '%s' % e
            result['success'] = False
            return Response(result, status.HTTP_500_INTERNAL_SERVER_ERROR)

    # 删除用户
    def delete(self, request, format=None):
        result = {}
        try:
            data = request.data
            if request.user.id is not None and request.user.id == data.get('id'):
                result['msg'] = '操作失败,不能删除自身账号'
                result['success'] = False
                return Response(result, status.HTTP_400_BAD_REQUEST)

            obj = User.objects.filter(id=data.get('id')).first()
            if obj:
                obj.is_delete = 1
                obj.save()
                result['msg'] = '删除成功'
                result['success'] = True
                return Response(result, status.HTTP_200_OK)
            else:
                result['msg'] = '操作失败,参数错误'
                result['success'] = False
                return Response(result, status.HTTP_400_BAD_REQUEST)
        except Exception as e:
            result['msg'] = '%s' % e
            result['success'] = False
            return Response(result, status.HTTP_500_INTERNAL_SERVER_ERROR)

    # 查询用户
    def get(self, request):
        result = {}
        try:
            data = request.GET
            if 'id' in data.keys():
                obj = User.objects.filter(id=data.get('id')).first()
                if obj:
                    row = UserSerializer(obj).data
                    # 获取关联的角色
                    related_role_id_list = SysUserRole.objects.filter(user_id=data.get('id'))\
                        .values_list('role_id', flat=True)
                    related_roles = SysRole.objects\
                        .filter(id__in=related_role_id_list, is_active=1, is_delete=0).values('id', 'name')
                    row['roles'] = related_roles
                    result['data'] = row
                else:
                    result['data'] = {}
                result['msg'] = '获取成功'
                result['success'] = True
                return Response(result, status.HTTP_200_OK)
            else:
                page_size = int(data.get('pageSize'))
                page_no = int(data.get('pageNo'))
                account = data.get('account')
                name = data.get('name')
                is_active = data.get('isActive')
                sort = data.get('sort')
                if sort:
                    sort_list = sort.split(',')
                else:
                    sort_list = ['-id']
                start = (page_no - 1) * page_size
                end = start + page_size
                filters = {'is_delete': 0, 'is_active': 1}
                if name:
                    filters['name__startswith'] = name
                if account:
                    filters['username__startswith'] = account
                if is_active:
                    if is_active == 'true':
                        is_active = 1
                    else:
                        is_active = 0
                    filters['is_active'] = is_active
                rows = User.objects.filter(**filters).order_by(*sort_list)[start:end]
                rows = UserSerializer(rows, many=True).data
                total = User.objects.filter(**filters).count()
                result['msg'] = '获取成功'
                result['success'] = True
                result['data'] = {}
                result['data']['rows'] = rows
                result['data']['total'] = total
                return Response(result, status.HTTP_200_OK)
        except Exception as e:
            result['msg'] = '获取用户信息失败：%s' % e
            result['success'] = False
            return Response(result, status.HTTP_500_INTERNAL_SERVER_ERROR)
