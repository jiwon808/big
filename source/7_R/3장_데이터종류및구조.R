###################################
#######3장. R 데이터 종류 및 구조 
###################################

#1. 데이터 종류: 기본데이터타입(문자,숫자,logical)= 스칼라타입 
       # 팩터,백터,리스트,행렬,배열,데이터프레임,날짜, 특별한값(결측치...)

#2. 기본데이터 타입: character,numeric,logical
a<-"Hello"
class(a)          #class==type이 나옴

cat(a)            #\n을 수행, print와사용법 같음
cat('a 값은',a)

b<-10.1
b<-10
strB<-as.character(b)   #as.*():      *타입으로 형변환  (type변환)
strB
C<-TRUE;
C
is.logical(C)   #   method(is) ->is.*(); *형이나 값을 물어보는 함수 


class(strB)
class(a) #class()함수는 타입을 확인 
class(b)
class(c)

str(a) #str(R의 내부 구조를 간결하게 표시)
str(b)
str(c)


#3. 특별한 값(Null, NA; 결측치,NaN, Inf)
result <- 0
add <- function(a,b){
  result <<- a*5+b    #전역변수 result에 할당
  #return(result)
  return()
} 
(temp <- add(1,2))    #일반변수 temp에 할당 
(temp <- add(a=1,b=2))
(temp <- add(b=10,a=5))
(temp <- add(a=1,b=3)) #NULL; Empty value
is.null(temp)          #null이면true

d <- c(2,4,NA,6,NaN,10/0) #NA means not available  #여기서c를 vector (동일자료형 집합)
d




# NA(결측치) 관련함수
#is.na(d) #결측치(missing value)인지 아닌지   NA가 있으면  TRUE
# complete.case(d) #NA가 없으면 TRUE
#na.omit(d); 결측치 제외
#na.pass(d); NA여부 상관없이 처리 

is.na(d[3]) #결측치(missing value) 여부 TRUE/FALSE   
is.na(d)
?is.na #도움말 보는 습관을 들여 
complete.cases(d)
na.omit(d)
na.pass(d)
mean(d) #평균값 계산시 NA가 있을 경우 NA
?mean
d<- c(2,3,4,5,NA,12)
mean(d,na.rm=TRUE)  #rm means Remove Objects from a Specified Environment ##NA를 제외하고 mean계산
boxplot(d)
?rm

#4.팩터(Factor): 범주형데이터, 명명식, 순서식 
gender1<-c('남','남','여')
gender1[3]
class(gender1)
gender1[4]<-'중성'
gender1
gender <- factor(c('남','남','여'),levels=c('남','여')) #꼭 뭐와뭐만 들어오고 다른거 못들어오게 하고 싶을때 factor사용 
class(gender)
gender[3]   #남과여중에 여
gender
str(gender)
gender[4] <- '중성'
gender
?factor
level <- factor(c('좋음','보통','보통'),levels=c('싫음','보통','좋음'),ordered=TRUE) ####### ordered= TRUE로하면 오른쪽으로 갈수록 더 강하다 
level

level <- ordered(c('좋음','보통','보통'),levels=c('싫음','보통','좋음'))
level
level[4]<-'몰라'
level  #'몰라'는  싫음,보통,좋음 이 아니므로 NA로 들어감 

nlevels(level) #level변수의 범주 갯수 수 
nlevels(gender)
levels(level) #level변수의 범주들
 
gender1<-c('남','남','여')
class(gender1)
gender1 <- as.factor(gender1) #5장 전처리에서
gender1

# 5.구조형 변수와 복합형 변수; 변수 하나에 여러 값을 가져야 
# (1)구조형 변수: 동일자료형  
      # ex.벡터,행렬,배열
# (2)복합형 변수: 서로 다른 자료형 가질 수 있음 
      # ex. 리스트,데이터프레임(csv)

