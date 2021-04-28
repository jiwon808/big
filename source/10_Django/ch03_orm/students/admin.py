from django.contrib import admin
from students.models import Student

# Register your models here.
admin.site.register(Student) #model 등록  #http://127.0.0.1:8000/admin/들어가보면  "Students"이렇게 생김. 데이블이름에+s 알아서 붙임