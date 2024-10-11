from django.shortcuts import render, redirect, get_object_or_404
from .models import Blog, Profile
from django.contrib.auth import login
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from .forms import UserProfileForm, BlogForm


# Create your views here.
def home(request):
	blogs = Blog.objects.filter(status='published').all()
	per_page = 5 if request.GET.get('screen_size') == 'small' else 12
	paginator = Paginator(blogs, per_page)
	page_number = request.GET.get('page')
	page_obj = paginator.get_page(page_number)
	
	return render(request, "home.html", {"blogs": page_obj})


def blog_details(request, slug):
	blog = get_object_or_404(Blog, slug=slug)
	return render(request, "blog_details.html", {"blog": blog})


def authors(request):
  authors = Profile.objects.all()
  return render(request, "authors.html", {"authors": authors})


def profile(request, username):
	profile_info = get_object_or_404(Profile, author__username=username)
	if status_filter := request.GET.get('status'):
		blogs = Blog.objects.filter(author=profile_info.author, status=status_filter)
	else:
		blogs = Blog.objects.filter(author=profile_info.author, status='published')

	return render(request, "profile.html", {"profile_info": profile_info, "blogs": blogs})


@login_required
def create_or_edit_blog(request, slug=None):
	blog = get_object_or_404(Blog, slug=slug) if slug else None
	if request.method == "POST":
		form = BlogForm(request.POST, instance=blog)
		if form.is_valid():
			blog = form.save(commit=False)
			blog.author = request.user
			blog.status = "draft" if request.POST.get("status") == "draft" else "submitted"
			blog.save()
			return redirect("blogapp:home")
	else:
		form = BlogForm(instance=blog)

	return render(request, "create_or_edit_blog.html", {"form": form, "blog": blog})


def register(request):
  if request.method == "POST":
    form = UserProfileForm(request.POST, request.FILES)
    if form.is_valid():
      user = form.save()
      login(request, user)
      return redirect("blogapp:home")
  else:
    form = UserProfileForm()

  return render(request, "register.html", {"form": form})


@login_required
def delete_blog(request, slug):
  blog = get_object_or_404(Blog, slug=slug, author=request.user)
  blog.delete()
  return redirect("blogapp:profile", username=request.user.username)
