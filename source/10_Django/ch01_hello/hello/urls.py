from django.urls import path
from hello import views  # . 현재 폴더   여기서 hello

urlpatterns = [
    path("", views.home, name="home")
]