#6. 벡터: 동일자료형의 집합 
data <- c(11,22,33,'TEST') #숫자,문자 -> 문자
data <- c(11,22,33,TRUE)   #숫자,logical ->숫자(T:1, F:0)
data

data <- c(TRUE,'TEST') #logical,문자 ->문자
data


data <- c(1,2,3)  # 1index부터 시작
data[4]<-40
data

#행과 열정보 조회
NROW(data) #항목갯수
length(data) #항목갯수

data <- c(1:4)
data
names(data) <- c('A열','B열','C열','D열')
data
#특정한 값 조회
data[1]   #첫번째 값 반환 
data['A열'] #A열 값 반환 

data[c(1,2)] #첫번째, 두번째 값 반환
?c   #Combine Values into a Vector or List
data[c(1:2)] #첫번째부터 2번째까지의 값 반환 
data[c('A열','B열')] #A열 B열 값 반환
data[-2] #음수일 경우 2번째 제외
data[data>2] #2보다 큰 값만 반환
data[c(TRUE,FALSE,FALSE,TRUE)] #TRUE인 열만 가져오고 FALSE인 열은 가져오지 마라  -->그럼 여기서1,4번째 열 반환

2 %in% data  #data에 2가 포함되어 있는지 여부 TRUE/FALSE

#Q. 시험점수 변수를 만들고 출력하고 전체 평균을 구한 후 출력
 #80,   60, 70, 50, 90 미응시 
 #lee,kim,park, min,ki,kwon
score <- c(80,60,70,50,90,NA)
cat(paste("시험점수는",score))        #####앞에 글자 붙이고 싶을때 
(avg<-mean(score,na.rm=TRUE))
help(mean)

names(score)
names(score)<- c('lee','kim','park', 'min','ki','kwon')
score
score[score>80]
class(score)  #class함수 이용시 백터 요소 하나하나의 타입
is.vector(score)

#6.1 character()
charArr <-character() #charArr length가 0인 벡터
is.vector(charArr)
length(charArr)
charArr<- character(5) #length가 5인 벡터      #방5를 만들었다 
charArr[1] <- '안녕'; charArr[2]='R'; charArr[3]="수업중"
charArr[6] <-'테스트'                       ########
charArr

#6.2 numeric()
intArr <- numeric()
class(intArr)
is.vector(intArr)
intArr[1]<-1
intArr[3]<-3
intArr

#6.3 logical()
logicArr <- logical(2)  #length가 2면 logical벡터
logicArr[1] <- TRUE
logicArr[2] <-FALSE
logicArr[3] <-TRUE
logicArr

# 6.4 seq()
?seq  #Sequence Generation
a <- seq(from=1,to=10)
a <- seq(from=1,to=10,by=2)  #1부터10까지 2씩 증가 
a <- 1:10
is.vector(a)  #a는 vector인가
a
seq(10,-10,-2)    #10부터-10까지 (-2)씩 증가    ##복습
seq(0,10,0.1)
seq(1,9,by=pi)    ####1부터9까지(사이) +3.14##############
?by #The by( ) function applys a function to each level of a factor or factors (이 만큼의 양 증가)

#6.5 rep():반복객체를 만드는 함수
rep(1:4,each=2) # 1 1 2 2 3 3 4 4 
rep(1:4,c(1,2,3,4)) # 1 22 333 4444
rep(1:4,each=2,len=6)
rep(1:4,times=2) # 1 2 3 4 1 2 3 4

#6.6벡터의 연산(+,-,*,/,결합,교집합,합집합,차집합,비교연산)
a <-  c(1,2,3)
b <- c(10,20,30) 
a+b   #1번째꺼끼리 2번째꺼끼리 3번째꺼끼리
a-b
a^b
a*b
a%%b  #나머지 연산자 ###
c(a,b) #벡터의 결합 
a <-c(1,2,3)
b <-c('Hell','R')                               #c():Combine Values into a Vector or List
c <-c(TRUE,FALSE)  
(z<-c(a,b,c)) #다른 타입의 벡터 '결합'시 타입이 바뀜                   ###########a,b,c결합 

