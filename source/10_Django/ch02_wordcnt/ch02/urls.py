"""ch02 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.conf.urls import url
from home import views  # 다른 폴더에 있으므로 import필요

urlpatterns = [
    path('admin/', admin.site.urls),
    url(r'^$',views.index, name="index" ), # ^ 처음을 의미 ,   $ 끝을의미  예:  ^h[a-z]$   h로시작해서 소문자하나로 끝남
    path('test/',views.test,name="test1"),
    path('showId/<int:id>/',views.intId, name="showIntId"),  # intId라는 함수는 앞에 id를 받아옴
    path('showId/<str:id>/',views.strId,name="showStrId"),
    path("wordcnt/", include('wordcnt.urls')),   #home>templates>home>index.html
]
