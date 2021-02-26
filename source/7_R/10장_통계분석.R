###############################################
# # # # # 10장. t-test분석 vs. ANOVA분석  # # # 
###############################################
# '두 그룹' 간 '평균의 차이'가 통계적으로 '유의'한지 검증: t-test
# '세 그룹 이상' 집단의 평균 차이가 유의한지 검증 :ANOVA 분석 (분산분석)
# 통계 background: 데이터 전체 다 받을 수 없어. sample만 분석    #sampling 어떻게 할지  (통계책 앞 부분분)
# sample이 전체로 잘 얻어졌는 전제하에서. 통계 진행 


#1. 두 그룹간의 평균의 차이가 유의한지 분석 

#ToothGrowth ; 60개 기니 피그의 치아 성장에 비타민 C가 미치는 영향을 조사한 3개의 변수		
#len	치아 길이
#supp	비타민 공급 종류(OJ;오렌지주스, VC;비타민C의 한종류인 ascorbic acid아스코르브산)
#dose	복용량


ToothGrowth
table(ToothGrowth$supp)

#(1) 도표로 차이의 유의성 표현 (tapply, by, summaryBy, aggregate.. 평균, 분산)
#(2) 그래프로 시각화된 유의성 표현 (바이올린도표, 산점도, 상자도표)
#(3) 통계적으로 유의한지 검증


###비타민의 종류가 / 기니피크 치아 성장에 / 영향을 미치는지?
ToothGrowth <- rbind(ToothGrowth, ToothGrowth)   #3번 => 480행    #행합쳐서 데이터 뻥튀기
nrow(ToothGrowth)  #60+60=120행 
table(is.na(ToothGrowth))      #결측치 있는지 없는지 확인 
colSums(is.na(ToothGrowth))

#(1) 
library(doBy)
summaryBy(len~supp,data=ToothGrowth, FUN=c(mean,sd))
#  supp len.mean   len.sd
#1   OJ 20.66333 6.605561
#2   VC 16.96333 8.266029
library(dplyr)
ToothGrowth %>%
  group_by(supp)%>%
  summarise(len.mean= mean(len),
            len.sd=sd(len))

#ToothGrowth %>%
#  filter(!is.na(supp) & !is.na(len))%>%  #supp가 결측치가 아니고
#  group_by(supp)%>%
#  summarise(len.mean = mean(len, na.rm=T),
#            )


#(2)
ToothGrowth %>%
  group_by(supp)%>%
  summarise(len.mean= mean(len))%>%
  ggplot(aes(x=supp, y=len.mean)) +
#supp  len.mean
# <fct>    <dbl>
#1 OJ        20.7
#2 VC        17.0    를 시각화 
  geom_col(aes(fill=supp),width=0.7)

ggplot(data=ToothGrowth,aes(x=supp, y=len))+
  geom_violin() +
  geom_point(position = 'jitter', col='orange', alpha=0.7)+      # position = 'jitter' 분산  / alpha용도 투명하게 
  geom_boxplot(aes(fill=supp), notch = T, width=0.4)

#(3) 통계적인 분석 
#일원표본 t-test
table(ToothGrowth$supp, useNA="ifany") #결측치 빈도까지 출력
table(ToothGrowth$supp, exclude= NULL ) #결측치 빈도까지 출력
a<- ToothGrowth[ToothGrowth$supp=='OJ','len']
b<- ToothGrowth[ToothGrowth$supp=='VC','len' ]

t.test(a-b)         #일원표본 
t.test(a,b)         #p-value를 봐

# p-value가 0.05보다 작은 경우 귀무가설(두 그룹의 평균이 같다) 을 기각함    #p가 0.05보다 작으면 다르다 
# p-value가 0.05보다 큰 경우 귀무가설을 기각하지 못한다.                   #p가 0.05보다 크면 같다  

