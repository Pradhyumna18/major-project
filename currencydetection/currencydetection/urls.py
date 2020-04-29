"""currencydetection URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from user import views
from admins import views as adm
from currencydetection import settings
from django.conf.urls.static import static

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$',views.index,name='index'),
    url(r'^Home/$',views.home,name='home'),
    url(r'^Registration/$',views.registration,name='registration'),
    url(r'^Moneylist/$',views.moneylist,name='moneylist'),
    url(r'^Charts/$',views.charts,name='charts'),
    url(r'^Charts2/$',views.charts2,name='charts2'),
    url(r'^Logout/$',views.logout,name='logout'),
    url(r'^viewlist/(?P<pk>\d+)/$',views.viewlist,name='viewlist'),
    url(r'^gryscale/(?P<pk>\d+)/$',views.gryscale,name='gryscale'),
    
    url(r'^admins/$',adm.index,name='adminsindex'),
    url(r'^admins/home/$',adm.home,name='adminshome'),
    url(r'^admins/Charts/$',adm.charts,name='admincharts'),
    url(r'^admins/Charts2/$',adm.charts2,name='admincharts2'),
    url(r'^admins/Logout/$',adm.logout,name='adminlogout'),
    url(r'^admins/uploadNew/$',adm.uploadNew,name='uploadcurrency'),    
    url(r'^admins/Currency/Check/$',adm.currencycheck,name='currencycheck'),    
]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)