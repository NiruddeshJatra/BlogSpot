from django.shortcuts import render, redirect, get_object_or_404
from .models import Blog, Profile

# Create your views here.
def home(request):
  blogs = Blog.objects.all()
  return render(request, 'index.html', {'blogs': blogs})

def blog_details(request, slug):
  blog = get_object_or404(Blog, slug=slug)
  return render(request, 'blog_details.html', {'blog': blog})

def authors(request):
  authors = Profile.objects.all()
  return render(request, 'authors.html', {'author': author})

def profile(request, slug):
  profile = get_object_or_404(Profile, slug=slug)
  return render(request, 'profile.html', {'profile': profile})

def create_blog(request):
  return render(request, 'create_blog.html')

def register(request):
  return render(request, 'register.html')

def edit_blog(request, slug):
  blog = get_object_or_404(Blog, slug=slug)
  return redirect('home.html')

def delete_blog(request, slug):
  blog = get_object_or_404(Blog, slug=slug)
  return redirect('home.html')