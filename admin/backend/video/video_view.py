#!/usr/bin/env python
# -*- coding:utf-8 -*-


from rest_framework.views import APIView
from backend.models import BaseVideo
from backend.serializers import BaseVideoSerializer, TagsSerializer
from rest_framework.response import Response
from rest_framework import status
import uuid
import logging

from rest_framework import permissions

logger = logging.getLogger('valley')


class VideoAPIView(APIView):

    permission_classes = (permissions.IsAuthenticated,)

    '''
    视频管理-新增、删除、修改、查询
    '''

    # 新增
    def post(self, request, format=None):
        result = {}
        try:
            data = request.data
            data['creater_id'] = request.user.id
            data['updater_id'] = data['creater_id']
            data['creater_name'] = request.user.username
            data['updater_name'] = data['creater_name']
            data['is_delete'] = False
            data['guid'] = str(uuid.uuid1().int)
            try:
                serializer = BaseVideoSerializer(data=data)
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

    # 修改
    def patch(self, request, format=None):
        result = {}
        try:
            data = request.data
            data['updater_id'] = request.user.id
            data['updater_name'] = request.user.username

            obj = BaseVideo.objects.filter(id=data.get('id')).first()
            if obj:
                try:
                    serializer = BaseVideoSerializer(obj, data=data, partial=True)
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
                result['msg'] = '操作失败,对象不存在'
                result['success'] = False
                return Response(result, status.HTTP_404_NOT_FOUND)
        except Exception as e:
            result['msg'] = '%s' % e
            result['success'] = False
            return Response(result, status.HTTP_500_INTERNAL_SERVER_ERROR)

    # 删除
    def delete(self, request, format=None):
        result = {}
        try:
            data = request.data
            if 'id' not in data.keys():
                result['msg'] = '删除失败，参数错误'
                result['success'] = False
                return Response(result, status.HTTP_200_OK)
            obj = BaseVideo.objects.filter(id=data.get('id')).first()
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
            if 'id' in params.keys():
                obj = BaseVideo.objects.filter(id=params.get('id')).first()
                value = BaseVideoSerializer(obj).data
                tags = obj.tags.all()
                value['categoryName'] = obj.category.name
                value['tagsMsg'] = TagsSerializer(tags, many=True).data
                result['msg'] = '获取成功'
                result['success'] = True
                result['data'] = value
                return Response(result, status.HTTP_200_OK)
            else:
                filters = {'is_delete': 0}
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
                if is_active:
                    is_active = 0 if is_active == 'false' else 1
                    filters['is_active'] = is_active
                if name:
                    filters['name__startswith'] = name
                rows = BaseVideo.objects.filter(**filters).order_by(*sort_list)[startIndex:endIndex]
                rows = BaseVideoSerializer(rows, many=True).data
                total = BaseVideo.objects.filter(**filters).count()

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