a <- append(a,c(4,5,6))
a <- append(a,7)



#벡터의 집합 연산" 합집합, 교집합, 차집합, 비교연산 
a <-c(1,2,3,4,5,6)
b <-c(2,4,6,8,10,12)
union(a,b) #합집합   1  2  3  4  5  6  8 10 12
intersect(a,b) #교집합 2 4 6
setdiff(a,b) #차집합 1 3 5
setequal(a,b) #비교
setequal(a,c(intersect(a,b),setdiff(a,b)))            ########결합 예.a는1,2,3가지고 있고, b는2,3,4가지고 있다. 결합하면1,2,3,4#####뒷쪽부분결합해서 a 와 같음 따라서 TRUE#############


#7.List타입
student <-list(name='홍길동',age=25)
student
studentVector <- unlist(student) #list풀면vector가됨   형일치시키고 다string
studentVector

s <- c('홍길동',25)
names(s)<- c('name','age')

student <- as.list(s)   #list할때 as.list(): list형으로 형변환    as == Force an Object to Belong to a Class
?as
student['name']                                
student[1] #$name [1] 홍길동
student[[1]] #[1]홍길동
student$age <- NULL #student의age제거 
student                                      
NROW(student) #항목의 갯수
length(student) #항목의 갯수

#8. 행렬 
colMatrix <- matrix(1:15,nrow=5,ncol=3)
colMatrix
?matrix
colMatrix <- matrix(1:15,nrow=5,byrow=FALSE)
colMatrix 
rowMatrix <- matrix(1:15,nrow=5,ncol=3,byrow=T,dimnames=list(c("R1","R2","R3","R4","R5"),
                                                             c('C1','C2','C3')))
rowMatrix
dim(rowMatrix) #행과 열의 수 #dim==Dimensions of an Object
nrow(rowMatrix) #행 수
ncol(rowMatrix) #열 수 

NROW(rowMatrix) #열 수 
NCOL(rowMatrix)

dimnames(rowMatrix)
rownames(rowMatrix) #행이름
colnames(rowMatrix) #열이름 

#행이름과 열이름 수정 
dimnames(rowMatrix) <- list(c('1월','2월','3월','4월','5월'),
                            c('kim','lee','choi'))
dimnames(rowMatrix)
rowMatrix

###################행렬의 곱을 이용하여 선형회귀식 도출 
x <- c(2,4)   #공부량    2시간공부,4시간공부
y <- c(40,60) #점수
X <- matrix (c(x,rep(1,NROW(x))), nrow=2,ncol=2,byrow= FALSE)   #1  두번     byrow=FALSE indicates that the matrix should be filled by columns (the default).   vector인경우 대문자. 리스트 경우 대소문자 구분  ########??
X     #x행렬 잡힘
Y = matrix(y,ncol=1)
Y
# X %*% ab = Y
#solve(X) %*% X %*% ab = solve(x) %*% Y


ab <- solve(X) %*% Y  #solve(): Solve a System of Equations. 
                        #This generic function solves the equation a %*% x = b for x, where 
                        #b can be either a vector or a matrix.

ab
ab[1]  #x의 기울기
ab[2]  #절편
plot(x,y)
lines(x,x*ab[1]+ab[2])    # (x, 10x+20)가지고 line을 그렸다 

#y=10x+20   x가1일때 30


#절편(截片)은 좌표 평면상의 직선이 x축과 만나는 점의 x좌표(x절편) 및 y축과 만나는 점의 y좌표(y절편)를 통틀어 이르는 말이다.

#         2        40                           2x+b=40
#         4        60                           4x+b=60

x<-c(32,64,96,118,126,144,152.5,158)  #독립변수
y<-c(18,24,61.5,49,52,105,130.3,125)

