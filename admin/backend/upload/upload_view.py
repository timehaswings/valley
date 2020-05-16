#!/usr/bin/env python
# -*- coding:utf-8 -*-

from rest_framework import status
from rest_framework.parsers import MultiPartParser
from rest_framework.views import APIView
from rest_framework.response import Response
import backend.common.video_handler as handler
import datetime
import logging
import uuid
import os
from valley.settings import UPLOAD_ROOT

logger = logging.getLogger("valley")


class UploadFileView(APIView):
    parser_classes = (MultiPartParser,)

    def post(self, request, format=None):
        files = request.FILES.getlist("attachment", None)
        result = {}
        files_address = []
        try:
            fileDir = os.path.join(UPLOAD_ROOT, 'attachments', str(uuid.uuid4()))
            if (not os.path.exists(fileDir)) and len(files) != 0:  # 如果路径不存在
                os.makedirs(fileDir)
            try:
                for file in files:
                    file_absolute_path = os.path.join(fileDir, file.name).replace("\"", "")
                    file_handler = open(file_absolute_path, 'wb')  # 打开特定的文件进行二进制的写操作
                    try:
                        for chunk in file.chunks():  # 分块写入文件
                            file_handler.write(chunk)
                    finally:
                        file_handler.close()
                    files_address.append(file_absolute_path)
            except Exception as e:
                logger.error(e)
            result['msg'] = '查询成功'
            result['success'] = True
            result['data'] = files_address
            return Response(result, status.HTTP_200_OK)
        except Exception as e:
            logger.error(e)
            result['msg'] = '查询失败 %s' % e
            result['success'] = False
            return Response(result, status.HTTP_500_INTERNAL_SERVER_ERROR)


class UploadVideoView(APIView):
    parser_classes = (MultiPartParser,)

    def post(self, request, format=None):
        files = request.FILES.getlist("video", None)
        result = {}
        files_address = []
        try:
            subdir = os.path.join('videos', str(uuid.uuid4()))
            fileDir = os.path.join(UPLOAD_ROOT, subdir)
            if (not os.path.exists(fileDir)) and len(files) != 0:  # 如果路径不存在
                os.makedirs(fileDir)
            try:
                for file in files:
                    ext = os.path.splitext(file.name)[1]
                    name = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
                    file_relative_path = os.path.join(subdir, name + ext)
                    file_absolute_path = os.path.join(fileDir, name + ext).replace("\"", "")
                    file_handler = open(file_absolute_path, 'wb')  # 打开特定的文件进行二进制的写操作
                    try:
                        for chunk in file.chunks():  # 分块写入文件
                            file_handler.write(chunk)
                    finally:
                        file_handler.close()
                    try:
                        out_path = os.path.join(fileDir, 'out.m3u8').replace("\"", "")
                        cover_path = os.path.join(fileDir, 'cover.jpeg').replace("\"", "")
                        thumb_path = os.path.join(fileDir, 'thumb.jpeg').replace("\"", "")
                        handler.create_m3u8(file_absolute_path, out_path, cover_path, thumb_path)
                        file_relative_path = os.path.join(subdir, 'out.m3u8')
                    except Exception as ex:
                        logger.error(ex)
                    files_address.append(file_relative_path)
            except Exception as e:
                logger.error(e)
            result['msg'] = '上传成功'
            result['success'] = True
            result['data'] = files_address
            return Response(result, status.HTTP_200_OK)
        except Exception as e:
            logger.error(e)
            result['msg'] = '上传失败 %s' % e
            result['success'] = False
            return Response(result, status.HTTP_500_INTERNAL_SERVER_ERROR)
