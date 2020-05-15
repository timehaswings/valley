#!/usr/bin/env python
# -*- coding:utf-8 -*-

from rest_framework import status
from rest_framework.parsers import MultiPartParser
from rest_framework.views import APIView
from rest_framework.response import Response
import datetime
import ffmpeg
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
                        info = ffmpeg.probe('D:\\Res\\video\\animation-intro.mp4')
                        print(file_absolute_path)
                        print(info)
                        output = os.path.join(fileDir, name + ".m3u8").replace("\"", "")
                        ffmpeg.input(file_absolute_path).output(output, format='hls', start_number=0, hls_time=10,
                                                                hls_list_size=0).run()
                        file_relative_path = os.path.join(subdir, name + ".m3u8")
                    except Exception as ex:
                        print('视频转化m3u8失败: %s' % ex)
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
