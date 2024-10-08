from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.contrib.auth.models import User
from .models import Blog, Profile


# Register your models here.
class BlogAdmin(admin.ModelAdmin):
    list_display = ("title", "author_username", "created_at", "status")
    search_fields = ("title", "author_username", "status")
    list_filter = ("status",)
    ordering = ("-created_at",)
    list_editable = ("status",)
    readonly_fields = (
        "title",
        "author_username",
        "created_at",
    )
    actions = ["make_published"]
    list_per_page = 25

    def make_published(self, request, queryset):
        queryset.update(status="published")

    make_published.short_description = "Mark selected items as published"

    def author_username(self, obj):
        return obj.author.username

    author_username.short_description = "Author Username"


admin.site.register(Blog, BlogAdmin)


class ProfileAdmin(admin.ModelAdmin):
    list_display = ("author_username", "full_name", "birthdate", "blog_count")
    search_fields = ("author_username",)
    readonly_fields = ("author_username", "full_name", "birthdate", "blog_count")
    list_per_page = 25

    def author_username(self, obj):
        return obj.author.username

    author_username.short_description = "Author Username"

    def full_name(self, obj):
        return f"{obj.author.first_name} {obj.author.last_name}"

    full_name.short_description = "Full Name"


admin.site.register(Profile, ProfileAdmin)


class ProfileInline(admin.StackedInline):
    model = Profile
    can_delete = False
    verbose_name_plural = "Profile"
    fields = ("birthdate", "about", "profilePic")


class UserAdmin(BaseUserAdmin):
    inlines = (ProfileInline,)


admin.site.unregister(User)
admin.site.register(User, UserAdmin)
