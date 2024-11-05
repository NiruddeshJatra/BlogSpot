from django.shortcuts import render, redirect, get_object_or_404
from .models import Blog, Profile, Notification
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib import messages
from django.contrib.auth import authenticate, login
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from .forms import UserProfileForm, BlogForm, ProfileEditForm


# Create your views here.
def home(request):
	blogs = Blog.objects.filter(status='published').all()
	per_page = 10 if request.GET.get('screen_size') == 'small' else 12
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


@login_required
def edit_profile(request):
    profile = get_object_or_404(Profile, author=request.user)
    if request.method == "POST":
        form = ProfileEditForm(request.POST, request.FILES, instance=profile)
        if form.is_valid():
            form.save()
            messages.success(request, "Profile updated successfully!")
            return redirect('blogapp:profile', username=request.user.username)
    else:
        form = ProfileEditForm(instance=profile)

    return render(request, 'edit_profile.html', {'form': form})


def custom_login(request):
  if request.method == "POST":
    form = AuthenticationForm(request, data=request.POST)
    if form.is_valid():
      username = form.cleaned_data.get('username')
      password = form.cleaned_data.get('password')
      user = authenticate(request, username=username, password=password)

      if user is not None:
        login(request, user)
        return redirect('blogapp:home')
      else:
        messages.error(request, "Invalid username or password.")
    else:
      messages.error(request, "Invalid username or password.")
  else:
      form = AuthenticationForm()

  return render(request, "login.html", {"form": form})
  

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


@login_required
@csrf_exempt
def mark_notifications_read(request):
  if request.method == "POST":
    Notification.objects.filter(user=request.user, is_read=False).update(is_read=True)
    return JsonResponse({"success": True})
  
  
