#!/usr/bin/env python
# -*- coding:utf-8 -*-


from rest_framework.views import APIView
from backend.models import SysRole
from backend.serializers import SysRoleSerializer
from rest_framework.response import Response
from rest_framework import status
import logging

logger = logging.getLogger('valley')


class RoleAPIView(APIView):
    '''
    系统管理-系统配置-角色管理，新增，修改，删除角色
    '''

    # 新增角色
    def post(self, request, format=None):
        result = {}
        try:
            data = request.data
            data['creater_id'] = request.user.id
            data['updater_id'] = request.user.id
            data['creater_name'] = request.user.username
            data['updater_name'] = request.user.username
            data['is_delete'] = False
            try:
                serializer = SysRoleSerializer(data=data)
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

    # 修改角色
    def patch(self, request, format=None):
        result = {}
        try:
            data = request.data
            data['updater_id'] = request.user.id
            data['updater_name'] = request.user.username

            obj = SysRole.objects.filter(id=data.get('role_id')).first()
            del data['role_id']
            if obj:
                try:
                    serializer = SysRoleSerializer(obj, data=data, partial=True)
                    serializer.is_valid(raise_exception=True)
                    serializer.save()
                except Exception as e:
                    result['msg'] = '操作失败：%s' % e
                    result['success'] = False
                    return Response(result, status.HTTP_400_BAD_REQUEST)

                result['msg'] = '操作成功'
                result['success'] = True

                temp_data = {}
                data_keys = list(data.keys())
                data_keys.append('update_time')
                for key in data_keys:
                    temp_data[key] = serializer.data.get(key)
                result['data'] = temp_data
                return Response(result, status.HTTP_200_OK)
            else:
                result['msg'] = '操作失败,角色不存在'
                result['success'] = False
                return Response(result, status.HTTP_404_NOT_FOUND)
        except Exception as e:
            result['msg'] = '%s' % e
            result['success'] = False
            return Response(result, status.HTTP_500_INTERNAL_SERVER_ERROR)

    # 删除角色
    def delete(self, request, format=None):
        result = {}
        try:
            data = request.data
            obj = SysRole.objects.filter(id=data.get('role_id')).first()
            if obj:
                obj.is_delete = 1
                obj.save()
            result['msg'] = '删除成功'
            result['success'] = True
            return Response(result, status.HTTP_200_OK)
        except Exception as e:
            result['msg'] = '%s' % e
            result['success'] = False
            return Response(result, status.HTTP_500_INTERNAL_SERVER_ERROR)

    # 查询列表数据
    def get(self, request, format=None):
        result = {}
        try:
            params = request.GET
            page_size = int(params.get('pageSize'))
            page_no = int(params.get('pageNo'))
            is_active = params.get('isActive')
            name = params.get('name')
            sort = params.get('sort')
            if sort:
                sort_list = sort.split(',')
            else:
                sort_list = ['-id']

            startIndex = (page_no - 1) * page_size
            endIndex = startIndex + page_size
            filters = {'is_delete': 0}
            if is_active != '':
                if is_active == 'true':
                    is_active = 1
                else:
                    is_active = 0
                filters['is_active'] = is_active
            if name:
                filters['name__startswith'] = name

            rows = SysRole.objects.filter(**filters).order_by(*sort_list)[startIndex:endIndex]
            rows = SysRoleSerializer(rows, many=True).data
            total = SysRole.objects.filter(**filters).count()

            result['msg'] = '获取成功'
            result['success'] = True
            result['data'] = {}
            result['data']['rows'] = rows
            result['data']['total'] = total
            return Response(result, status.HTTP_200_OK)
        except Exception as e:
            result['msg'] = '%s' % e
            result['success'] = False
            return Response(result, status.HTTP_500_INTERNAL_SERVER_ERROR)
