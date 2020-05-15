from django.urls import path, re_path
from backend.user.user_view import UserAPIView
from backend.auth.auth_view import LoginView, LogoutView, CustomAuthToken
from backend.role.role_view import RoleAPIView
from backend.role.user_role_view import UserRolesAPIView
from backend.category.category_view import CategoryAPIView
from backend.tags.tags_view import TagsAPIView
from backend.video.video_view import VideoAPIView
from backend.upload.upload_view import UploadFileView, UploadVideoView
from backend.comment.comment_view import CommentAPIView
from django.views.static import serve
from valley.settings import UPLOAD_ROOT

urlpatterns = [
    re_path(r'^api-token-auth/', CustomAuthToken.as_view()),
    path('api/v1/user', UserAPIView.as_view()),
    path('api/v1/login', LoginView.as_view()),
    path('api/v1/logout', LogoutView.as_view()),
    path('api/v1/role', RoleAPIView.as_view()),
    path('api/v1/comment', CommentAPIView.as_view()),
    path('api/v1/category', CategoryAPIView.as_view()),
    path('api/v1/tags', TagsAPIView.as_view()),
    path('api/v1/video', VideoAPIView.as_view()),
    path('api/v1/user/role', UserRolesAPIView.as_view()),
    path('api/v1/upload/file', UploadFileView.as_view()),
    path('api/v1/upload/video', UploadVideoView.as_view()),
    re_path(r"^upload/(?P<path>.*)/", serve, {"document_root": UPLOAD_ROOT})
]