X <- matrix(c(x,rep(1,NROW(x))),ncol=2)
X
Y<- matrix(y,ncol=1)
Y

# X %*% ab = Y               #x를 '정방행열'로 만들어야 ****************************
                        #%*% is matrix multiplication. For matrix multiplication, you need an m x n matrix times an n x p matrix.
# 전치행렬 곱해서 정방행렬
t(X)
t(X) %*% X   #2x8 %*% 8x2 =>2x2 정방행렬 

# x %*% ab = Y
# t(X) %*% X %*% ab = t(X) %*% Y               **********************************복습!!!!!!
# solve(t(X) %*% X) %*% t(X) %*% X %*% ab = solve(t(X) %*% X) %*% t(X) %*% Y
# ab = solve(t(X) %*% X)  %*% t(X)  %*% Y
ab= solve(t(X) %*% X)  %*% t(X)  %*% Y
ab
plot(x,y)
lines(x,x*ab[1]+ab[2])


#다변량에서의 회귀분석 도출
x1 <- c(60,65,55) #몸무게
x2 <- c(5.5,5.0,6.0) #키
x3 <-c(1,0,1) #흡연유무
y <- c(66,74,78)
X <- matrix(c(x1,x2,x3))
X <- matrix(c(x1,x2,x3),ncol=3)
X

Y<-matrix(y,ncol=1)
Y
#X %*% ab = Y
# solve(X) %*% X %*% ab = solve(X) %*% Y
ab = solve(X) %*% Y
ab

# 80kg,6.5ft,금연 수명?
80*ab[1] + 6.5*ab[2] + 0*ab[3]

#행렬 연산(+,*,-,/,%%,...,%*%)
a <- matrix(1:4, nrow=2,ncol=2)
a 
b<- matrix(seq(10,40,10),nrow=2,ncol=2)
b
a+b
a*b
a^b
a%%b
   ##행렬연산 중 행렬 곱(%*%)
payMatrix <- matrix(c(12000,26000,18000),ncol=3)
payMatrix
dimnames(payMatrix) <- list(c('시간당수당'),c('철수','영희','말자'))
payMatrix #1행3열

workerMatrix <- matrix(c(c(5,4,9),c(7,3,2)),ncol=2) #몇 시간 일을 했는지
workerMatrix #3행 2열 
dimnames(workerMatrix)<-list(c('철수','영희','말자'),c('1월','2월')) #'행이름' 먼저 , 그 다음 '열이름'

workerMatrix

cost <- payMatrix %*% workerMatrix #1x3%* 3x2 =>1x2       1행  3행 중간 3없어짐 결과 1행2열  [1월,2월 인건비]
cost

rownames(cost) <-c('인건비')
cost

# 9.배열
dataArray <- array(1:24,dim=c(3,4,2)) #3행4열2면  3차원배열 
dataArray
dim(dataArray)  #차원의 크기 조회 
nrow(dataArray) #행수 조회 
NROW(dataArray)
ncol(dataArray) #열 수 조회
NCOL(dataArray)
length(dataArray) #요소의 갯수
dimnames(dataArray) <- list(c('1행','2행','3행'),c('1열','2열','3열','4열'),c('x면','y면'))
dataArray
dim(dataArray) <-c(3,8)   # 3x4x2=3x8
dataArray
dim(dataArray)<-c(8,3)    # reshape
dataArray
attr(dataArray,'dim') <- c(3,8) #reshape
dataArray

#10.테이터 프레임 ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
#(1) 데이트 프레임 생성
student_id <- c('20211','20212','20213','20214')
student_name <-c('Jin','Eric','Den','Kei')
student_eng <- c(60,85,90,95)
student_kor <- c(100,95,95,80)
student_gender <-c('남','여','남','여')
student_data<-data.frame(student_id,student_name,student_eng,student_kor,student_gender)
student_data
#(2) 데이터프레임에 열 추가 및 삭제 
student_data$mat <-c(100,100,99,98) #math열 추가됨
student_data

