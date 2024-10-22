from .models import Notification

def notification_processor(request):
    if request.user.is_authenticated:
      user_notifications = Notification.objects.filter(user=request.user, is_read=False)
      notification_count = user_notifications.count()
    else:
      notification_count = 0
      user_notifications = []
    
    return {
      'notification_count': notification_count,
      'user_notifications': user_notifications
    }