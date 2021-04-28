from django.shortcuts import render
from students.models import Student
from django.http import HttpResponseRedirect
from django.urls import reverse

from django.shortcuts import redirect

# 학생들 목록보기 기능
def listAll(request):
    qs = Student.objects.all()
    context = {'student_list':qs}
    return render(request,'students/student.html',context)   #templates>students> 'student.html' 철자와 같아야

# 학생 등록
def registerStudent(request):
	return render(request,'students/registerStudent.html')

# 학생 등록 입력받아 DB에 저장
def registerConStudent(request):
    name= request.POST['name']
    major= request.POST['major']
    age = request.POST['age']
    grade = request.POST['grade']
    gender= request.POST['gender']
    qs=Student(s_name=name,s_major=major,s_age=age,s_grade=grade,s_gender=gender)
    qs.save()
    return HttpResponseRedirect(reverse('students:listAll'))   # render를 쓰면 바로 html로 가서 여기서 render 못씀  (여기서는database에 있는 list를 받아서 -->html로 가야함)

# 상세보기  (databse에 name이 있는지 찾아야 )
def detailStudent(request,name):
    print(name)
    try:
        qs=Student.objects.get(s_name=name)
    except:
        qs=Student.objects.filter(s_name__contains=name) #예: '홍길'은 없지만 '홍길동'을 찾을 수 있게
    print(qs)
    context = {'student':qs}   #template에 context넘겨줌
    return render(request,'students/detailStudent.html',context=context)

# 학생 수정
def modifyStudent(request,name):
    try:
        qs = Student.objects.get(s_name=name) #홍길동이 2개 있으면 qs가 stirng이 아니라 list로 들어감. 따라서 유일하게
    except:
        qs = ''
    context = {'student':qs}
    return render(request,'students/modifyStudent.html',context=context)

# 학생 수정 정보 DB에 반영
def modifyConStudent(request):
    name = request.POST['name']
    major = request.POST['major']
    age = request.POST['age']
    grade = request.POST['grade']
    gender = request.POST['gender']
    qs = Student.objects.get(s_name=name)
    qs.s_major = major
    qs.s_age = age
    qs.s_grade = grade
    qs.s_gender = gender
    qs.save()
    return HttpResponseRedirect(reverse('students:listAll'))   # database에 있는 모든 아이 가져옴

# 학생 삭제
def deleteStudent(request,name):
    try:
        qs = Student.objects.get(s_name=name)
        qs.delete()
        print(name,'삭제성공')
    except:
        print(name,'삭제 실패')
    return redirect('/students/listAll')
