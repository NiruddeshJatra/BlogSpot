from django import forms
from .models import Blog, Profile, Comment
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User


class UserProfileForm(UserCreationForm):
  first_name = forms.CharField(max_length=30, required=True)
  last_name = forms.CharField(max_length=30, required=True)
  email = forms.EmailField(max_length=254, required=True)
  birthdate = forms.DateField(
    required=False,
    widget=forms.DateInput(
      attrs={
          'type': 'date',
          'placeholder': 'YYYY-MM-DD',
      }
    ),
  )
  about = forms.CharField(widget=forms.Textarea, required=False)
  profilePic = forms.ImageField(required=False)

  class Meta:
    model = User
    fields = [
      "username",
      "first_name",
      "last_name",
      "email",
      "password1",
      "password2",
      "birthdate",
      "about",
      "profilePic",
    ]

  def save(self, commit=True):
    user = super().save(commit=False)
    user.first_name = self.cleaned_data["first_name"]
    user.last_name = self.cleaned_data["last_name"]
    user.email = self.cleaned_data["email"]

    if commit:
      user.save()
      Profile.objects.create(
        author=user,
        birthdate=self.cleaned_data.get("birthdate"),
        about=self.cleaned_data["about"],
        profilePic=self.cleaned_data.get("profilePic"),
      )
    
    return user


class BlogForm(forms.ModelForm):
  class Meta:
    model = Blog
    fields = ("title", "content")


class ProfileEditForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = ['birthdate', 'about', 'profilePic']
        
        
class CommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = ['content']
        widgets = {
            'content': forms.Textarea(attrs={'placeholder': 'Write a comment...'}),
        }