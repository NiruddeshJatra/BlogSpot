"""
WSGI config for BlogSpot project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/5.1/howto/deployment/wsgi/
"""

import os
import sys

from django.core.wsgi import get_wsgi_application

# sys.path.append('/home/blogspot/public_html/BlogSpot/')

# activate_this = '/home/blogspot/public_html/BlogSpot/blogspot_venv/bin/activate_this.py'
# exec(open(activate_this).read(), dict(__file__=activate_this))

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'BlogSpot.settings')

application = get_wsgi_application()

app = application