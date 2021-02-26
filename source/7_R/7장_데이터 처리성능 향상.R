###############################################
# # # # # 7장. 데이터 처리성능 향상  # # # # # 
###############################################
#이장의 내용: ①plyr패키지(apply계열), ②데이터 구조 변경,(melt,cast)  ③데이터테이블    
iris[iris$Sepal.Length>7.5 & iris$Petal.Length>5,]

detach("package:dplyr",unload = T)

#1.plyr패키지: 데이터 분할, 함수적용 등을 사용하는 함수 포함. 
    #apply(), lapply(), sapply() 보강할 수 있다 

install.packages("plyr")
library(plyr)
# xyply(.data, .group....)  ex.  adply(dataframe) , ddply (dataframe)
apply(iris[,1:4],2,mean)    #mean(iris[,1])             1부터4번열까지 mean

apply(iris[,1:4],2, function(col){mean(col)})
sapply(iris[,1:4],function(col){mean(col)}) 
sapply(iris[,1:4],mean) 
sapply(iris[,1:4],function(col){mean(round(col))}) #data를 받아서 반올림해서  그 값을  평균을 내라 


x <- data.frame (v1=c(4,9,16),               #2,3,4의 평균
                 v2=c(16,81,196))            #4,9,14의 평균 
x

apply(x,2, function(col){mean(sqrt(col)) })  #열에 있는거 제곱군  mean 

#adply == apply(iris[1:4],2,sum), sapply()... 비슷 
library(plyr)
adply(.data=iris[,1:4], .margins = 2, function(col){sum(col)})

#ddply == summaryBy(Sepal.Length + Sepal.Width ~ Species, iris, FUN=mean) 비슷
ddply(.data=iris, .(Species), function(group){
  data.frame(SLmean = mean(group$Sepal.Length), 
             SWmean = mean(group$Sepal.Width))
})

#summarise: 뒤에 나오는 변수들만 출력 
#transform: 기존에 iris 데이터와 뒤에 나오는 변수들을 같이 출력  
ddply(iris, .(Species),summarise, SLmean=mean(Sepal.Length),SWmean = mean(Sepal.Width))

ddply(iris, .(Species),transform, SLmean=mean(Sepal.Length),SWmean = mean(Sepal.Width))

head(iris)


dfx <- data.frame(group=c(rep('A',8),rep('B',15),rep('C',6)  ),
                  gender = sample(c('M','F'), size=29, replace=TRUE),#복원추출
                  age = round(runif(29, min=18, max=54))
                  )  
dfx

ddply(dfx, .(group,gender), summarise, mean=round(mean(age),2), sd=round(sd(age),2))
ddply(dfx, .(group,gender), transform, mean=round(mean(age),2), sd=round(sd(age),2))

library(doBy)                  
summaryBy(age~group+gender, dfx, FUN=c(mean,sd))                  

# 2. 데이터 구조 변경 (melt,cast 함수)

?airquality
View(airquality)
install.packages("reshape2")
library(reshape2)
airquality.melt<- melt(airquality, id=c('Month','Day'), na.rm = T)      #결측치 있는 라인 제거  
View(airquality.melt)
airquality[airquality$Month==5 & airquality$Day==1,]   ##########################
subset(airquality, Month==5 & Day==5)

#melt를 통해 바뀐 구조
airquality.melt[airquality.melt$Month==5 & airquality.melt$Day==5,]
subset(airquality.melt, Month == 5 & Day ==5)                             ###복습!!!


#melt된 데이터를 원상복구: dcast vs. acast
airquality.dc <- dcast(airquality.melt, Month+Day~variable) #Month, Day 변수로      #data, 기준
head(airquality.dc)

airquality.ac <- acast(airquality.melt, Month+Day~variable)  # Month, Day 행이름로 
head(airquality.ac)
airquality.ac['5_1',]

#3. 데이터 테이블: 짧고 유연하고 빠른 구문 사용을 위하 데이터프레임에서 상속받음
flights_df <- read.csv("inData/flights14.csv")
head(flights_df)
class(flights_df)

library(readxl)
exam <- read_excel("inData/exam.xlsx")
class(exam)

install.packages("data.table")      #fread() : csv파일을 '데이터테이블'로 받는 함수 
library(data.table)
flights <- fread("inData/flights14.csv")
View(flights)
class(flights)