class(student_data$student_gender)
student_data$student_id <-NULL #열삭제

#(3) 열의 형변환
student_data$student_gender<-as.factor(student_data$student_gender)
class(student_data$student_gender)
str(student_data)
 #구조 보기 
summary(student_data)

#(4) 열이름 변경
student_data
install.packages("reshape")
library(reshape)
require("reshape")
student <- rename(student_data,c("student_name"="name"))   #student_data
student
student <- rename(student,c("student_eng"="eng","student_kor"="kor","student_gender"="gender"))
student

names(student_data) <- c("name","eng","kor","gender","mat")
student_data

#(5)데이터 프레임 합치기 
 #행으로 합치기 rbind
newStudent<-rbind(student_data,student)
newStudent
 #열로 합치기  cbind
student
id = data.frame(student_id)
id
student <- cbind(id,student) #열로합해야함  
student
names(student)<-c("id","name","eng","kor","gender","mat")
student

#부분 데이터 조회
student <- rbind(student,student) #2회 실행 -> 16행
nrow(student)
student[1,1]     #행번호 열 번호  (1행1열)
student[1,'id']  #1행에 'id'열
student[1,]      #1행 전체 
student[,1]      #1열 전체 
student[c(1:3),] #1행부터 3행 데이터 
student[,c(2,3,4,6)] #2,3,4,5열 데이터 
student[c(-2,-4,-6),] #2,4,6행외의 모든 데이터 
student[,c(-1,-5)] #1열과 5열의 모든 데이터
student[c(1:3),c(-1,-5)] #1행부터 3행까지 1열과5열제외한 데이터 

#국어점수가 90점 이상인 데이터
subset(student,subset=(student$kor==100))
subset(student,student$mat>99)
subset(student,select=c(1,4)) #select문은 '열'   1열과 4열 데이터
subset(student,select=c(-1,-4)) #1열과 4열외 데이터
subset(student,select = c('name','kor','mat'))  #'name','kor','mat'열 만 

#수학점수가 99점 이상인 여학생만 출력 
subset(student,subset=(student$mat>=99 & student_gender=='여' ))

#처음 5행만
student[c(1:5),]
head(student)
#처음 3행만
head(student,3) #첫3행만

edit(student)

emp <- read.csv(file.choose()) #탐색기에서 선택한 csv파일을 emp변수할당 
emp
head(emp) #head():Returns the first or last parts of a vector, matrix, table, data frame or function. Since head() and tail() are generic functions, they may also have been extended to other classes.
            #head(x, n = 6L, ...) 
class(emp)

#1. 직원이름만 출력
emp$ename
emp[,2]
emp[,2,drop=FALSE]

#2. 직원이름,job,sal
emp[,c(2,3,6)]
emp[,c('ename','job','sal')]
subset(emp,select=c(2,3,6))

#3. 이름이 KING인 직원의 empno, job, hiredate,sal 

subset(emp,subset=(emp$ename=='KING'), select=c('empno','job','hiredate','sal'))

#4. sal이 2000이상 직원의 empno, ename, sal 
subset(emp,subset=(emp$sal>=2000),select=c('empno','ename','sal'))



#5. sal이 2000부터 3000사이인 직원의 ename, sal
subset(emp,subset=(emp$sal>=2000& emp$sal<=3000),select=c('ename','sal'))





#11. 타입 판별 및 타입 변환
head(emp,6)
tail(emp) #끝부터 6줄
class(emp) #emp의 타입
str(emp) #str(): Compactly Display the Structure of the R Object
emp$deptno <- as.factor(emp$deptno) #as로 강제로 factor로형변환
str(emp)

class(iris)
edit(iris)
str(iris)
  iris$Species <- as.character(iris$Species) #factor를 character로 형변환
