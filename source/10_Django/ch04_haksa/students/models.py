from django.db import models

# Create your models here.
class Student(models.Model):  # Model에 objects있다
    s_name = models.CharField(max_length=1000)
    s_major = models.CharField(max_length=100)
    s_age = models.IntegerField(default=0)
    s_grade = models.IntegerField(default=0)
    s_gender = models.CharField(max_length=30)

    def __str__(self):
        return"{}({},{}살{}학년)".format(self.s_name,self.s_major,self.s_age,self.s_grade,self.s_gender)