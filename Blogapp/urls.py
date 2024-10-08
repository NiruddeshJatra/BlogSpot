from django.urls import path
from . import views
from django.contrib.auth import views as auth_views

app_name = 'blogapp'

urlpatterns = [
    path('', views.home, name='home'),
    path('blog/<slug:slug>/', views.blog_details, name='blog_details'),
    path('profile/<str:username>/', views.profile, name='profile'),
    path('authors/', views.authors, name='authors'),
    path('create/', views.create_blog, name='create_blog'),
    path('delete/<slug:slug>/', views.delete_blog, name='delete_blog'),
    path('edit/<slug:slug>/', views.edit_blog, name='edit_blog'),
    path('register/', views.register, name='register'),
    path('login/', auth_views.LoginView.as_view(template_name='login.html'), name='login'),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
]