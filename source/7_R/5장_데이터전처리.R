###########################################
#######5장. 데이터 전처리 #################
###########################################

#1.파일 입출력



#1.1 시스템 인코딩 조회 
Sys.getlocale()

#1.2 write.table; 데이터를 파일에 저장 
iris
class(iris)
write.table(iris,file='outData/iris.csv',sep=',')   #,만써야 
write.table(iris,file='outData/iris.csv',sep=',',row.names = FALSE)  # row.names = FALSE    ROWNUM빼라
head(iris)
InsectSprays                                                        
str(InsectSprays)
write.table(InsectSprays,file='outData/insect.csv',sep=',')     ####program files 다운받을때 안에 dataset파일안에 내장되어있음. 없는 데이터는 install package해서 다운받아야함 

#1.3 read.table; 파일을 읽어 데이터프레임 형태로 저장 
irisData <- read.table('outData/iris.csv',sep=',',header=TRUE, encoding='utf-8', stringsAsFactors = TRUE) #stringsAsFactors = TRUE      파일안에 string은 다 factor로 바꿔라 

head(irisData)
tail(irisData)
str(irisData)
irisData$Species <- as.factor(irisData$Species)       #irisData$Species   label를 대놓고 지정 // levels를 통해서 현label뭐 있는지 보고  이 것들로 지정
levels(iris$Species)
irisData$Species <- factor(irisData$Species,levels=c("setosa","versicolor","virginica" ))
irisData$Species
str(iris$Species)                                             
nrow(iris)
summary(iris)



#1.4 write.csv
write.csv(iris,file='outData/iris1.csv')      #폴더 안에 파일이 생김
write.csv(iris,file='outData/iris1.csv',quote=FALSE)     #QUOTE없앰 (메모장 열기로 비교해서 확인가능)


#1.5 read.csv
newData <- read.csv('outData/iris1.csv',header = TRUE, stringsAsFactors = T)
str(newData)
head(newData)
summary(newData)


#1.6 cat; 분석 결과 등을 저장할 때

#파일입출력 
    #irisSummary.txt 가독성 좋게 
irisSummary <- summary(newData)
class(irisSummary)
irisSummary[1,]  #,하면 한줄 전체 다 나옴 
nrow(irisSummary)
cat('iris요약:','\n',file='outData/irisSummary.txt',Encoding='utf-8')
for(i in 1:nrow(irisSummary)){
  cat(irisSummary[i,],'\n',file="outData/irisSummary.txt",append=T)  
}    #nrow(irisSummary)가 6


#2. apply계열 함수 적용
  #apply ; 계열 함수를 이용하면 반복문 사용보다 코드 최소화, 수행속도 빠름

#2.1 apply:
#iris데이터의 열별 평균 (합계,분산,표준편차,최소값,최대값,중앙값) 
  #apply(대상자료, 1또는2, 함수) 1은 행별 함수 수행, 2은 열별 함수 수행
head(iris[,1:4])  #1부터4열까지만 평균
head(iris[,-5])
apply(iris[,1:4],1,mean)  #행별 평균
apply(iris[,-5],2,mean)   #열별 평균

# setosa종과 versicolor종과 virginica종을 분류하고 각각의 열별 평균 구하기 
apply(subset(iris,iris$Species=='setosa', select=-5),2,mean)
apply(subset(iris,iris$Species=='versicolor', select=-5),2,mean)
apply(subset(iris,iris$Species=='virginica', select=-5),2,mean)

apply(iris[,1:4],2,FUN=mean)  #열별 평균
apply(iris[,1:4],2,FUN=sd)    #열별 표준 편차
apply(iris[,1:4],2,FUN=sum)   #열별 합계
apply(iris[,1:4],2,FUN=median)#열별 중앙값
apply(iris[,1:4],2,FUN=min)   #열별 최소값 
apply(iris[,1:4],2,FUN=max)   #열별 최대값 


#InsectSprays에서 count의 표준편차 
sd(InsectSprays$count)

name <- c('김','홍','박','이','윤')
kor<- c(90,50,70,60,100)
eng<-c(100,40,50,60,70)
mat<-c(90,91,50,64,80)
student <- data.frame(name,kor,eng,mat)
student

