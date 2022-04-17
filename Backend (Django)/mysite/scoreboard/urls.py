from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('upload/<str:game>/', views.upload_score),
    path('leaderboard/<str:game>/', views.get_leaderboard)
]