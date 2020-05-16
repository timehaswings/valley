#!/usr/bin/env python
# -*- coding:utf-8 -*-


from rest_framework.views import APIView
from backend.models import Travel
from backend.serializers import TravelSerializer
from rest_framework.response import Response
from rest_framework import status
import logging

logger = logging.getLogger('valley')


class TravelAPIView(APIView):
    '''
    发现管理，新增，修改，删除、查询分类
    '''

    # 新增
    def post(self, request, format=None):
        result = {}
        try:
            data = request.data
            if request.user.id:
                data['uid'] = request.user.id
            if request.user.username:
                data['uname'] = request.user.username
            ip = request.META['REMOTE_ADDR']
            if 'HTTP_X_FORWARDED_FOR' in request.META.keys():
                ip = request.META['HTTP_X_FORWARDED_FOR']
            data['ip'] = ip

            try:
                serializer = TravelSerializer(data=data)
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

    # 查询列表数据
    def get(self, request, format=None):
        result = {}
        try:
            params = request.GET
            if 'id' in params.keys():
                obj = Travel.objects.filter(id=params.get('id')).first()
                result['msg'] = '获取成功'
                result['success'] = True
                result['data'] = TravelSerializer(obj).data
                return Response(result, status.HTTP_200_OK)
            else:
                page_size = int(params.get('pageSize'))
                page_no = int(params.get('pageNo'))
                sort = params.get('sort')
                if sort:
                    sort_list = sort.split(',')
                else:
                    sort_list = ['-id']

                startIndex = (page_no - 1) * page_size
                endIndex = startIndex + page_size
                rows = Travel.objects.order_by(*sort_list)[startIndex:endIndex]
                rows = TravelSerializer(rows, many=True).data
                total = Travel.objects.count()
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