#사람별 평균, 과목별 평균 
apply(student[,-1],1,mean) #학생별 평균          #-1혹은 2:4   (이름빼기위해,그래야 숫자만)
apply(student[,-1],2,mean) #과목별 평균          #-1혹은 2:4   (이름빼기위해,그래야 숫자만)

#apply(subset(student,student$name=='김',select=-5),2,mean) X 이렇게 하면 틀림 


#2.2 lapply: list apply(결과도 list)
x <- list(a=1:10, beta=exp(-3:3), )


exp(-3:3) #e의-3승부터 e의3승까지 출력되는 지수함수
x <- list(a=1:10, beta=exp(-3:3),logic=c(T,F,F,T))
x

lapply(x,mean)
lapply(x,quantile)
lapply(x,quantile,1:3/4)  #1/4부터3/4까지만 

#2.3 sapply:simplification apply.  lapply와 유사하나 결과가 '행렬이나 벡터'로 반환
sapply(x,mean)
sapply(x,quantile)
sapply(x, quantile,1:3/4)

fivenum(0:1)  #0부터1까지 5개 구간  
fivenum(0:100)
i39 <-sapply(c(3:9),seq)  #123 1234 12345 123456
i39
sapply(i39,fivenum)
lapply(i39,fivenum)

#문, iris데이터를 lapply와 sapply를 이용하여 Sepal.length ~ Petal.Width까지의 평균 구하라
irisList <- as.list(iris[,1:4])  #5번째 열 평균 못낸다
irisList 

lapply(irisList,mean)
sapply(irisList,mean)


#2.4 vapply: sapply: FUNCTION의 '모든 값이 특별 VALUE타입과 호환되는지 확인'
      #value simplification apply
vapply(irisList,mean,numeric(1)) # mean을 4번한것
vapply(i39,fivenum, FUN.VALUE=c(numeric(1),numeric(1),numeric(1),numeric(1),numeric(1)))              # 하나 가지고 결과 5개 
citis <- c('Seoul','Busan','New York','Tokyo')
citis
nchar(citis[1])  #length of 'Seoul'
sapply(citis,nchar)
lapply(citis,nchar)
vapply(citis,nchar, FUN.VALUE = numeric(1))


#2.5 mapply: apply같으나 여러개의 인자를 함수에 전달
rep(c(1,2,3),3)  #123  세번반복
#rep(c(1,2,3),each=3,times=2)
x <- c(1,2,3,4)
mean(x)

rep(c(1,2,3),2)           #times를써야 length로 안빠져 
mapply(rep,x=1:4,times=4:1) #rep(1,times=4) rep(2,times=3) rep(3,times=2) rep(4,times=1)

#직업별 수입 
job <-c(3,3,5,2,2,3,5,3,4,4,6,3)   #직업번호 
income <- c(4879,6509,4183,0,3894,0,3611,6454,4975,8780,0,4362)
cust <- data.frame(job,income)
cust

income.avg <- c(900,0,3500, 3600,3700,3800,3900,4000)
income.avg
names(income.avg) <- 0:7 #직업번호0번부터7번
income.avg[2]   #2가job코드
zero2mean <- function(job,income){
  #return(ifelse(income==0,income.avg[as.character(job)],income))      
  if(income==0){
    return(income.avg[as.character(job)])  #그냥job놓으면 변수처럼 인식해서 string로 변환
  } else{
    return (income)
  }
  #income  0 평균값으로 return
}

#zero2mean(cust$job,cust)

#for문으로 zero2mean(cust[1,'job'],cust[1,'income']) #변수 in 1: cust.length을 하지 않고

cust$income2 <-mapply(zero2mean,cust$job,cust$income)
cust               #이제 0파트가 '평균값'으로 채워짐  (위에if문으로 설정했기때문에)


# 3. 데이터 그룹화 함수 적용
# 3.1 tapply: 그룹화 처리를 위한 apply    
tapply(iris$Sepal.Length,iris$Species,mean)  #(1)번째 위치-그룹화 하고 싶읂 아이 (2)번째 위치-factor변수 (3)function
tapply(iris$Sepal.Length,iris$Species,sd)     #표준편차 '평균'에서 이만큼 +- 
boxplot(iris$Sepal.Length~iris$Species)   #iris 종별로 박스로 표현

cust


#tapply를 이용해서 직업군별 평균income계산 

#0-7factor변수로 바꾸고,tapply돌린다 

