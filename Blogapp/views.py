from django.shortcuts import render, redirect, get_object_or_404
from .models import Blog, Profile
from django.contrib.auth.admin import User
from django.contrib.auth import login
from .forms import UserProfileForm, BlogForm

# Create your views here.
def home(request):
  blogs = Blog.objects.all()
  return render(request, 'index.html', {'blogs': blogs})

def blog_details(request, slug):
  blog = get_object_or_404(Blog, slug=slug)
  return render(request, 'blog_details.html', {'blog': blog})

def authors(request):
  authors = Profile.objects.all()
  return render(request, 'authors.html', {'authors': authors})

def profile(request, username):
  user = get_object_or_404(User, username=username)
  profile = get_object_or_404(Profile, author=user)
  blogs = Blog.objects.filter(author=user)

  context = {
      'user': user,
      'profile': profile,
      'blogs': blogs,
  }
  return render(request, 'profile.html', context)

def create_blog(request):
  if request.method == 'POST':
    form = BlogForm(request.POST)
    if form.is_valid():
      blog = form.save()
      blog.author = User.objects.get(id=request.POST['author'])
      blog.save()
      return redirect('blogapp:home')
  else:
    form = BlogForm()
    
  authors = Profile.objects.select_related('author').all()
  return render(request, 'create_blog.html', {'form': form, 'authors': authors})

def register(request):
  if request.method == 'POST':
    form = UserProfileForm(request.POST, request.FILES)
    if form.is_valid():
      user = form.save()
      login(request, user)
      return redirect('blogapp:home')
  else:
    form = UserProfileForm()
    
  return render(request, 'register.html', {'form': form})
  
def edit_blog(request, slug):
  blog = get_object_or_404(Blog, slug=slug)
  return redirect('blogapp:home')

def delete_blog(request, slug):
  blog = get_object_or_404(Blog, slug=slug)
  return redirect('blogapp:home')