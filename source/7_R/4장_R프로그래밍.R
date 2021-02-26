###########################################
#######4장. R 프로그래밍; 제어문,function 
###########################################

#1.제어문
#1.1조건문 
#(1) if문
num <- 9 
if(num%%2 ==0){
  print(paste(num,"은 짝수"))
}else{
  cat(num,"은 홀수")
}

#(2) ifelse()함수
#"num%2==0" "짝":"홀"
ifelse(num%%2==0,"짝","홀")    #여기는 %% 밖에 없다.
nums <- c(10,9,16,17,20)
result <- ifelse(nums%%2==0,"짝","홀")

m <-matrix(c(nums,result),ncol=5,byrow=TRUE, # byrow=TRUE 행중심 
  dimnames = list(c('수','홀짝'),c('1회','2회','3회','4회','5회')))
m

#(3) switch()함수 
switch(2,"red","green","blue")             #'green'
x <- switch(4,"red","green","blue")        #받은게 없으면 null
x


#사용자로부터 color값을 받아 해당 color를 출력
#readline:  readline reads a line from the terminal (in interactive use).
?readline

colorValue <- as.integer(readline(prompt="컬러값은?(red:1,green:2,blue:3)"))
colorValue
class(colorValue)
color<- switch(colorValue,"red","green","blue")
color

color <- readline(prompt="컬러는(red,green,blue)")
colorValue <- switch(color,"red"=1,"green"=2,"blue"=3)
cat('선택한 색상',color,'의 색상 값은', colorValue)

#문. 점수(50~100)를 입력받아 학점을 계산하는 프로그램 구현해 보세요       ######복습!!
  #100 -> perfect, 90점대: A, 80점대:B,  70점대:C, 60점대:D
score <- as.integer(readline(prompt="50~100사이의 점수를 입력해주세요"))
level <- switch((as.integer(score/10)-4),'F','D','C','B','A','PERFECT')
level


getlevel <- function(){                                                    ######복습!!
  score <- as.integer(readline(prompt="50~100사이의 점수를 입력해주세요"))
  level <- switch((as.integer(score/10)-4),'F','D','C','B','A','PERFECT')
  cat('입력한 점수는',score, ',학점은' ,level)
}
getlevel()

# 1.2 반복문: for, while, repeat
#(1) for문
1:10
seq(1,10)
seq(10)
x <- c(2,5,4,8)
for(val in x){
  cat(val,'\t')
}
count <- 0
for(val in x){
  if (val%%2==0){
    count = count +1;
  }
}
count

#10회 반복
for(val in 1:10){
  cat(val, "안녕하세요")
}


#문. factorial계산 함수를 작성하시오 
#fact(3) # 결과 3!=6      3*2*1 
#fact(-3) 결과: 음수값을 위한 팩토리얼은 존재하지 않아요 
#fact(0)  결과: 0!=1
?factorial #Special mathematical functions related to the beta and gamma functions.


fact<-function(num){                                                          ######복습!!
  result=1
  if(num<0){
    cat("음수값을 위한 팩토리얼은 존재하지 않습니다")
  }else if(num==0){
    cat("The factorial of 0 is 1")
    #return(1)
  }else{
    for(i in num:1){    #만약i가 4면 4,3,2,1 (1까지)                         ######복습!!
      result = result * i
    }
    cat(num,"!=",result)
    #return(result)
  }
}

fact(4)
fact(0)
fact(1)
rm(list=ls())

getwd() #현재 working디렉토리                                                ######복습!!
setwd('D://big/src/7_R')
getwd()

fact(4)
source('fact.R', encoding='utf-8')  #한글이 있을 경우   #그러면fact(4)가 메모리에 올라옴 
fact(3)


#(2) while
i<- 1
while(i<6){
  print(i)
  i = i+1
}                                                     ######복습!!

#(3) repeat:반복
i<- 1
repeat{
  if(i>6) break
  print(i)
  i <- i +1
}

#(3) break, next(자바에서의continue)            
x <- 1
while(x<10){
  #if(x==3) next;  #next는 조건 있는 곳으로 간다
  x <- x+1      #x가3일 아닐경우
  #if(x==3) break;
  if(x==3) next;
  cat(x,'\t')
}


