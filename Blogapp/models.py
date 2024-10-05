from typing import Iterable
from django.db import models
from django.utils.text import slugify
from django.contrib.auth.admin import User


# Create your models here.
class Profile(models.Model):
    author = models.OneToOneField(User, on_delete=models.CASCADE)
    slug = models.SlugField(max_length=30, unique=True)
    birthdate = models.DateField()
    about = models.TextField()
    profilePic = models.ImageField(upload_to="profiles/", blank=True)

    class Meta:
        ordering = ["author__username"]

    def __str__(self) -> str:
        return self.author.username

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.author.username)
        super(Profile, self).save(*args, **kwargs)

class Blog(models.Model):
    options = (
        ("draft", "Draft"),
        ("submitted", "Submitted"),
        ("reviewed", "Reviewed"),
        ("published", "Published"),
        ("rejected", "Rejected"),
    )

    title = models.CharField(max_length=250)
    slug = models.SlugField(max_length=50, unique=True)
    created_at = models.DateTimeField(auto_now_add=True)
    last_edited = models.DateTimeField(auto_now=True)
    author = models.OneToOneField(User, on_delete=models.CASCADE)
    content = models.TextField()
    status = models.CharField(max_length=10, choices=options, default="draft")
    
    class Meta:
        ordering = ('-created_at',)
        
    def save(self, *args, **kwargs):
        if not self.slug:
            count = Blog.objects.count() + 1
            self.slug = f"blog{count}"
        super(Blog, self).save(*args, **kwargs)
        
    def __str__(self):
        return f"{self.title} by {self.author.username}"
