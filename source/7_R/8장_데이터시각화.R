###############################################
# # # # # 8장. 데이터 시각화  # # # # # 
###############################################

#1.시각화 개요: 원본 데이터, 분석된 결과 데이터를 그래프로 표현. 사용자에게 효과적으로 정보전달이 목적 

#1.1 R의 그래픽 시스템 

#(1) base graphic system - 전통적인 함수 이용. 정교한 그래프 이용시 노력 필요. 
                      #그래프 종류별 함수가 각기 달라. 정교한 그래피 이용시 노력필요  
     

#(2) grid graphics system - base graphic system  한계 극복 위해 탄생한 패키지 (ggplot2)
      #유연한 그래프 환경 제공. 

# ex.
library(ggplot2)
ggplot(data=mtcars,aes(x=wt, y=mpg)) + geom_point() + labs(title="그래프 첫 예제") + geom_smooth()  #추세선


#1.2 그래프 함수
#고수준 그래프 함수: plot, barplot, boxplot, hist, pie, ....
        #그래프 함수를 호출할 때마다, 그래프 영역에 새로운 그래프를 시작  

#저수준 그래프 함수:  lines, abline(회귀라인), point, text, ...
    #새로운 그래프를 생성하지 않음. 이미 그려진 그래프 위해 점, 라인, 글씨...



#1.3 그래프 파라미터 : bty(박스유형), .............. lty, mfroW, pch 
#(1) par(): 그래프를 조정하거나 특성을 지정.   (선굵기, 종류, 글꼴)
            #par()함수의 리던값은 실행전의 특성을 리턴한다 

?cars #차속도와 제동거리 
plot(cars)
?par
oldPar <- par(bty =']') 
plot(cars)
plot(iris)
#bty
#A character string which determined the type of box which is drawn about plots. If bty is one of #"o" (the default), "l", "7", "c", "u", or "]" the resulting box resembles the corresponding #upper case letter. A value of "n" suppresses the box.

par(oldPar)    #oldPar설정으로 복귀 
plot(cars)     #고수준 그래프 함수 

#fit <- lm(cars$dist ~ cars$speed)
fit <- lm(dist ~ speed, data=cars)
fit
abline(fit, col="red")  #저수준 그래프 함수 

?abline
#par 함수의 다른 파라미터 사용 예 
x <- 1:100
y1<- rnorm (100)  #평균0이고  표준편차가 1인 수 100개 추출  (표준정규분포)
y2 <-rnorm(100)+100 #평균은 100이고 표준편차는 1인 수 100개 (정규분포)

oldPar <- par(mar=c(5,5,5,5)) #그래프 여백(하,좌,위,우)
?par
plot(x, y1, pch=0,type="b",col='red', ylim=c(-8,2),yaxt="n", bty='n', ylab="")                  #ylim은y좌표 
          # pch; 0:네모, 1:원, 2:세모, 3: 십자, 4: x, 5: 다이아몬드 ..
          #      문자 해당 문자 
          #type: p:점, 1:선, b:점선동시 , o:점선켭치면서동시 , h:히스토그램, s:계단모양, n:좌표찍지 않음  
          #col; 1:black,  2:red, 3:green, 4:blue, 5:cyan, 6:purple, 7:yellow, 8:gray

          #ylim, xlim; y눈금, x눈금 조정
          #yaxt: y축 눈금 없애기 
          #bty: 그래프 박스 타입 (o,L,7,U,C,n)

axis(side=2, at=c(-2,0,2))
  #side: 1 하, 2좌, 3 위, 4우
  #at: 위치 
?axis


mtext("red line(y1)", side= 2, line = 2, at=0, col=2)
colors()
par(new=TRUE) #기존 그래프 영역을 지우지 않고 덧그림 
plot(x,y2,pch=1,type='b', col="blue", yaxt="n", ylim=c(98,108),ylab="", bty="n")

axis(side=4, at=c(98,100,102))
mtext("blue line(y2)", side=4, line=2, at=100, col="blue" )

par(oldPar)  #그래프 영역 설정 원상 복구 

#(3) plot(): 산점도 


