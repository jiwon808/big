"""ch04 URL Configuration

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
from django.urls import path, include  # include 추가함
import students.views           # from students import views


urlpatterns = [
    path('admin/', admin.site.urls),
    path('students/',include('students.urls')),  # 추가함   #students에 urls.py가 없으면 error남   #students밑에 >python file을 만들어 (이름은 urls)
                #students하면  students.urls여기로 가
    path('',students.views.listAll,name="home")
]
