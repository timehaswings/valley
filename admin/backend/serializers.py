#!/usr/bin/env python
# -*- coding:utf-8 -*-

from rest_framework import serializers
from backend.models import User, SysRole, Tags, Category, BaseVideo, Comment


class UserSerializer(serializers.ModelSerializer):
    create_time = serializers.DateTimeField(source='date_joined', format='%Y-%m-%d %H:%M:%S', required=False)
    update_time = serializers.DateTimeField(format='%Y-%m-%d %H:%M:%S', required=False)
    last_login_time = serializers.DateTimeField(source='last_login', format='%Y-%m-%d %H:%M:%S', required=False)
    account = serializers.CharField(source='username')

    class Meta:
        model = User
        exclude = ['username', 'last_login', 'first_name', 'last_name', 'user_permissions', 'groups', 'date_joined']
        extra_kwargs = {'password': {'write_only': True}, 'is_delete': {'write_only': True},
                        'is_staff': {'write_only': True}}
        read_only_fields = ['update_time', 'create_time', 'last_login_time']


class SysRoleSerializer(serializers.ModelSerializer):
    create_time = serializers.DateTimeField(format='%Y-%m-%d %H:%M:%S', required=False)
    update_time = serializers.DateTimeField(format='%Y-%m-%d %H:%M:%S', required=False)

    class Meta:
        model = SysRole
        fields = '__all__'
        extra_kwargs = {'is_delete': {'write_only': True}}
        read_only_fields = ['create_time', 'update_time']


class TagsSerializer(serializers.ModelSerializer):
    create_time = serializers.DateTimeField(format='%Y-%m-%d %H:%M:%S', required=False)
    update_time = serializers.DateTimeField(format='%Y-%m-%d %H:%M:%S', required=False)

    class Meta:
        model = Tags
        fields = '__all__'
        extra_kwargs = {'is_delete': {'write_only': True}}
        read_only_fields = ['create_time', 'update_time']


class CategorySerializer(serializers.ModelSerializer):
    create_time = serializers.DateTimeField(format='%Y-%m-%d %H:%M:%S', required=False)
    update_time = serializers.DateTimeField(format='%Y-%m-%d %H:%M:%S', required=False)

    class Meta:
        model = Category
        fields = '__all__'
        extra_kwargs = {'is_delete': {'write_only': True}}
        read_only_fields = ['create_time', 'update_time']


class BaseVideoSerializer(serializers.ModelSerializer):
    create_time = serializers.DateTimeField(format='%Y-%m-%d %H:%M:%S', required=False)
    update_time = serializers.DateTimeField(format='%Y-%m-%d %H:%M:%S', required=False)
    release_time = serializers.DateTimeField(format='%Y-%m-%d %H:%M:%S', allow_null=True, required=False)

    class Meta:
        model = BaseVideo
        fields = '__all__'
        extra_kwargs = {'is_delete': {'write_only': True}}
        read_only_fields = ['create_time', 'update_time']


class CommentSerializer(serializers.ModelSerializer):
    create_time = serializers.DateTimeField(format='%Y-%m-%d %H:%M:%S', required=False)

    class Meta:
        model = Comment
        fields = '__all__'
        extra_kwargs = {'is_delete': {'write_only': True}}
        read_only_fields = ['create_time']

