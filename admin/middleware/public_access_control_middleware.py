#!/usr/bin/env python
# -*- coding:utf-8 -*-


from django.utils.deprecation import MiddlewareMixin


class PublicAccessControlMiddleware(MiddlewareMixin):
    def process_request(self, request):
        pass

    def process_response(self, request, response):
        response['Access-Control-Max-Age'] = 86400
        return response
