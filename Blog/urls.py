from django.urls import path
from . import views
app_name = 'blog'

urlpatterns = [
    path('', views.home, name='home'),
    path('blog/<slug:slug>/', views.blog_details, name='blog_details'),
    path('authors/', views.authors, name='authors'),
    path('create/', views.create_blog, name='create_blog'),
    path('delete/<slug:slug>/', views.delete_blog, name='delete_blog'),
    path('edit/<slug:slug>/', views.edit_blog, name='edit_blog'),
    path('register/', views.register, name='register'),
]