#2. 고수준 그래프 함수
#2.1 plot: type에 따라 여러 유형의 그래프를 그림. 산점도 그래프 함수 

?plot
plot(cars,main="speed and Stopping Distance of cars",
     xlab="speed(mph)", ylab="stopping distances(ft)", las=1)

#las; 축눈금라벨 방향; 0:축과평행, 1:가로, 2:축과수직 3:세로 


#2행3열로 그래프영역 분리하고 type 속성에 따른 그래프 그리기 
oldPar <- par(mfrow=c(2,3))                                                    
plot(cars,type="p",main="p타입")  #일반적 산점도 
plot(cars,type="l",main="l타입")  #추세선
plot(cars,type="b", main="b타입") #선점(겹치지 않게)
plot(cars,type="s",main="s타입")  #계단
plot(cars,type="n",main="n타입")  #산점도 안 그려
plot(cars,type="o",main="o타입")  #선과점 겹치게
par(oldPar)

#2.2 barplot: 막대그래프 
VADeaths
barplot(VADeaths, main="버지니아주 사망율", font=2, border="red", legend=rownames(VADeaths),
        angle=c(10,30,50,70,120),
        density=50, col=rainbow(5))
        
        #legend; 오른쪽 상단 범례
        #angle; 막대그래프에 칠할 빗금의 각도
        #density; 막대그래프 안에 칠할 선 수 

barplot(VADeaths, main="버지니아주 사망율", font=2, border="red", legend=rownames(VADeaths),
        angle=c(10,30,50,70,120),
        density=50, col=rainbow(5),beside=TRUE)


# 2.3 boxplot: 사분위수 그래프 
InsectSprays
boxplot(InsectSprays$count)
boxplot(count~spray,data=InsectSprays, col="springgreen3")
tapply(InsectSprays$count,InsectSprays$spray,median)
colors()

#2.4 hist: 히스토그램 (도수분포표)

x <- c(1,1,2,2,2,3,4,4)  #1은 2개, 2는3개, 3은 1개, 4는 2개 
hist(x)
h<-hist(x,breaks=c(0,1,2,3,4))
  # breaks; 구간
h
text(h$mids,h$counts,h$counts, adj=c(0, -0.5), col='black')
text(h$mids,h$counts,h$counts, adj=c(0, 0), col='red')
text(h$mids,h$counts,h$counts, adj=c(1, 0), col='blue')
text(h$mids,h$counts,h$counts, adj=c(0, 1), col='green')
text(h$mids,h$counts,h$counts, adj=c(1, 1), col='purple')
#adj위치 재조정 

islands #1만 평방마일을 초과하는 주요대륙 넓이 정보 
islands
class(islands)
is.vector(islands)
hist(sqrt(islands), breaks=c(2,35,70,100,140))

#3.5 pie
pie.sales <- c(0.1,0.3,0.2,0.15,0.1,0.15)
sum(pie.sales)
names(pie.sales) <- c("c","java","python","R","oracle","hadoop")
pie.sales
pie(pie.sales) #반시계방향으로 
pie(pie.sales,clockwise=T, col=c('red','orange','yellow','green','white')) #시계방향
pie(pie.sales,clockwise =T, col=rainbow(6))

#3.6 mosaicplot
?Titanic
class(Titanic)
Titanic
mosaicplot(Titanic, color=T)
mosaicplot(~Sex+Age+Survived,data=Titanic, color=T)

#3. 저수준 그래프 함수 
#3.1 point
plot(-4:4,-4:4, type="n")
points(2,2,col="red")
points(rnorm(100),rnorm(100),col="brown",pch=3)
rnorm(100)
  #평균이0이고 표준편차가 1인 표준정규분포 데이터 100개 난수 생성성 

#3.2 lines: 선그리기 
plot(cars,main="speed & distance")
fit <- lm(dist~speed, cars)
fit #y= 3.932x -17.579  
lines(cars$speed,3.932*cars$speed-17.579, col='blue')

#overfit

#3.3 abline : 회귀식선
abline(fit,col="red",lty='dashed')

#lty: 라인의 스타일
?abline
?plot
?par

