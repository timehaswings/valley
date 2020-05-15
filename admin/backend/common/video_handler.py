#!/usr/bin/env python
# -*- coding:utf-8 -*-
from ffmpy import FFmpeg


def create_m3u8(video_path, out_path, cover_path, thumb_path):
    """
    操作ffmpeg执行
    :param video_path: 处理输入流视频
    :param cover_path: 封面图路径
    :param out_path: 合成Ts流和 *.m3u8文件
    """
    ff = FFmpeg(inputs={video_path: None},
                     outputs={cover_path: '-y -f mjpeg -ss 0 -t 0.001',
                              out_path: '-map 0 -c:v h264',
                              thumb_path: '-ss 00:00:05 -vframes 1', })
    ff.run()


def create_thumb(video_path, thumb_path):
    """
    操作ffmpeg执行
    :param video_path: 处理输入流视频
    :param thumb_path: 缩略图路径
    :return:
    """
    ff = FFmpeg(inputs={video_path: None},
                outputs={thumb_path: '-ss 00:00:05 -vframes 1'})
    ff.run()


def execCmd(cmd):
    """
    执行计算命令时间
    """
    r = os.popen(cmd)
    text = r.read().strip()
    r.close()
    return text

