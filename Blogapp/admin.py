from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User
from .models import Blog, Profile, Notification


# Register your models here.
class BlogAdmin(admin.ModelAdmin):
    list_display = ("title", "author", "created_at")
    search_fields = ("title", "author")
    autocomplete_fields = ["author"]
    list_filter = ("status",)
    ordering = ("-created_at",)
    readonly_fields = ("title", "author", "created_at", "slug", "content", "status")
    actions = ['publish_blogs', 'reject_blogs']
    list_per_page = 25

    def get_queryset(self, request):
        qs = super().get_queryset(request)
        return qs.exclude(status='draft')

    def change_view(self, request, object_id, form_url='', extra_context=None):
        blog = self.get_object(request, object_id)
        if blog.status == 'submitted':
            blog.status = 'reviewed'
            blog.save()
            Notification.objects.create(
                user=blog.author,
                blog=blog,
                notification_type='status'
            )
        return super().change_view(request, object_id, form_url, extra_context)

    def publish_blogs(self, request, queryset):
        queryset.update(status='published')
        self.message_user(request, "Selected blogs have been published.")
        for blog in queryset:
            Notification.objects.create(
                user=blog.author,
                blog=blog,
                notification_type='status'
            )

    def reject_blogs(self, request, queryset):
        queryset.update(status='rejected')
        self.message_user(request, "Selected blogs have been rejected.")
        for blog in queryset:
            Notification.objects.create(
                user=blog.author,
                blog=blog,
                notification_type='status'
            )

    def save_model(self, request, obj, form, change):
        if change and 'status' in form.changed_data:
            Notification.objects.create(
                user=obj.author,
                blog=obj,
                notification_type='status'
            )
        super().save_model(request, obj, form, change)

    publish_blogs.short_description = "Publish selected blogs"
    reject_blogs.short_description = "Reject selected blogs"

admin.site.register(Blog, BlogAdmin)


class ProfileAdmin(admin.ModelAdmin):
	list_display = ("author", "full_name", "about", "blog_count")
	search_fields = ("author", "full_name")
	autocomplete_fields = ['author']
	readonly_fields = ("author", "full_name", "birthdate", "blog_count", "slug", "about", "profilePic")
	list_per_page = 25
	
	def full_name(self, obj):
		return f"{obj.author.first_name} {obj.author.last_name}"

	full_name.short_description = "Full Name"

admin.site.register(Profile, ProfileAdmin)


class ReadOnlyUserAdmin(UserAdmin):
	readonly_fields = [field.name for field in User._meta.fields]

	def save_model(self, request, obj, form, change):
		pass

admin.site.unregister(User)
admin.site.register(User, ReadOnlyUserAdmin)