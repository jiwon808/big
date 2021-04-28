from django.shortcuts import render

# Create your views here.

def wordinput(request):
    return render(request,"wordinput.html")  #ch02>settings.py 안에 template  dir부분에  html주소 붙여


def about(request):
    return render(request,'about.html')

def result(request):
    full = request.GET['fulltext'] #'안녕 방가 안녕'  #만든 사이트의 textarea안에 입력한 내용   아페get방식으로 설정해서 여기도 GET
    strlength = len(full) # 8
    words = full.split() # ['안녕', '방가', '안녕' ]
    words_dic = {}  #{'안녕':2, '방가':1}가 목적
    for word in words:
        if word in words_dic:  #key값에 들어와있을 경우
            words_dic[word] += 1   # ex. 안녕 첫번째 입력시 없어서  1 , 두번째 또 들어갈 시  key값에 들어와있기 때문에 if문으로 드렁가서 +1됨 **
        else:
            words_dic[word] = 1
    return render(request,'result.html',{'full':full,
                                         'strlength':strlength,
                                         'cnt':len(words),
                                         'dic':words_dic.items})  #안녕 몇번 이렇게 넘어가야해서  key과value값 들다들어가야해서 --> items사용