str(cust)
cust$job <- as.factor(cust$job)
cust$job <- factor(cust$job,levels=0:7)       #0부터7번job번호 ###############################################
                                                #job <-c(3,3,5,2,2,3,5,3,4,4,6,3)   #직업번호  [앞에 내가 이렇게 설정  여기에 직업번호0,1,7은                                                                                                      #존재하지 않는다] 따라서 0,1,7 NA
tapply(cust$income2, cust$job, FUN=mean)  #(1)평균을 구했으면 좋겠는 아이 (2)분류하고자하는 그룹기준 (3) 무엇을 구하고 싶은지
tapply(cust$income2, cust$job, FUN=mean, default=-1) #default값은 NA대체값 

datasets::InsectSprays
head(InsectSprays)
str(InsectSprays)  #체크해보니 factor로되어있다  바로tapply 적용가능 

#spray의 종류에 따른 살충효과를 점검해보세요 
tapply(InsectSprays$count,InsectSprays$spray,mean)  #(1)비교하고자하는 대상 (살충 몇마리되는지) (2)그룹대상 (스트레이 종류) (3)function이름 ##############
tapply(InsectSprays$count,InsectSprays$spray,sd)
nrow(InsectSprays)
boxplot(InsectSprays$count,InsectSprays$spray)


#tapply(InsectSprays$count,InsectSprays$spray,FUN=c(mean,sd))  #필드 한개 밖에 안됨  #실행안됨  #이의 단점을 보완하기 위해 by
tapply(iris[,1:2],iris[,5],sum)          #2열을 동시에 하는거 안됨  ????? 왜 안되는지??? # error message:인자들은 반드시 같은 길이를 가져야 합니다
                                        #tapply 한열 밖에 안됨. 2열이상x 따라서 tapply(iris[,1],iris[,5],sum) 은 실행되는데,  tapply(iris[,1:2]  
                                                                                                                  #,iris[,5],sum)는 실행불가   

#3.2 by;그룹화 처리를 위한 apply (함수를 2개 이상 가능)
by(iris[,1:2],iris[,5],min)   #by는 mean, sd안됨. 나누기 계통 안됨  그것은summaryby   ###########
                              #(1)비교하고자하는 대상 (살충 몇마리되는지) (2)그룹대상 (스트레이 종류) (3)function이름
                              #의미: species (iris[,5])를 기준으로  'Sepal.Length 및Sepal.Width(1,2열)'을 비교하여, 최소값(min)을 추출##########
                  
by(iris[,1:4],iris$Species,summary)
iris

#cust의 직업별 평균을 income과 income2를 한꺼번에 
by(cust[,c('income','income2')], cust[,'job'],summary )   #그룹화 시킬 factor변수는'job' 


#3.3 doBy 패키지 
install.packages("doBy")
library(doBy) #따움표 생략가능
summaryBy(Sepal.Length+Sepal.Width ~ Species, iris)      #함수명은 default mean    #doBy package를 다운받으므로 summaryBy 이제 사용가능
                                                      
summaryBy(Sepal.Length+Sepal.Width+Petal.Length+Petal.Width ~ Species, iris, FUN=sd)

summaryBy(Sepal.Length+Sepal.Width+Petal.Length+Petal.Width ~ Species, iris, FUN=c(mean,sd)) #summaryBy는 fun 2개 쓸 수 있다 


#문 emp.csv파일의 데이터를 받아 '부서별 급여, 상여금'을 비교하시오. 

#부서 deptno로 바꾸고 , by 
emp <- read.csv('inData/emp.csv', header=T,stringsAsFactors =F)     #data파일가져옴####################### 
emp
str(emp$deptno)
emp$deptno <- as.factor(emp$deptno)
emp$deptno <- factor(emp$deptno, levels=seq(10,40,10))
names(emp)
summaryBy(sal+comm~deptno,emp,na.rm=T)                            # na.rm=T 결측치 빼기 #############################

emp


#부서별 급여, 상여금:         emp$sal  emp$comm  

#30번 부서의 comm평균 


#(2) orderBy:정렬    #DATAFRAME의 행을 정렬(ordering)   #orderBy(formula,data)
orderBy(~Sepal.Length,data=iris) #오름차순 정렬 
orderBy(~-Sepal.Length,data=iris) #내림차순 정렬  (앞에 - 붙이면 내림차순 정렬)
orderBy(~Species+Sepal.Length,data=iris) #Species순 내림차순, Sepal.Length
orderBy(~Species-Sepal.Length,data=iris)