#변수 2개 가지고 조작
#flights_df (데이터프레임), flights(데이터테이블)

#dataframe, datatable 




# 문제 : flights_df(데이터프레임)와 flights(데이터테이블)에 대해 다음의 R명령어를 작성하시오

# 1. origin이 JFK이고 month가 5월인 모든 행을 result에 얻는다
result <- flights_df[flights_df$origin=='JFK' & flights_df$month==5,]
result <- subset(flights_df, origin=='JFK' & month==5)

#(2)방법
result <- flights[origin=='JFK' & month==5]      #데이터 테이블    
                  #flights , flights_df 다른 이유
                  #flights:data.table  data.frame 둘다 가능  #flights_df: data.frame 하나만 가능 
result

# 2. 처음 두 행을 result에 얻는다
result <- flights_df[1:2,]
result

result <- flights[1:2]                              #데이터 테이블 
result

# 3. origin으로 오름차순, desc로 내림차순으로 정렬하여 출력
flights_df[order(flights_df$origin, desc(flights_df$dest)), ]
flights_df[order(flights_df$origin, -flights_df$dest), ]  # dest(목적지)변수는 문자라 불가능

#order(flight$origin, -flight$dest)          dest가 문자변수여서 - 불가능 
flights[order(flights$origin, -flights$dest)]
flights[order(origin,-dest)]      #order를 색인안에다 넣으면 간편해져 

# 4. arr_delay열만 출력
flights_df[, 'arr_delay'] # 벡터 형태로 출력
flights_df[, 'arr_delay', drop=F] # 데이터 프레임 형태로 출력
subset(flights_df, select='arr_delay') # 데이터 프레임 형태로 출력

flights[,c(arr_delay,dep_delay)]    #데이터테이블 . ''필요없어.  vector형태 
subset(flights, select = arr_delay)           #데이터프레임 형태


# 5. year열부터 dep_time열까지 출력
head(flights_df,2)
colnames(flights_df)
flights_df[,1:4]
flights_df[,c('year','month','day','dep_time')]
flights_df[,c('year':'dep_time')]                #불가
subset(flights_df, select=c(1:4))
subset(flights_df, select = c('year','month','day','dep_time'))
subset(flights_df, select = c('year':'dep_time')) #불가


flights[,year:dep_time]     #데이터테이블은 :가 가능하고, ''도 넣을 필요없어 
subset[flights,select=c(year:dep_time)] #데이터테이블

# 6. year열과 dep_time열 출력
flights_df[,c(1,4)]
flights_df[,c('year','dep_time')]
subset(flights_df, select = c(1,4))
subset(flights_df, select=c('year', 'dep_time'))


flights[,year,dep_time]
flights[,list(year,dep_time)]
flights[, .(year,dep_time)]         #모든행 출력      #특정한 열의 갯수만 출력     
                                             

# 7. arr_delay열과 dep_delay열을 출력하되 열이름을 delay_arr과 delay_dep로 변경
temp <- flights_df[,c('arr_delay','dep_delay')]
names(temp) <- c('delay_arr','delay_dep')        #열이름 변경
colnames(temp) <- c('delay_arr','delay_dep')      #열이름 변경
temp

flights[, .(delay_arr=arr_delay,delay_dep= dep_delay)]              #변경후의 이름을 앞에다 == 변경전 이름 



# 8. 지연시간('arr_delay, dep_delay모두 0미만인' 비행이 '몇 번'인지 출력
nrow(flights_df[flights_df$arr_delay<0 & flights_df$dep_delay<0,])

flights[arr_delay<0 & dep_delay<0, .(.N) ]  #.N 갯수      
flights[arr_delay<0 & dep_delay<0, .(cnt=.N) ] 

# 8-1 지연시간의 합이 0 미만인 비행이 몇번인지 출력
nrow(flights_df[flights_df$arr_delay+flights_df$dep_delay <0,])

flights[arr_delay+dep_delay<0,.(.N)]
flights[arr_delay+dep_delay<0,.(cnt=.N)]

# 9. '6월에 출발 공항이 JFK'인 모든 항공편의 도착지연 및 출발지연 시간의 평균을 계산
apply(subset(flights_df, flights_df$origin=='JFK' & flights_df$month==6, select = c('arr_delay', 'dep_delay')), 2, mean)

