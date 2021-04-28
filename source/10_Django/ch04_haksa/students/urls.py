from django.urls import path, include
from.import views

app_name = 'students'
urlpatterns = [
    path('listAll/',views.listAll, name='listAll'),  # students > urls.py참조
    path('register/',views.registerStudent, name='register'),
    path('registerCon/',views.registerConStudent,name='registerCon'),
    path('detail/<str:name>/',views.detailStudent, name='detail'),
    path('modify/<str:name>/',views.modifyStudent,name='modify'),
    path('modifyCon/',views.modifyConStudent, name='modifyCon'),
    path('delete/<str:name>/',views.deleteStudent, name='delete'),

]