from django.db import models
from django.utils.text import slugify
from django.contrib.auth.admin import User

# Create your models here.
class Profile(models.Model):
    author = models.OneToOneField(User, on_delete=models.CASCADE)
    slug = models.SlugField(max_length=10, unique=True)
    birthdate = models.DateField()
    about = models.TextField()
    profilePic = models.ImageField(upload_to='profiles/', blank=True)
    
    