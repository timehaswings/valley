from django.db import models
from django.contrib.auth.models import AbstractUser


# Create your models here.
class User(AbstractUser):
    name = models.CharField(max_length=50, verbose_name='姓名')
    mobile = models.CharField(max_length=11, verbose_name='手机号')
    creater_id = models.IntegerField(default=0, verbose_name='创建人ID')
    updater_id = models.IntegerField(default=0, verbose_name='更新人ID')
    update_time = models.DateTimeField(auto_now=True, verbose_name='更新时间')
    is_delete = models.BooleanField(default=False, verbose_name='是否删除')

    class Meta:
        db_table = 'tb_user'  # 指明数据库表名
        verbose_name = '系统用户表'  # 在admin站点中显示的名称
        verbose_name_plural = verbose_name  # 显示的复数名称


class RefreshToken(models.Model):
    key = models.CharField(max_length=80, verbose_name='key')
    created = models.DateTimeField(verbose_name='创建时间')
    user_id = models.IntegerField(unique=True, verbose_name='创建人ID')

    class Meta:
        db_table = 'tb_refresh_token'
        verbose_name = 'refresh token表'
        verbose_name_plural = verbose_name


# 角色管理表
class SysRole(models.Model):
    id = models.AutoField(primary_key=True, verbose_name='自增id')
    name = models.CharField(max_length=50, verbose_name='角色名称')
    desc = models.CharField(max_length=300, null=True, blank=True, verbose_name='角色描述')
    is_active = models.BooleanField(default=1, verbose_name='是否启用')
    creater_id = models.IntegerField(verbose_name='创建人ID')
    creater_name = models.CharField(max_length=10, verbose_name='创建姓名')
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    updater_name = models.CharField(max_length=10, verbose_name='更新人姓名')
    updater_id = models.IntegerField(verbose_name='更新人ID')
    update_time = models.DateTimeField(auto_now=True, verbose_name='更新时间')
    is_delete = models.BooleanField(default=False, verbose_name='是否已删除')

    class Meta:
        db_table = 'tb_sys_role'
        verbose_name = '系统角色表'
        verbose_name_plural = verbose_name


# 用户和角色关联表
class SysUserRole(models.Model):
    id = models.AutoField(primary_key=True, verbose_name='自增id')
    user_id = models.IntegerField(verbose_name='用户ID')
    role_id = models.IntegerField(verbose_name='角色ID')

    class Meta:
        db_table = 'tb_sys_user_role'
        verbose_name = '用户角色关联表'
        verbose_name_plural = verbose_name


# 标签管理表
class Tags(models.Model):
    id = models.AutoField(primary_key=True, verbose_name='自增id')
    name = models.CharField(max_length=50, verbose_name='标签名称')
    desc = models.CharField(max_length=300, null=True, blank=True, verbose_name='标签描述')
    is_active = models.BooleanField(default=1, verbose_name='是否启用')
    creater_id = models.IntegerField(verbose_name='创建人ID')
    creater_name = models.CharField(max_length=10, verbose_name='创建姓名')
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    updater_name = models.CharField(max_length=10, verbose_name='更新人姓名')
    updater_id = models.IntegerField(verbose_name='更新人ID')
    update_time = models.DateTimeField(auto_now=True, verbose_name='更新时间')
    is_delete = models.BooleanField(default=False, verbose_name='是否已删除')

    class Meta:
        db_table = 'tb_tags'
        verbose_name = '标签表'
        verbose_name_plural = verbose_name


# 分类管理表
class Category(models.Model):
    id = models.AutoField(primary_key=True, verbose_name='自增id')
    name = models.CharField(max_length=50, verbose_name='分类名称')
    desc = models.CharField(max_length=300, null=True, blank=True, verbose_name='分类描述')
    is_active = models.BooleanField(default=1, verbose_name='是否启用')
    creater_id = models.IntegerField(verbose_name='创建人ID')
    creater_name = models.CharField(max_length=10, verbose_name='创建姓名')
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    updater_name = models.CharField(max_length=10, verbose_name='更新人姓名')
    updater_id = models.IntegerField(verbose_name='更新人ID')
    update_time = models.DateTimeField(auto_now=True, verbose_name='更新时间')
    is_delete = models.BooleanField(default=False, verbose_name='是否已删除')

    class Meta:
        db_table = 'tb_category'
        verbose_name = '分类表'
        verbose_name_plural = verbose_name


