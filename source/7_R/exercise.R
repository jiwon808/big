

# R 데이터 종류 및 구조의 이해 실습
#1. iris 데이터를 사용하여 data.frame의 특성을 살펴봅니다.
  #1) 행과 열에 대한 다양한 참조 방식을 사용하여 데이터를 조회합니다.
  
  # iris 데이터의 차원 확인
  iris1 <- dim(iris)
  rm(list=ls()) # 내꺼 삭제됨 


  #컬럼이름 확인
  colnames(iris)
  names(iris)
  
  
  #구조확인
  str(iris)       #str == structure
  
  #속성들
  colnames(iris)
  
  
#행과 열정보 조회

#rm(list=ls()) # 내꺼 삭제됨 




  #2) 행과 열 정보를 조회합니다.
  # iris의 요약통계 정보
  summary(iris)



  # 꽃받침의 길이 처음 10개 조회


#line489
#Petal.Length
head(iris,10)
subset(head(iris,10), select=c(3))
iris[c(1:10),'Sepal.Length']
iris[c(1:10),'Sepal.Length',drop=FALSE]


  #3) 부분 데이터셋을 추출해 봅니다.
  # virginica종만 추출 => virginica
  # setosa종 만 추출 => setosa
levels(iris$Species)
virginica <- subset(iris, subset=(iris$Species=='virginica'))
virginica <-iris[iris$Species=='virginica']

setosa <- subset(iris, subset=(iris$Species=='setosa'))
setosa <-iris[iris$Species=='setosa']

#line484 


  #4) 추출한 부분 데이터셋을 다시 결합해 봅니다

rbind(virginica,setosa)


#2. setOsa종의 꽃 받침(Sepal)의 폭과 길이 부분 데이터 셋을 추출하세요.
subset(iris,subset=(iris.Species=='setosa'),select c=  )       #######수정!!!!!!!!!!!!!!
s[,c(1:2)]    #line447
Sepal.Length
Sepal.Width



#3. 작업내용에 따른 급여가 차등 지급됩니다.(행렬 문제)
#A작업은 시급 12000원, B작업은 시급 26000원, C작업은 시급 18000원 입니다.
#두 사람이 각 작업을 수행하는 데 있어서 실제 작업한 시간이 작업 내역에 따라 다릅니다. 

#'갑'은 A작업을 5시간, B작업을 4시간, C작업을 9시간
#그리고 '을'은 A작업을 7시간, B작업을 3시간, C작업을 2시간 작업 했습니다.
#갑과 을의 급여를 계산하세요.

  #힌트 : 행렬 두 개, 작업당 급여를 저장하는 행렬, 근무자들이 근무한시간
  #행렬의 곱은 %*% 를이용한다.

#계산한 갑과 을의 급여는 각각 326000원, 198000원 입니다.



                                                                      #######복습!!!!!!!!!!!!!!
#line359
payMatrix <- matrix(c(12000,26000,18000),ncol=3)           # [,1]  [,2]  [,3]
                                                      #[1,] 12000 26000 18000
payMatrix #1행3열
dimnames(payMatrix) <-list(c('시간당수당'),c('A작업','B작업','C작업'))
payMatrix

workerMatrix<-matrix(c(c(5,4,9),c(7,3,2)),ncol=2)
workerMatrix 
dimnames(workerMatrix)<-list(c('A','B','C'),c('갑','을')) #'행이름' 먼저 , 그 다음 '열이름'

workerMatrix

cost <- payMatrix %*% workerMatrix
cost

cost <- payMatrix %*% workerMatrix
cost