#종별, Sepal.Length '오름차순'으로 정렬한 데이터를 Sepal.Length, Sepal.Width, Species
orderBy(~Species+Sepal.Length,data=iris)[,c(1,2,5)]         #Sepal.Length Sepal.Width    Species
orderBy(~Species+Sepal.Length,data=iris)[,c(-3,-4)]   #############복습!!######### 

#문1. emp데이터셋에서 '월급이 적은 순'으로 'ename, sal'을 추출
orderBy(~sal,data=emp)[,c('ename','sal')]    #data는vector정렬


#문2. 월급이 적은 순 6명만 ename,sal

head(orderBy(~sal,data=emp)[,c('ename','sal')])


#(3) sampleBy         dataframe은 formula의 '변수에 따라분할'되고/각각 '분할된 그룹'에서 '특정 비율의 샘플' 추출
sampleBy(~Species,data=iris,frac=0.2) #group별 20%씩 표본 추출 (비복원추출)  #0.7이면70%
          #복원추출은 뽑고 다시 넣어, 그래서 '중복된게 뽑힐 수 있다' 따라서 '비복원 추출'이 일반적 

sampleBy(~Species,data=iris,frac=0.1,replace=T) #복원추출 
sampleBy(~Species,data=iris,frac=0.1,systematic=T) #계층적추출  #10%를 뽑는데  어떤기준으로 따라 데이터가 들어가. 특색있는 데이터가 뽑아져 sampling에 의미 없다. 따라서 위에거 많이 써 (70%뽑아서 modeling, 30% test)

#벡터 샘플링 
idx <- sample(1:150,10) #앞vector 1부터150중에 10개 뽑아
idx
iris[idx,] #전체에서 10개 뽑기   nrow  iris x 0.7

# 4. Formula ~ + 
##lm() 선형회귀식 도출 함수 (독립변수, 종속변수 연속적 변수에서 사용  '명명식, 순서식은 제외')
x <- c(1,2,3,4,5) #공부량 (독립변수)
y <- c(20,41,59,81,99) #점수(종속변수) - 회귀분석 ; lm()함수 이용 
y1 <- c('F','F','F','P','P') #당락여부(종속변수) - 로지스틱회귀 ; glm()    generalized linear model

#While, in a GLM, we specify a model for the mean of the response (y); hence, parameters can be interpreted in terms of effects on mean response, in a LM on transformed data, we model the mean of transformed data, which is something entirely different and occasionally nonsensical (e.g.


fit<-lm(y~x) #fit 회계분석 모델을 가지고 있는 변수          #########################복습!!!!!!!!!
fit
plot(x,y,col='blue')
lines(x, x*19.8+0.6 ,col='red')     #위에 Coefficients:
                              #(Intercept)            x  
                              #0.6         19.8  

#예측값가지고 
abline(fit,lty='dashed')   #fit에 회귀식이 있어서

#독립변수가 2개 
x1 <- c(1,2,3,4,5)     #공부량
x2 <- c(10,20,3,4,5)   #기출문제 푼 갯수
y<-c(50,70,63,84,95)   #종속변수  (점수)
fit<-lm(y ~ x1+x2)     #x1과x2사이의 상관없다 전제 
fit   #(절편 25   x2는1 따라서 가중치 매우 적다 )

#cars
cars    #속도에 따른 제동거리의 관계를 회귀식으로 도출   The data give the speed of cars and the distances taken to stop.
plot(cars$speed,cars$dist)
plot(cars)
fit <- lm(cars$dist ~ cars$speed ) #종속 변수, 독립변수
fit <- lm(dist~speed,data=cars)   #결과는 위와 같다 
fit
lines(cars$speed,cars$speed*3.932-17.579, col="red")    #fit출력에서 나온숫자
abline(fit,lty='dotted')  #lty == line type


#5.데이터 분리
#5.1 split      vector또는dataframe x의 테이터를 / '범주형변수(factor) f로 정의된 그룹'으로 '나눕'니다.
iris.species <- split(iris,iris$Species)  #list형태 
iris.species
iris.species['virginica']  #'virginica'만 뽑힘 