#3.4 text (x,y.출력할 테스트, 그외 옵션들)
plot(1:5,1:5, type="n")
text(3,3, 'A', adj=c(0,0),col='red')        #앞- 왼쪽아이  뒤- 밑으로 
text(2,4, expression(hat(beta) == (X^t*X)^{-1} * X^t*y),cex=2,adj=c(0,0))    #글씨가 크게 cex=2  #(2,4)를 기준으로 adj=c(0,0)


#4. ggplot2 패키지 함수 
install.packages("ggplot2")
library(ggplot2)

#1: 그래프초기화 (데이터셋, 변수설정)하는 ggplot - 그 자체로는 그래프 표현x
#2: 그래프의 결과물에 대응하는 geom함수
#3: 그래프의 제목, 부제목, 캡션, 축이름 등 부가 요소를 추가 labs함수 
# +기호를 이용해서 함수들을 연결하는 방식으로 그래프 생성 

#1단계 (선언단계):  ggplot2
#ggplot(   data, aes(x=,y=)  ) +
#  geom함수() + #어떤 그래프를 그릴지 
#  labs (제목,x축,y축에 label)  +
#  scale함수() +
#  theme() +                   **색상, 범례추가,x축 방향
#  coord_cartesian()       **좌표를 어디부터 어디까지 쓰고 싶을때 




ggplot(data=mtcars,aes(x=wt, y=mpg)) + 
  geom_point(aes(size=mpg, color=cyl)) + 
  labs(title=" wt & Fuel consumption",
                x="weight(1,000lbs)",
                y="Fuel consumption(miles per gallon)",
                subtitle = "(차량 무게와 연비와의 관계)",
                caption="source: mpg datasets")


# 4.1 산점도, 적합도, text...
# x축: iris$Petal.Length    y축: iris$Petal.Width의 산점도 
# 점의 색은 종에 따라 다르게 그리시오 

library(ggplot2)                         #이 단계를 해야 밑에가 열린다 
ggplot(data=iris, aes(x=Petal.Width, y=Petal.Length))+                   
  geom_point(aes(color=Species)) +
  scale_color_manual(values=c('black','red','orange') )+
  labs(title="iris 데이터의 산점도", 
       x="꽃잎 길이", y="꽃잎 너비") +
  coord_cartesian(ylim=c(0,2)) +            #y축 0부터2까지만 출력
  geom_smooth()               # geom_smooth안에 있는method에 따라 곡선이 달라져


head(airquality)
#airquality$Ozone과 airquality$Solar.R과의 관계를 표현하는 산점도 
# 월별 점의 색깔을 달리 표현합니다

ggplot(data=airquality, aes(x=Ozone,y=Solar.R))+
  geom_point(aes(color=Month)) +
  labs(title="오존량과 태양복사량과의 관계") +
  geom_smooth(method="lm")

?geom_smooth  


ggplot(data=mtcars, aes(x=wt,y=mpg)) + 
  geom_point(shape=25, color="blue",bg="red", size=2, stroke=2)+ 
#shape = par에서 pch와 같음. stroke 테두리 두께, size점크기 
    geom_smooth(method="lm",color="red", size=2, linetype=2)+
          geom_text(label=rownames(mtcars),hjust=0,vjust=0,size=3, nudge_y=0.5) +
          labs(x = "차량 무게(1,000lbs)",
                y="연비",
                title="차량 무게의 연비와의 관계",
                subtitle="(부제목)",
                caption= "참조:datasets의macats")


?geom_text
mtcars
?geom_smooth
?geom_point
?par
#style = par에서 pch와 같음 

colors()




#4.2 히스토그램
rm(list=ls())
head(mtcars)
dim(mtcars)
str(mtcars)
mtcars$cyl <- factor(mtcars$cyl, levels= c(4,6,8),
                     labels= c('4 cyclinders',
                               '6 cylinders',
                               '8 cylinders'))    

head(mtcars)
str(mtcars$cyl)                                #원래 1,2로 나오는데 가독성을 

