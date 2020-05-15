#!/usr/bin/env python
# -*- coding:utf-8 -*-


from rest_framework.views import APIView
from backend.models import SysRole, SysUserRole
from rest_framework.response import Response
from rest_framework import status
import logging

logger = logging.getLogger('valley')


class UserRolesAPIView(APIView):
    '''
    系统管理-系统配置-用户管理，给单个用户关联角色
    '''

    # 分配角色
    def post(self, request, format=None):
        result = {}
        try:
            data = request.data
            user_id = data.get('user_id')
            role_id_list = data.get('role_ids')
            for role_id in role_id_list:
                obj = SysUserRole.objects.filter(role_id=role_id, user_id=user_id)
                if not obj.exists():
                    obj = SysUserRole(role_id=role_id, user_id=user_id)
                    obj.save()
            result['msg'] = '分配成功'
            result['success'] = True
            return Response(result, status.HTTP_200_OK)
        except Exception as e:
            result['msg'] = '%s' % e
            result['success'] = False
            return Response(result, status.HTTP_500_INTERNAL_SERVER_ERROR)

    # 取消关联角色
    def delete(self, request, format=None):
        result = {}
        try:
            data = request.data
            user_id = data.get('user_id')
            role_id = data.get('role_id')
            obj = SysUserRole.objects.filter(role_id=role_id, user_id=user_id)
            if obj.exists():
                obj.delete()
            result['msg'] = '取消关联成功'
            result['success'] = True
            return Response(result, status.HTTP_200_OK)
        except Exception as e:
            result['msg'] = '%s' % e
            result['success'] = False
            return Response(result, status.HTTP_500_INTERNAL_SERVER_ERROR)

    # 获取未关联角色
    def get(self, request, format=None):
        result = {}
        try:
            data = request.GET
            # 获取用户已关联角色ID
            related_role_id_list = SysUserRole.objects.filter(user_id=data.get('userId')).\
                values_list('role_id', flat=True)

            # 获取未关联角色
            roles = SysRole.objects.exclude(id__in=related_role_id_list).filter(is_delete=0, is_active=1).\
                order_by('-id').values('id', 'name')
            result['data'] = roles
            result['msg'] = '获取成功'
            result['success'] = True
            return Response(result, status.HTTP_200_OK)
        except Exception as e:
            result['msg'] = '%s' % e
            result['success'] = False
            return Response(result, status.HTTP_500_INTERNAL_SERVER_ERROR)
