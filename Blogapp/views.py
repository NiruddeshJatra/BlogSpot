from django.shortcuts import render, redirect, get_object_or_404
from .models import Blog, Profile
from django.contrib.auth.admin import User
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
	
	return render(request, "index.html", {"blogs": page_obj})

def blog_details(request, slug):
	blog = get_object_or_404(Blog, slug=slug)
	return render(request, "blog_details.html", {"blog": blog})


def authors(request):
  authors = Profile.objects.all()
  return render(request, "authors.html", {"authors": authors})


def profile(request, username):
	current_user = get_object_or_404(User, username=username)
	profile = get_object_or_404(Profile, author=current_user)
	if status_filter := request.GET.get('status'):
		blogs = Blog.objects.filter(author=current_user, status=status_filter)
	else:
		blogs = Blog.objects.filter(author=current_user, status='published')

	return render(request, "profile.html", {"current_user": current_user, "profile": profile, "blogs": blogs})


@login_required
def create_blog(request, slug=None):
	blog = None
	if slug:
		blog = get_object_or_404(Blog, slug=slug, author=request.user)

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

	return render(request, "create_blog.html", {"form": form, "blog": blog})


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
def edit_blog(request, slug):
    blog = get_object_or_404(Blog, slug=slug, author=request.user)
    if request.method == 'POST':
        form = BlogForm(request.POST, instance=blog)
        if form.is_valid():
            form.save()
            return redirect('blogapp:blog_details', slug=blog.slug)
    else:
        form = BlogForm(instance=blog)

    return render(request, 'create_blog.html', {'form': form, 'blog': blog})


@login_required
def delete_blog(request, slug):
    blog = get_object_or_404(Blog, slug=slug, author=request.user)
    blog.delete()
    return redirect("blogapp:profile", username=request.user.username)
