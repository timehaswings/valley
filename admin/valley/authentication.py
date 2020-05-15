# -*- coding:utf-8 -*-

from rest_framework.authentication import TokenAuthentication

from django.conf import settings
from rest_framework import exceptions
from django.utils.translation import ugettext_lazy as _
from django.utils import timezone
from django.core.cache import cache
from datetime import timedelta


class ExpiringTokenAuthentication(TokenAuthentication):
    def authenticate_credentials(self, key):
        # 优先从缓存中获取token关联的用户
        print(key + '---')
        cache_user = cache.get(key)
        if cache_user:
            return cache_user, key

        model = self.get_model()
        try:
            token = model.objects.select_related('user').get(key=key)
        except model.DoesNotExist:
            raise exceptions.AuthenticationFailed(_('Invalid token.'))

        if not token.user.is_active:
            raise exceptions.AuthenticationFailed(_('用户已被禁用或者被删除'))

        # 如果token过期则删除token
        if timezone.now() > (token.created + timedelta(minutes=settings.TOKEN_EXPIRE_TIME)):
            token.delete()
            raise exceptions.AuthenticationFailed(_('TokenExpired'))

        if token:
            # 缓存token关联的用户
            cache.set(key, token.user, settings.TOKEN_EXPIRE_TIME * 60)

        return token.user, token