ggplot(data=mtcars, aes(x=mpg)) +  #mpg 연속형 변수 1,2,3,4,5,6  factor변수가 아님: 남 여 이렇게 아님 
  geom_histogram() +
  facet_grid(cyl~.) +  #3개의 패널에 그리는 함수 
  labs(title="cyl에 따른 연비 히스토그램",
       x="연비",y="횟수")  

#시각화. '4cyl 연비가 좋다'라는 것이 눈에 보인다 


# 히스토그램은 연속형 자료형에서 도수분포표 (범주형(categorical variable)의 도수분포는 불가)  #범주형 변수이 factor이 있는 변수
ggplot(data=mtcars, aes(x=cyl)) +
  geom_histogram() #cyl데이터는 연속형이 아니므로 에러 


#ggplot2:: mpg 데이터셋에서 displ도수분포표 (class에 따라 그래프의 색상을 달리 표현함)
str(mpg$displ)
ggplot(mpg, aes(x=displ)) +    #displacement(배기량)
    geom_histogram(aes(fill=class))+ # class별로 color다르게 # ()안에 안쓰면 위에 있는 아이 저절로 상속      
    theme(axis.text.x = element_text(color='red', size=15 ),#x축의 text를 원래 element_text의 color를 빨강색으로 
          axis.line = element_line(color='black', size=2),   #x축,y축 선 
          axis.text.y = element_blank(),                       #x축,y축 눈끔 없어져  
          panel.background = element_rect(fill='lightblue', linetype='dotted', color='red'),   #linetype='solid'  (외곽에line이 dash로 바뀜, linetype='solid'면 실선)
          plot.background = element_rect(fill='lightgreen')
          )
          
ggplot(mpg,aes(x=displ))+
  geom_histogram(aes(fill=class), #geom_histogram(fill='red')  bar전체 red
                 binwidth = 0.1)+    #binwidth 바 사이사이의 넓이
  labs(title="Histogram with Auto Bining",
       subtitle = "(Engine Displacement across Vehicle Classes)")+
  theme(legend.position = "bottom")   #범례(legend)를 밑으로 내린다 

ggplot(mpg,aes(x=displ)) + 
  geom_histogram(aes(fill=class), 
                     bins=5, color='black') #빈의 갯수(지정하지 않으면 30개가 기본값)  (한 구간 당 5개  예 3-4구간 5개,  4-5구간 5개)
                            #binwidth를 지정하면 bins는 무시   #bin 5개가 무슨뜻???????????
                     

colors()

?geom_histogram() 


#4.3  상자도표 (boxplot)
boxplot(iris$Sepal.Length)$stat               #$stat이상치 처리 용도

ggplot(iris,aes(y=Sepal.Length)) +
  geom_boxplot() 

#종별 Sepal.Length의 차이가 있는지를 보고 싶을 때 
tapply(iris$Sepal.Length,iris$Species,mean) #도표 표현 
ggplot(iris,aes(y=Sepal.Length,x=Species)) + #시각화 표현
  geom_boxplot(aes(fill=Species),col='dimgray')+         #col: Species 선이 바뀐다  #fill: 안에 색깔이 바뀐다 
  scale_fill_manual(values=c('#FF0000','yellow','green'))

library(RColorBrewer)
display.brewer.all()
pal <- brewer.pal(8,'Set2')  #8색갈짜리 set2를  pal이라는 변수에 넣는다 
ggplot(iris,aes(y=Sepal.Length, x= Species)) +
  geom_boxplot(aes(fill=Species), col='dimgray') +
  scale_fill_manual(values=pal)     #set2에 나오는 1st,2nd,3rd color 

install.packages("gapminder")  #gapminder는 기본 패키지가 아니라서 install하고 실행             #package가 원래 r시스템 안에 있는건지?????????????????? r system안에 데이터 패키지가 알마나 많이 있는지 ???
library(gapminder)
table(gapminder$country)
dim(gapminder)

#대륙별 GDP 차이가 있는지 
table(gapminder$continent)
dim(gapminder) #gapminder 대률별, 나라별, 인구와 GDP 데이터 
#대률별 GDP 차이가 있는지 
table(gapminder$continent)
ggplot(gapminder,aes(x=continent,y=gdpPercap))+
  geom_boxplot(aes(fill=continent)) +
  coord_cartesian(ylim=c(0,30000))

