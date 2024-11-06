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

    def blog_count(self):
        return Blog.objects.filter(author=self.author, status='published').count()

    blog_count.short_description = "Number of Blogs"

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
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    content = models.TextField()
    status = models.CharField(max_length=10, choices=options, default="draft")

    class Meta:
        ordering = ("-created_at",)

    def save(self, *args, **kwargs):
        super(Blog, self).save(*args, **kwargs)
        if not self.slug:
            self.slug = f"Blog{self.id}"
            self.save(update_fields=["slug"])

    def __str__(self):
        return f"{self.title} by {self.author.username}"


class Notification(models.Model):
    NOTIFICATION_TYPES = (
        ("react", "react"),
        ("comment", "comment"),
        ("status", "status"),
    )
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    blog = models.ForeignKey(Blog, on_delete=models.CASCADE)
    notification_type = models.CharField(max_length=20, choices=NOTIFICATION_TYPES)
    is_read = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.blog.title} - {self.notification_type}"
      
      
class Comment(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    blog = models.ForeignKey(Blog, on_delete=models.CASCADE, related_name="comments")
    content = models.TextField()
    parent = models.ForeignKey("self", on_delete=models.CASCADE, null=True, blank=True, related_name="replies")
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Comment by {self.user.username} on {self.blog.title}"


class React(models.Model):
    REACTION_TYPES = (
        ("love", "🩵"),
        ("sad", "🙄"),
        ("support", "🤝"),
    )
    blog = models.ForeignKey(Blog, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    reaction_type = models.CharField(max_length=20, choices=REACTION_TYPES)

    class Meta:
        unique_together = ('blog', 'user') 