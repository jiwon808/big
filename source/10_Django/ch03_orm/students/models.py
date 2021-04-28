from django.db import models

# Create your models here.


class Student(models.Model):
    s_name = models.CharField(max_length=1000)   # CREATE STUDENT(S_NAME VARCHAR2(1000), ); 이것과 같음
    s_major = models.CharField(max_length=1000)
    s_age = models.IntegerField(default=0) # 예.S_AGE NUMBER(3)와 같음  default값
    s_grade = models.IntegerField(default=0)
    s_gender = models.CharField(max_length=30)

    def __str__(self):   #__str__  데이터 보이게.  튜플타입으로 넣으면 error. 따라서 string type을 넣어
        return "{} ({},{},{}살,{})".format(self.s_name,self.s_major,self.s_grade,self.s_age,self.s_gender)