iris.sepal <- split(iris,iris$Sepal.Length>5) #  데이터, 기준
iris.sepal  #TRUE,FALSE로 나눠짐 
iris.sepal['FALSE']
iris.sepal$'FALSE'
head(iris.sepal$'FALSE')

#5.2 subset            subset(x,subset,select,drop=FALSE)
#문. setosa종 중 Sepal.Length, Petal.Length 열 출력
names(iris)
subset(iris,subset=(iris$Species=='setosa'),select=c(1,3))
subset(iris,subset=(iris$Species=='setosa'),select=c('Sepal.Length','Petal.Length'))


#문. setosa종 중 Sepal.Length, Sepal.Width, Petal.Length, Petal.Width 열 출력
subset(iris,subset=(iris$Species=='setosa'),select=c('Sepal.Width', 'Petal.Length', 'Petal.Width'))
subset(iris,subset=(iris$Species=='setosa'),select=c(1:4))
subset(iris,subset=(iris$Species=='setosa'),select=c(-5))  #5번째 줄 제외하고 
subset(iris,subset=(iris$Species=='setosa'),select=-c(5)) 
subset(iris,subset=(iris$Species=='setosa'),select=-5) 
subset(iris,subset=(iris$Species=='setosa'),select=-5) 



#문. setosa 중 Sepal.Length가 4 이상인 데이터 출력   (조건2개이상이면 and로 묶어)
subset(iris,subset=(iris$Species=='setosa' & Sepal.Length>=4))


#6. 데이터 합치기
#컬럼합치기 cbind()             
#행 합치기  rbind()
#병합하기   merge()
#6.1 cbind   열합치기  #cbind(...,deparse.level=1)
student.a <- data.frame(name=c('lee','kim'),score=c(100,90))
student.a
student.b <-data.frame(id=c(100,101),gender=c('여','남'))
student.b
(student<-cbind(student.a,student.b))
student        #name score     id gender  2개의 테이블에서  --> name score id gender 하나의 테이블이됨

#6.2 rbind()
student.a <- data.frame(name=c('lee','kim'),score=c(100,90))
student.b <- data.frame(name=c('park','yun'),score=c(99,91))
(student <- rbind(student.a,student.b))
#  name score           name score
#1  lee   100           park    99        -->  위아래로 합쳐짐
#2  kim    90           yun    91

#6.3 merge
student.a <- data.frame(name=c('lee','kim'),kor=c(100,90))
student.b <- data.frame(name=c('lee','kim'),eng=c(90,80),mat=c(99,88))
(student <- merge(student.a,student.b))     #data가 똑같이 들어가있기때문에 잘 merge됨


student.a <- data.frame(name=c('yun','kim'),kor=c(100,90))
student.b <- data.frame(name=c('lee','kim'),eng=c(90,80),mat=c(99,88))
(student <- merge(student.a,student.b,all=T))    #데이터손실 NA(결측치)는 평균값을 넣어


#7.데이터정렬
#sort() 정렬된 데이터 반환 / order() 정렬된 데이터의 index 반환 

data <- c(10,30,100,1,3)
sort(data)                  #오름차순 정렬
sort(data,decreasing= TRUE) #내림차순 정렬
sort(iris$Sepal.Length)


data <- c(10,30,100,1,3)
names(data) <-c ('1번째','2번째','3번째','4번째','5번째') #1:5
data
sort(data)
order(data)   #data가 아니라 index가 나옴 
data[order(data)]  #sort(data)   #data[index]   index의 data출력

#iris 데이터를 Sepal.Length를 기준으로 '내림차순' 정렬
sort(iris$Sepal.Length,decreasing = T)
order(iris$Sepal.Length, decreasing = T)      #14번째 아이가 4.3
iris[14,1]  #14번째행의 첫번째 아이 

iris[order(iris$Sepal.Length,decreasing=T), ]


#iris데이터를 Sepal.Length(내림차순), Sepal.width(오름차순)
order(-iris$Sepal.Length, iris$Sepal.Width)
iris[order(-iris$Sepal.Length, iris$Sepal.Width),c(1,2,5)]   #######


#emp데이터셋에서 월급이 많은 순으로 ename, sal을 추출
order(emp$sal)
emp[order(-emp$sal),c('ename','sal')]



