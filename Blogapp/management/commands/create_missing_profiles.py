from django.core.management.base import BaseCommand
from django.contrib.auth.models import User
from Blogapp.models import Profile

class Command(BaseCommand):
    help = 'Create missing Profile instances for users without profiles.'

    def handle(self, *args, **kwargs):
        users_without_profiles = User.objects.filter(profile__isnull=True)
        
        for user in users_without_profiles:
            Profile.objects.create(
                author=user,
                slug=user.username,
                birthdate=None,
                about="",
                profilePic=None
            )
            self.stdout.write(self.style.SUCCESS(f'Profile created for user: {user.username}'))
        
        self.stdout.write(self.style.SUCCESS('All missing profiles have been created.'))