apply(subset(flights_df, origin=='JFK' & month==6, select = c('arr_delay', 'dep_delay')), 2, mean)
#이 범위안에서, 이 두열 만 뽑아서 ,열별 평균 


flights[origin=='JFK' & month==6, .(mean_arr=mean(arr_delay),
                                    mean_dep=mean(dep_delay))]



# 10. 9번의 결과에 title에 mean_arr, mean_dep로 출력
x <- apply(subset(flights_df, origin=='JFK' & month==6, select = c('arr_delay', 'dep_delay')), 2, mean)
names(x) <- c('mean_arr', 'mean_dep')
x

flights[origin=='JFK' & month==6,.(mean_arr=mean(arr_delay),
                                   mean_dep= mean(dep_delay)) ]   #뒷부분 출력하고자하는 열


# 11. JFK 공항의 6월 운항 횟수
nrow(subset(flights_df,origin=='JFK' & month==6))

flights[origin=='JFK' & month==6, .(cnt=.N)]

# 12. JFK 공항의 6월 운항 데이터 중 arr_delay열과 dep_delay열을 출력
subset(flights_df, subset=(origin=='JFK' & month==6), select=c("arr_delay","dep_delay"))
subset(flights_df, origin=='JFK' & month==6, select=c("arr_delay","dep_delay"))
flights_df[flights_df$origin=='JFK' & flights_df$month==6, c("arr_delay","dep_delay")]

flights[origin=='JFK'&month==6, .(arr_delay,dep_delay)]
flights[origin=='JFK'&month==6, list(arr_delay,dep_delay)]

# 13. JFK 공항의 6월 운항 데이터 중 arr_delay열과 dep_delay열을 제외한 모든 열 출력
subset(flights_df, subset=(origin=='JFK' & month==6), select=-c(5,7))
subset(flights_df, subset=(origin=='JFK' & month==6), select=c(-5,-7))
subset(flights_df, subset=(origin=='JFK' & month==6), select=-c("arr_delay","dep_delay")) #불가

flights[origin=='JFK' & month==6, -c(arr_delay,dep_delay)] #백터형태 
flights[origin=='JFK' & month==6, -c("arr_delay","dep_delay")]  #데이터프레임 

# 14. 출발 공항(origin)별 비행 수 출력 (JFK 81483 LGA 84433 EWR 87400)
table(flights_df$origin)

flights[, .(.N), by=.(origin)]

# 15. 항공사코드(carrier)가 AA에 대해 출발공항별 비행횟수 계산
table(subset(flights_df, carrier=='AA')$origin)

flights[carrier=='AA', .(.N), by=.(origin)]

# 16. origin, dest별로 비행횟수 출력
table(flights_df$origin, flights_df$dest)

flights[, .(.N), by=.(origin,dest)]


# 17. 항공사코드(carrier)가 AA에 대해 origin, dest별로 비행횟수 출력
table(flights_df[flights_df$carrier=='AA',]$origin, flights_df[flights_df$carrier=='AA',]$dest)
table(subset(flights_df, carrier=='AA')$origin, subset(flights_df, carrier=='AA')$dest)

flights[carrier=='AA', .(.N),by=.(origin,dest)]


# 18. 항공사 코드가 AA에 대해, origin, dest, 월별 평균arr_delay, 평균 dep_delay 출력
library(doBy)
summaryBy(arr_delay+dep_delay~origin+dest+month, subset(flights_df, carrier=='AA'), FUN=mean)
flights[carrier=='AA',.(mean_arr=mean(arr_delay),
                        mean_dep= mean(dep_delay)), by=.(origin,dest,month)]

# 19. dep_delay>0가 참이거나 거짓, arr_delay>0가 참이거나 거짓인 각각의 비행횟수
table(flights_df$dep_delay>0, flights_df$arr_delay>0)

flights[, .(.N), by=.(dep_delay>0, arr_delay>0)]


# 20. Origin==“JFK”에 대해 월별 최대 출발 지연 시간 출력(month로 정렬)
sort(tapply(subset(flights_df, origin=='JFK')$dep_delay, subset(flights_df, origin=='JFK')$month, max))

x<-flights[origin=='JFK', .(max=max(dep_delay)),by=.(month)]
x[order(x$max)]




















