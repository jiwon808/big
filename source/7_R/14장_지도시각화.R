##################################################
###14장. 지도 시각화 ###
##################################################

#1. 미국 주별 강력 범죄율 시각화 (USArrests 데이터 셋 이용)

View(USArrests)

#(1) 패키지 준비 
install.packages("ggiraphExtra") #지도 시각화를 위한 패키지
library(ggiraphExtra)
install.packages("mapproj") #ggChoropleth함수 사용을 위한 패키지 
library(mapproj)
install.packages("maps") # map_data함수를 통해 지도 정보
#미국 지도 그릴때, 미국 경도 위도    data파일필요
library(maps)
library(ggplot2)
library(tibble) #행이름(지역명)을 변수로 하기 위한 작업 

#(2) 행이름을 변수로 
head(USArrests,1)
rownames_to_column(USArrests,var="state")
crime <- rownames_to_column(USArrests,var="state")
class(crime)
head(crime,3)
#대소문자 일치시켜야. 두파일의 state이름이 일치화되어 쓸 수 있다
crime$state <- tolower(crime$state) #주명을 소문자자
head(crime,3)

#(3) 미국 지도 주 정보 가져오기 
map_data("state")
View( map_data("state") )

state_map<-map_data("state")

#(4) 지도 시각화 
ggChoropleth(data=crime,        #지도에 표현할 데이터
             aes(fill=Murder,   #지도에 채워질 변수
                 map_id=state), #지역 변수
             map=state_map,     #위도 경도 지도 데이터 
             interactive=T)     # 인터렉티브 속성 

###########질문: 어떻게 한 state 이렇게  click하면 숫자가 나오는지. 뭐가뭔지.


ggChoropleth(data=crime,        #지도에 표현할 데이터
             aes(fill=Assault,   #지도에 채워질 변수
                 map_id=state), #지역 변수
             map=state_map,     #위도 경도 지도 데이터 
             interactive=T)     # 인터렉티브 속성 

# 2. 대한민국 시도별 인구, 결핵 환자 수 단계 구분도 만들기
rm(list=ls())
install.packages("stringi")
install.packages("devtools")
devtools::install_github("cardiomoon/kormaps2014")
library(kormaps2014)
head(korpop1)
# korpop1: 2015년 센서스 데이터 (시도별)
# korpop2: 2015년 센서스 데이터 (시군구별)
# korpop3: 2015년 센서스 데이터 (읍면동별)

str(changeCode(korpop1))  #utf-8로 인코딩 된 데이터를 CP949로 변환 후 출력 

library(dplyr)
korpop1 <- rename(korpop1,
                  pop=총인구_명,
                  name=행정구역별_읍면동)
str(changeCode(korpop1))

head(kormap1)
head(changeCode(kormap1))
head()
head(changeCode(korpop1[,c('name','pop','code')]))

library(ggiraphExtra)
library(ggplot2)
ggChoropleth(data=korpop1,
             aes(fill=pop,
                 map_id=code,
                 tooltip=name),
             map=kormap2,
             interative = T)

#korpop1$name;  UTF-8을  CP949로 바꿈 

ggiraphExtra::ggChoropleth()
head(korpop1)

korpop1$name <- iconv(korpop1$name, 'UTF-8','CP949')
korpop1$name

#지도시각화              ################################






#결핵환자수 지도 시각화
head(tbc)

head(changeCode(tbc))   #글자 안 깨지게 코드 바꿈 
tbc$name1 <- iconv(tbc$name1, 'UTF-8','CP949')
tbc$name <- iconv(tbc$name,'UTF-8','CP949')
head(tbc)
ggChoropleth(data=tbc,
             aes(fill=NewPts,
                 map_id=code,
                 tooltip=name1),
             map =kormap1,
             interactive = T)

#한국행정지도(2014) 패키지 kormaps2014 안내 https://rpubs.com/cardiomoon/222145