# 视频管理表
class BaseVideo(models.Model):
    id = models.AutoField(primary_key=True, verbose_name='自增id')
    guid = models.CharField(blank=True, max_length=50, verbose_name='全局唯一标识')
    name = models.CharField(max_length=200, verbose_name='视频名称')
    desc = models.CharField(blank=True, max_length=500, verbose_name='视频描述')
    artists = models.CharField(default='', max_length=200, verbose_name='演员')
    release_time = models.DateTimeField(null=True, verbose_name='上映时间')
    res_url = models.CharField(max_length=300, verbose_name='视频地址')
    thumbnail_url = models.CharField(max_length=300, verbose_name='缩略图')
    cover_url = models.CharField(max_length=300, verbose_name='封面图')
    is_active = models.BooleanField(default=1, verbose_name='是否启用')
    creater_id = models.IntegerField(verbose_name='创建人ID')
    creater_name = models.CharField(max_length=10, verbose_name='创建人姓名')
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    updater_id = models.IntegerField(verbose_name='更新人ID')
    updater_name = models.CharField(max_length=10, verbose_name='更新人姓名')
    update_time = models.DateTimeField(auto_now=True, verbose_name='更新时间')
    is_delete = models.BooleanField(default=False, verbose_name='是否已删除')
    category = models.ForeignKey(Category, default=1, on_delete=models.DO_NOTHING, verbose_name='视频类别')
    tags = models.ManyToManyField(Tags, default=1, verbose_name='视频标签')

    class Meta:
        db_table = 'tb_base_video'
        verbose_name = '视频表单'
        verbose_name_plural = verbose_name


# 评论管理表
class Comment(models.Model):
    id = models.AutoField(primary_key=True, verbose_name='自增id')
    content = models.CharField(max_length=500, verbose_name='评论内容')
    score = models.DecimalField(default=0.0, max_digits=4, decimal_places=2, verbose_name='评分')
    creater_id = models.IntegerField(verbose_name='创建人ID')
    creater_name = models.CharField(max_length=10, verbose_name='创建姓名')
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    is_delete = models.BooleanField(default=False, verbose_name='是否已删除')
    video = models.ForeignKey(BaseVideo, on_delete=models.DO_NOTHING,  verbose_name='视频')

    class Meta:
        db_table = 'tb_comment'
        verbose_name = '评论表'
        verbose_name_plural = verbose_name


# 发现管理表
class Discover(models.Model):
    id = models.AutoField(primary_key=True, verbose_name='自增id')
    name = models.CharField(max_length=50, verbose_name='名称')
    content = models.TextField(null=True, blank=True, verbose_name='内容')
    is_active = models.BooleanField(default=1, verbose_name='是否启用')
    creater_id = models.IntegerField(verbose_name='创建人ID')
    creater_name = models.CharField(max_length=10, verbose_name='创建姓名')
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    updater_name = models.CharField(max_length=10, verbose_name='更新人姓名')
    updater_id = models.IntegerField(verbose_name='更新人ID')
    update_time = models.DateTimeField(auto_now=True, verbose_name='更新时间')
    is_delete = models.BooleanField(default=False, verbose_name='是否已删除')

    class Meta:
        db_table = 'tb_discover'
        verbose_name = '发现表'
        verbose_name_plural = verbose_name


# 用户轨迹
class Travel(models.Model):
    id = models.AutoField(primary_key=True, verbose_name='自增id')
    uid = models.IntegerField(default=0, verbose_name='用户ID')
    vid = models.IntegerField(default=0, verbose_name='视频ID')
    ip = models.CharField(max_length=20, verbose_name='ip地址')
    action = models.CharField(max_length=40, verbose_name='访问路径')
    access_time = models.DateTimeField(auto_now_add=True, verbose_name='发生时间')

    class Meta:
        db_table = 'tb_travel'
        verbose_name = '用户轨迹表'
        verbose_name_plural = verbose_name


# 网站配置
class Config(models.Model):
    id = models.AutoField(primary_key=True, verbose_name='自增id')
    name = models.CharField(max_length=20, verbose_name='变量key')
    value = models.CharField(max_length=20, verbose_name='变量value')

    class Meta:
        db_table = 'tb_config'
        verbose_name = '网站配置表'
        verbose_name_plural = verbose_name