#emp데이터셋에서 월급이 많은 top 5명의 ename,sal을 추출 
head(emp[order(-emp$sal),c('ename','sal')],5)    #index
emp[order(-emp$sal),c('ename','sal')][1:5,]      #data

#emp데이터셋에서 월급이 적은 top 5명의 ename,sal을 추출 
tail(emp[order(-emp$sal),c('ename','sal')])



#8. 데이터 프레임 이름 생략하기 
#8.1 with절, within절
iris.temp <- iris
iris.temp[c(1,3),1]<-NA
head(iris.temp,3)

#종별 중앙값
split(iris.temp$Sepal.Length,iris.temp$Species) #결과는 list
mps <- sapply(split(iris.temp$Sepal.Length,iris.temp$Species),median,na.rm=T)
mps
(mps <- tapply(iris.temp$Sepal.Length,iris.temp$Species,median, na.rm=T))
mps['setosa']
iris.temp$Sepal.Length2 <- ifelse(is.na(iris.temp$Sepal.Length),mps[iris.temp$Species],iris.temp$Sepal.Length)
head(iris.temp[,c('Sepal.Length','Sepal.Length2')])
iris.temp$Sepal.Length2<-NULL
head(iris.temp)

#with절은 Sepal.Length의 결측치가 대치된 '결과값'을 반환 
#within절은 Sepal.Length의 결측치가 대치된 '데이터 프레임 셋'이 반환 

iris.temp <- within(iris.temp,{
  mps <- tapply(Sepal.Length, Species,median,na.rm=T)
  Sepal.Length <- ifelse(is.na(Sepal.Length),mps[Species],Sepal.Length)   #Sepal.Length  NA맞니?  아니면 Sepal.Length  
})
head(iris.temp)


#8.2 attach(), detach()함수     #attach:access the variables present in the data framework without calling the data frame
attach(iris)
summary(Species)
Sepal.Length
tapply(Petal.Length,Species,mean)
detach(iris)  #attach기능 해체

#9. 데이터 집계
#9.1 table
table(iris$Species)
emp = read.csv('inData/emp.csv',header=T)
table(emp$ename) #factor변수가 아니면 집계가 무의미

head(InsectSprays)
#InsectSprays 데이터 셋에서 spray별 집계
table(InsectSprays$spray)  #각 종류별 12개

#emp 데이터 셋에서 deptno별 집계
str(emp$deptno)
emp$deptno <- factor(emp$deptno,levels=seq(10,40,10))  #facor를 만들어놓음
table(emp$deptno)


#9.2 aggregate: 데이터를 하위 집합으로 분할하고 요약 통계 계산 
aggregate(iris[,1:4],by=list(iris[,5]),mean )   #5열       #####전체행, 1-4열,  // iris의5열기준으로 분류 // mean평균을 구함

#보험회사의 고객들이 보험금을 청구하는 데이터에서 고객별 입원일 조회
cust_id<- c(1005,1002,1003,1004,1005,1001,1005,1002,1003,1005)
hos_day <-c (2,   3 ,  20, 5,    13,  0,   8,   2,    3,  16)
length(cust_id)
length(hos_day)
data <- data.frame(cust_id,hos_day)
day_per_cust <- aggregate(data$hos_day, by=list(data$cust_id),sum)

names(day_per_cust) <- c('cust_id','hos_day')
day_per_cust
day_per_cust[order(-day_per_cust$hos_day),]
 

#아래가 다 같은 결과 

#대상열이 하나만 가능, FUN은 하나만  
aggregate(data$hos_day, by=list(data$cust_id),sum) 

#대상열이 하나만 가능 
tapply(data$hos_day,data$cust_id,sum)  #id끼리sum한다 
library(doBy)

#FUN을 두개 이상 가능
summaryBy(hos_day~cust_id, data=data,FUN=sum)  #FUN을 두개 이상 가능 


#10. 조건으로 색인찾기 : which()
subset(iris,iris$Species=='setosa')  #조건으로 데이터 추출 
which(iris$Species=='setosa') #조건으로 색일 추출      #setosa의 색인

iris[which(iris$Species=='setosa'),] #조건을 이용해서 데이터 출력 (행이setosa, 열전체)

which.max(iris$Sepal.Length)
iris[which.max(iris$Sepal.Length),] #Sepal.Length가 제일 큰 row를 출력 

