#교수의 직급별 (조교수, 부교수, 정교수) 연봉의 상의한지 
install.packages('car')
library(car)  # 메모리에 올림 
Salaries
dim(Salaries)
colnames(Salaries)

library(ggplot2)
ggplot(Salaries,aes(x=rank,y=salary)) +
  geom_boxplot(aes(col=rank), fill="lightyellow",notch= T)+
 #notch = T : 중위수에 대해서 95% 신뢰구간 표현, 신뢰구간이 겹치는지 파악 
 geom_point(position='jitter', col='brown', alpha=0.1, pch=2)+
 #position='jitter' : 산점도를 분산해서              
geom_rug(col='dimgray', sides="l") #관측값의 밀도 상태 표현 
#데이터가 많은 곳은 빽빽하게, 데이터가 적은 곳은 하얗게 
 
 
#mtcars데이터 cyl개수에 따른 연비 mpg의 95% 중위수 신뢰구간을 표현 상자도표를 시각화하시오. 
head(mtcars)
?mtcars
str(mtcars$cyl)

ggplot(data=mtcars, aes(y=cyl,x=mpg, fill=cyl)) +
  geom_boxplot(notch=T)

# 4.4 바이올린 도표;  boxplot과 밀도도표를 합쳐 
# 합창부 단원의 키와 성악부 part의 관계 

singer <- lattice::singer
head(singer)
View(singer)
str(singer)

ggplot(data = singer, aes(x=voice.part, y=height)) +
  geom_boxplot()

ggplot(data = singer, aes(x=voice.part, y=height)) +
  geom_violin(fill='honeydew2') + 
  geom_boxplot(width=0.3, fill='green')


#4.5  밀도도표 
head(mtcars, 1)
#실린더수(cyl)에 따른 연비(mpg)의 밀도도표 
ggplot(data=mtcars, aes(x=mpg, fill=cyl))+
  geom_density() +
  labs(title='밀도도표',
       x='Miles per Gallon')+
  theme(legend.position = c(0.7,0.8))

# 4.6 추세선  (시계열에서 데이터의 흐름 표현)
economics
colnames(economics)
#시간(date)에 따른 실업률(unemploy)
ggplot(data=economics, aes(x=date, y=unemploy) ) +  #x축,y축
  geom_line() +    #추세선
  geom_smooth(method='lm')   #적합도선   #method='lm'이면 직선 


  
#4.7 막대도표 (geom_bar, geom_col함수)
# 도수분포표 ; 막대도표, 히스토그램 모두
# 히스토그램: 연속형 자료를 계급으로 나누어 / 계급별 도수를 나타냄
      #geom_histogram()함수 
# 막대도표: 범주형 자료의 빈도를 나타냄 
    #geom_bar(), geom_col()함수 

#mpg데이터셋에서 제조회사(manufacurer)별로 빈도표를 나타내고자 
str(mpg$manufacturer)     #character로 나타남. 연속된 자료 아님
ggplot(data = mpg, aes(x=manufacturer)) + geom_histogram() #불가능 
ggplot(data=mpg, aes(x=manufacturer)) + 
  geom_bar(stat="count")     #stat= "count" 빈도를 시각화 

str(mpg$class)
ggplot(data=mpg, aes(x=manufacturer, fill=class)) +
  geom_bar(stat="count") +
  theme(legend.position = "bottom",
        axis.text.x = element_text(angle=60, vjust=0.7
                                   ))+   #밑에 이름 60도 기울려서 나옴  vjust=0.5 약간 밑으로 내림 
    scale_fill_manual(values=topo.colors(7)) +   #ppt 16page
    labs(title="제조사 별 class 빈도표")


# 다이아몬드 품질별 데이터 
head(diamonds)
str(diamonds)
dim(diamonds)  #행53940    열10
table(diamonds$cut)

#다이아몬드 품질(cut)별 빈도수 시각화 
ggplot(diamonds,aes(x=cut,fill=cut,col=cut))+      #외곽line  bar와 같은 색상 
  geom_bar(stat="count")+    #막대그래프 외곽line  geom_bar(col='black', stat="count")#stat="count"   
                                                        #[y값 안쓰고, 이걸로 하겠다]
   scale_fill_manual(values=topo.colors(5)) +
   scale_color_manual(values=rainbow(5))    #######################복습 ######