#이원표본 t.test(등분산성 테스트 -> t-test분석)
var.test(len~supp,data=ToothGrowth)
#p-value가 0.05보다 작은 경우 분산이 다르다// 귀무가설(두 그룹의 분산이 같다)을 기각 - 등분산성립


#p-value가 0.05보다 큰 경우 분산이 같다.   


t.test(len~supp, data=ToothGrowth,var.equal=F)
 # var.equal=F: 두 그룹의 등분산성이 성립되지 않는 경우 
 # var.equal=T: 두 그룹의 등분산성이 성립되는 경우 (p-value가 0.05보다 큰 경우 분산이 같다.)

#p-value = 0.000137  가0.05보다 작다.  귀무가설을 기각.  (분산이 다르다)

rm(list=ls()) #데이터 뻥튀기 없어짐 


####예제:  datasets:sleep:  extra(수면량), group(수면제종류)
#수면제 group 에따라 수면량의 변화가 있는 분석하시오 
sleep <- rbind(sleep,sleep)     #4번실행해서 데이터 뻥튀기. 320개 
nrow(sleep)                     #데이터 몇개있는지. 행 수    

head(sleep)
str(sleep)
table(sleep$group,useNA="ifany")


#(1) 도표로 평균의 차이 나타내기
library(doBy)
result <- summaryBy(extra~group,data=sleep,FUN=c(mean,sd))
ggplot(result,aes(x=group,y=extra.mean))+
  geom_col(aes(fill=group),width=0.7)


#(2) 평균,표본의 차이를 시각화하기.
library(ggplot2)
result <- summaryBy(extra~group, data=sleep, FUN=c(mean,sd))
ggplot(result,aes(x=group,y=extra.mean))+
  geom_col(aes(fill=group),width=0.7)

ggplot(data=sleep,aes(x=group,y=extra))+
  geom_point(position='jitter',col='yellow',alpha=0.7)+
  geom_violin(width=0.7)+
  geom_boxplot(aes(fill=group),notch = T,width=0.5)


#(3) 통계적으로 유의미한 차이를 분석하기
var.test(extra~group,data=sleep)   #p-value가 0.05보다 큼
t.test(extra~group, data=sleep, var.equal=T)  #p-value가 0.05보다 작아 두 그룹사이의 평균이 같다는 귀무가설을 기각한다.


#2.  3개 이상의 집단간 평균의 차이를 비교할 때는 분산분석(ANOVA)

#(1) aov()
#iris데이터 셋에서 종에 따라 Sepal.Length의 평균이 다른지 
  # Species : 독립변수 /  Sepal.Length: 종속변수 
ggplot(iris,aes(x=Species,y=Sepal.Length)) +
  geom_boxplot(aes(fill=Species), notch = T)
result <- aov(Sepal.Length ~ Species, data=iris)   #Species이 범주형 
summary(result)  #F값 
#F값이 0.05 보다 작으면 귀무가설을 기각
#F값이 0.05보다 크면 귀무가설을 기각할 수 없다 


#(2) anova()            #ANalysis Of VAriance
#dataset:: mtcars 데이터셋에서 cyl에 따라 mpg의 평균이 다른지 
rm(list=ls())
str(mtcars$cyl)
table(mtcars$cyl, useNA="ifany")         #cyl의 가지수와 결측치 확인 
# cyl에 따른 그룹이 4개 그룹이고 cyl변수 연속형 변수여서 

fit <- lm(mpg ~ cyl, data= mtcars)
fit
anova(fit)
#F값이 0.05 보다 작으면 귀무가설을 기각
#F값이 0.05보다 크면 귀무가설을 기각할 수 없다 



### 예제: datasets::Orange;  오렌지나무의 종류, 연령, 둘레 
  #오렌지 나무의 연령에 따른 둘레의 평균이 상이한지 분석하시오. 
head(Orange)
str(Orange$age)
nrow(Orange)

fit <- lm(circumference ~ age, data=Orange)
anova(fit)

























