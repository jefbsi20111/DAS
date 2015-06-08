from django.conf.urls import patterns, include, url

from django.conf.urls.static import static
from django.conf.urls import handler404
from django.conf.urls import patterns, include, url
from django.http import Http404


from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'src_DAS.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),

)