#다이아몬드 품질별 색상 갯수  (cut별 색상 몇개 있는지. cut별 color  summarize n    dplyr)

table(diamonds$cut,diamonds$color)
table(diamonds$color)

library(dplyr)
diamonds %>%
  group_by(cut,color) %>%
  summarise( n=n() ) %>%    #갯수 
  ggplot(aes(x=cut, fill=color, y=n))+   
  geom_bar(stat="identity")              #y가 있기때문에 count안됨 
# cut   color     n

#위와 아래는 같은 수행 

?geom_bar

diamonds %>%
  group_by(cut,color)%>%
  summarise(n=n()) %>%
  ggplot(aes(x=cut, fill=color,y=n)) + 
  geom_col()   #geom_col(position = "dodge")

#cut별, color별 막대그래프 

diamonds %>%
  group_by(cut,color)%>%
  summarise(n=n()) %>%
  ggplot(aes(x=cut, fill=color,y=n)) + 
  geom_col(position = "dodge")

#다이아몬드의 품질별, table별, 빈도수 시각화 
diamonds %>%
  group_by(cut,table)%>%
  summarise(n=n())%>%
  ggplot(aes(x=table, y=n))+
  geom_bar(stat = "identity")+
  facet_wrap(~cut)+  #cut별로 시각화를 달리 그림 
  coord_cartesian(ylim=c(0,3000),xlim=c(50,80))



#다이아몬드 품질(cut)별  table의 종류 갯수 
library(ggplot2)
library(dplyr)
length(table(diamonds$table)) #table종류는 127

diamonds %>%
  group_by(cut,table)%>%
  summarise(n=n()) %>%
  group_by(cut) %>%
  summarise(n=n()) %>%
  ggplot(aes(x=cut,y=n, fill=cut))+
  #geom_bar(stat="identity")     
  geom_col()

diamonds %>%
  group_by(cut) %>%
  summarise(n= n_distinct(table))%>%     #cut별  table종류수 
  ggplot(aes(x=cut,y=n,fill=cut)) + 
  #geom_bar(stat="identity)
  geom_col()

# 4.8 그래프를 파일에 저장 
# (1) basic 그래프, ggplot2 그래프 모두 저장 
jpeg('iris.jpg') #iris.jpg 그림파일 생성 
plot(iris[-5])
boxplot(iris$Sepal.Length)
dev.off()
getwd()


png('iris.png', width=300, height=150)
ggplot(iris,aes(x=Sepal.Length, y=Sepal.Width))+
  geom_point()+
  facet_wrap(~Species)                       ##이미지 저장
dev.off()                                    ###무슨의미 #############


#(2) ggplot2 그래프에서만 저장할 수 있는 방법
ggplot(iris,aes(x=Petal.Width, y=Petal.Length, col=Species)) + 
  geom_point(aes(size=Petal.Width),pch=2, alpha=0.5) 
ggsave('outData/iris.jpg')                           #이미지 저장    ####77줄 참고 ####################


# 4.9 차트 분할 출력 
install.packages("gridExtra")
library(gridExtra)

#oldPar <- par(mfrow=c(2,3))
g1<-ggplot(iris,aes(x=Petal.Width,y=Petal.Length))+
  geom_point()
g1
g2<- ggplot(iris,aes(x=Sepal.Width,y=Sepal.Length))+
  geom_point()
g2

grid.arrange(g1,g2,ncol=2)


#5. 산점도 행렬 
plot(iris[-5])
pairs(iris[-5], panel= panel.smooth)
          #panel = panel.smooth 추세선 추가 



#######################문제1-10번 #########################
#ex1.png ####(이미지,src저장) (문제-r파일-결과)




#ex2.png ####

#ex3.png ####

#ex4.png ####

#ex5.png ####

#ex6.png ####

#ex7.png ####

#ex8.png ####


#ex9.png ####


#ex10.png ####

