#2.연산자
#논리연산자 &,&&,|,||
TRUE && TRUE 
TRUE & TRUE 
x <- c (T,T,F,F)
y <- c(T,F,T,F) 
x&y                 #모든 요소를 다 체크    #1번째 1번째 끼리, 2번째 2번째 끼리 
x&&y                #'첫번째 요소'만 체크
x|y        #모든 요소를 다 체크
x||y       #'첫번째 요소'만 체크

#1.2중위연산자 
5+8
'+'(5,8)
'%add%' <- function(x,y){
  return(x+y)
}

'%add%'(5,8)

5%add%8

c <- c(10,23,30)
10 %in% c                   #10이 c배열안에 있니?

strings <- c("Hello","World","R")
strings %in% 'R'

# %o%: 외적   outer
# %*%: 내적 (행렬의 곱)
a <- c(2,3,4)
b <- c(10,20,30)   # 2x10 2x20 2x30 첫번째    3x10 3x20  3x30  두번째  4x10 4x20 4x30 세번째  
a %o% b
a <-c ('1','2','3')
b <-c ('a','b','c')
outer(a,b,FUN=paste)

(matrix.a <-matrix(1:6,nrow=3,ncol=2))  #3행2열
(matrix.b <-matrix(1:6,nrow=3,ncol=2))
matrix.a %*% matrix.b #앞에 있는 것의 '열수'가 뒤의 '행수'와 같아야함   ##질문
solve(matrix.a)

#3.함수
pow <- function(x,y){
  return(x+y);
}
pow
pow(2,3)

#가변 인자 함수 total() total(1) total(2,3,4)
total <- function(...){
  args <- list(...)
  sum <- 0
  for(val in args){
    sum <- sum+val
    cat(val,'의 합은',sum,'\n')  #2까지누적,3까지누적,4까지지누적 
    }
  return(sum)
  }
total() 
total(1)
total(10,2,3,5)


#재귀호출; 함수 내에서 자기 함수를 호출하는 함수                           #########복습!!!!
rm(list=ls())
fact <- function(num){
  if(num<0){
    return()
  }else if(num==1){
    return(1)
  }else{
    return(num * fact(num-1))
  }
  
}
fact(3)

# 만약에 num=3 fact2에서 또 호출  2x1   그러면 총3x2x1


# fact(3) = 3* fact(2)
  # = 3*2*fact(1)
  # = 3*2*1
# fact(num) = num * fact(num-1) (단,num이 1보다 클 때, fact(1)=1)



#4. R환경
environment() #<environment: R_GlobalEnv>
ls()    #List Objects
f <- function(f_x){    #function함수 안에 'f_x'라는 변수 
  g <- function(g_x){
    print('g함수 안')
    print(environment())
    print(paste('g함수 영역에서의 변수들',ls()))
  }
  g(5)
  print('f함수 안')
  print(environment())
  cat(paste('f함수 영역에서의 변수들',ls()))
}

f(10)


#소수(Prime Number)체크     
            #A positive integer greater than 1 which has no other factors except 1 and the number   
            #itself is called a prime number.
#If문과 for문을 이용하여 매개변수가 소수(prime Number)인지 
#아닌지 TRUE나 FALSE를 return 하는 함수를 작성하고 호출하시오



# 문. 매개변수가 소수인지 아닌지 return                                              ####복습!!!!
num = as.integer(readline(prompt="수를 입력하십시오"))
is.prime <- function(num){
  flag = FALSE
  if(num==2){                 #2를 따로 뺴놔야
    return(TRUE)
  }else if(num>1){
    flag = TRUE
    for (i in 2:(num-1)) {  ##2부터16까지  17이2로나눠서 떨어지면 소수가 아님. 안떨어지면 소수 #17/2,3,4,4,5,6,7,8..
      if((num%%i)==0){
        # cat(i,'는',num,'의 약수라서 소수 아니야','\n')
        flag = FALSE
        break
      }
    }
  }
  return (flag)
}
is.prime(12)



#13,17이 소수  1과 13   1과 17만 있고 다른 인자 없는자














