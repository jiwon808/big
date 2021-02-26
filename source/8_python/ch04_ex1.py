# -*- coding: utf-8 -*-
"""
태어난 연도를 입력받아, 나이와 성인(20살 이상) 인지
청소년(15~19살)인지  아동(14살 이하)인지 출력하시오 
1992년도에 태어난 당신은 30살이고 성인입니다 
python ch04_year.py 1992
python cho4_year.py 

src폴더 cmd창 실행 D:\bigdata(psa)\src\8_python>python ch04_score.py 1992
여기서 '파일이름'이 0번방    입력한 년도가 1번방

"""
import sys 
if len(sys.argv)==1 :
    birth = int(input('몇년도에 태어나셨나요?'))
else:
    birth = sys.argv[1]    
age = 2021 - birth +1
if age>=20:
    group ='성인'
    
elif 15<= age <=19:
    group ='청소년'
else:
    group="아동"
print("{}년도 생이신 당신은 {}살이고 {}입니다".format(birth,age,group))