str(iris)
iris$Species <-as.factor(iris$Species) # character를 factor로 형변환 (factor로 해야 다른 값이 안들어가 기존에 있는 동일한 값만 가능)

levels(iris$Species)  #levels(x)  x:	 an object, for example a factor. #access to the levels attribute of a variable.  속성값,value종류 


#타입판별
class(iris$Species)
is.factor(iris$Species) #iris$Species는 factor 맞는지
str(iris$Species)


#12. 문자열과 날짜
name <- "Eric"
length(name) #요소갯수
nchar(name)  #문자의 갯수

names <- c("Eric","Larray","Curly")
nchar(names)  #4 6 5
length(names) #3

#하위 문자열 추출하기: substr
?substr #Extract or replace substrings in a character vector

substr('ABCDEF',1,4) #1-4번째 문자 추출
substr('ABCDEF',4,10) #4-10번째 문자 추출. 없는 번째 문자는""로 처리
substr(names,1,2) #names안에 각각의 문자 1~2번째 추출 

#names안에 각각의 이름의 맨 마지막자리 앞 글자, 먄머자먹 굴저
#결과 : "ic" "ay" "ly"
substr(names,nchar(names)-1,nchar(names)) #'마지막 글자전 한글자' 부터 '맨 마지막 글자'까지

#문자열 연결하기 : paste, paste0
paste(names,'loves','starts') #각각 뒤에 추가됨 
paste(names,'loves','starts', sep='_')                  #*********
paste(names,'loves','starts', sep='_', collapse=',and')  #*********


paste0(names,'loves','starts') #딱 달라 붙게


#문
name <-c ("Yun","Lim","Lee");
hobby <-c ("swim","sleep","eat")
#결과 Yun의 취미는 swim이고, Lim의 취미는 sleep이고, Lee의 취미는 eat
cat(paste(name, hobby, sep='의 취미는',collapse='이고, '))


#문자열 분할 (구분자 분할하기)
path <- 'home/hadoop/data/speech.csv'
strsplit(path,'/')  #/로 분할해라
customerInfo <- 'kim@gmail.com,010-9999-8888,seoul Korea'
strsplit(customerInfo,',010-9999-8888,')
customers <- c('kim@gmail.com,010-9999-8888,seoul Korea', 
               'yun@naver.com,02-716-1006,busan Korea',
               'yun@naver.com,011-716-1006,busan Korea')
strsplit(customers,'[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}') #******************복습

#문자열 대체 : sub(oldStr,newStr,string)
           # : gsub(oldStr,newStr,string)
s <- 'Curly is a smart person. Curly is funny too.'
sub('Curly','Eric',s)     #?sub **********************
gsub('Curly','Eric',s)    #?gsub *********************
                             #gsub: Pattern Matching and Replacement

gsub('','',s) #********************

#외적:outer; 문자열의 모든 쌍별 조합을 만든다
a <- c('aa','bb','cc')
b <- c('11','22','33')
outer(a,b,FUN="paste")
outer(a,b,FUN="paste",sep='~')   #FUN means function

#날짜
today = Sys.Date()
class(today)
# %Y: 년도4자리 %y: 년도2자리 
thatday = as.Date("21-04-30",'%y-%m-%d') # 50보다 작으면 앞에 20이 붙고(2021), 50보다 크면 앞에 19가 붙고( 1978)
thatday
today < thatday
if(today<thatday){
  cat('today보다thatday가 후')
}

# R 데이터 종류 및 구조의 이해 실습
#1. iris 데이터를 사용하여 data.frame의 특성을 살펴봅니다.
    #1) 행과 열에 대한 다양한 참조 방식을 사용하여 데이터를 조회합니다.
    # iris 데이터의 차원 확인, 컬럼이름 확인, 구조확인, 속성들



rm(list=ls()) # 내꺼 삭제됨   #########











