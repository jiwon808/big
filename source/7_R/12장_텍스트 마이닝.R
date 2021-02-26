##################################################
###12장. 덱스트 마이닝 ###
##################################################

#문자로 된 비정형 데이터로부터 가치있는 정보를 얻어내는 분석: 텍스트 마이닝 시 가장 먼저 할 일은 --> 형태소 분석 (단어를 분석한 단위)

# 패키지 설치
install.packages("rJava")   #그전에 java가 꼭 내 시스템에 있어야
install.packages("memoise")
install.packages("KoNLP") #available이라고 에러남         #명사추출, 사전 다 "KoNLP"에 있다 (만약에r 3.9버전 다은받으로 KoNLP바로 실행 가능)

#google에서 KoNLP를 검색하면 'CRAN - Package KoNLP' 결과가 나타남. 이것을 클릭 후 -->"archive"클릭 -->'KoNLP_0.80.2.tar' 다운로드. (그러면 강제로 "KoNLP"다운로드 가능) 

# 우측의 Packages -> install 도구를 이용해서 install하기 위해
install.packages("devtools")

# KoNLP가 의존하는 package 미리 install
install.packages("hash")
install.packages("tau")
install.packages("Sejong")  #한글사전


#packages -> install 도구를 이용하여 KoNLP 패키지를 install



#C:/Users/tjoeun/Documents/R/win-library/4.0/KoNLP/java에 'scala-library-2.11.8.jar' 복사
library(KoNLP)
Sys.getenv("JAVA_HOME")

useNIADic() #사전 설정하기 
extractNoun('대한민국의 영토는 한반도와 그 부속 도서로 한다')
extractNoun('의미있는 하루 하루, 알차고 환희찬 하루 감사해요')

# 1. 힙합 가사 텍스트 마이닝
#1.1 텍스트 마이닝 할 텍스트 로드 (필요한 data 확보)
txt <- readLines('inData/hiphop.txt') #비정형 데이터 
txt
head(txt)


#1.2 특수문자 제거
#gsub(oldStr,newStr,string)
#str_replace_all(string, oldStr,newStr)       #oldStr를 찾아서 newStr로 바꿔줌 

library(stringr)
temp<- gsub('\\W',' ',txt)     #gsub은 text replace         \\W  (꼭 대문자) (소문자면 숫자와 알파벳 뜻하고, 대문자W은 특수문자를 의미)               #########txt (앞에hiphop파일 읽어드림) 중 '특수문자'를 'space'로 바꿈################
txt <- str_replace_all(txt,'\\W',' ')
temp==txt
table(temp==txt) 


#1.3 명사 추출 
head(txt)           ##특수문자 대신 space로 바꿔짐 
nouns <- extractNoun(txt)       #여기서 txt 앞에 'inData/hiphop.txt'를 가져옴
class(nouns)  #list로 나옴
unlist(nouns)  #이제 '백터' 형태로 나옴
head(unlist(nouns))
table(unlist(nouns))   #word count됨
wordcount <- table(unlist(nouns)) # word count (단어별 빈도표)

class(wordcount)     #dataframe이 아니라 table (dataframe이 글자 클라우드 만들기 좋다)
head(wordcount)
sort(wordcount)

df_word <- as.data.frame(wordcount, stringsAsFactors = F)  #table를 data.frame으로 변환
                                                          # stringsAsFactors = F 문자를 factor타입으로 안바꾸게 하려고 
head(df_word,20)   ####앞20줄
str(df_word)

library(dplyr)
df_word <- rename(df_word, word=Var1, freq=Freq)  #이름변경   새로운 이름을 앞에다 
str(df_word)
head(df_word)
nrow(df_word)
df_word <- df_word %>%
  filter(nchar(word)>=2)  #nchar문자수 반환
df_word <- filter(df_word,nchar(word)>=2)           
head(df_word)

#자주 사용되는 단어 빈도표 top20 만들기 
top20<-df_word[order(-df_word$freq),][1:20,]    # 앞에 - 붙이면  큰거부터 작은 순으로 
top20$word

top20 <-df_word %>%
  arrange(desc(freq)) %>%
  head(20)                   #head(20)

top20$word


#자주 사용되는 단어 top20 그래프 그리기 
library(ggplot2)
ggplot(data=top20,aes(x=freq, y=reorder(word,freq))) +   #reorder하면 큰거부터 작은순으로
  geom_col()+
  geom_text(aes(label=freq),vjust=1.5, col='red')  #막대위에 갯수가 나옴   

        #8장 데이터시각화에 color팔레트가 있다

#워드클라우드 
# 1. 비정형 text 데이터 확보 
# 2. 패키지 설치 및 로드(KoNLP, wordcloud)
# 3. 확보된 text 데이터 읽어오기 
# 4. 명사 추출
# 5. 필요없는 데이터 삭제(특수문자, zz,ㅋㅋ,ㅎㅎ, ...)
# 6. 워드카운트 (word count) 생성
# 7. wordcloud함수 이용해서 워드클라우드 생성 

install.packages("wordcloud")
library(wordcloud)   #wordcloud만들때 RColorBrewer 많으쓰인다. 로드 같이 된다 

set.seed(1234)  #seed값을 세팅해놓으면 random값이 같아져   #난수 seed설정    #발생한 난수에따라서 위치 잡음
runif(6,min=1,max=45)
round(runif(6,min=1,max=45))

display.brewer.all()                    ####팔레트 #############
pal <- brewer.pal(9,'Blues')[5:9]      #색상 목록 생성 5번째부터9번째까지   #앞에9 무엇을 의미 Blues안에 총 9가지 컬러 

set.seed(1234) 
?wordcloud
wordcloud(words = df_word$word, #뿌려질 단어
          freq = df_word$freq,  #단어 빈도
          min.freq=2,           #최소 단어 빈도 
          max.freq=200,         #표현될 최대 단어 수 
          random.order = F,     #최빈 단어를 중앙 배치
          rot.per = 0.1,        #회전 단어 비율
          scale=c(3,0.3),       #단어 크기 범위     #scale너무 커버리면 200단어들을 다 담을 수가 없다 
          colors=pal            #단어 색상
          )

wordcloud


# 2. 국정원 트윗 텍스트 마이닝 
rm(list=ls())  #기존 데이터 싹 다 지우기
twitter <- read.csv('inData/twitter.csv',
                    header = TRUE,
                    stringsAsFactors = F,
                    fileEncoding = "UTF-8"
                    )

head(twitter)
View(twitter)
class(twitter)
library(dplyr)
twitter <- rename(twitter, no=번호, id=계정이름, date=작성일,tw=내용)
View(twitter)

#필요없는 문자, 단어 삭제하기 
twitter$tw <- str_replace_all(twitter$tw,'\\W',' ')         #특수문자를 'space'로 대체
twitter$tw <- str_replace_all(twitter$tw, '[ㄱ-ㅎ]',' ')    #댓글중 ㅋ,ㅎ 이런것이 있을 수가 있어서 'space'로 대체
View(twitter)
head(twitter)

nouns <- extractNoun(twitter$tw)  #한행 한행 읽어내 
nouns 

class(nouns)
nouns
wordcount <- table(unlist(nouns))
class(wordcount)
df_word <- as.data.frame(wordcount,stringsAsFactors=FALSE)    #string이 factor변수가 아닌 문자형 변수로 들어감
str(df_word)    #Var1:문자형    Freq:숫자형 

df_word <- rename(df_word, word=Var1, freq=Freq) #변수명 바뀜
head(df_word)   
str(df_word)


# 출현단어 중 2글자 이상만 분석 
df_word <- filter(df_word, nchar(word)>1)  #한글자 이상 만 filter해냄 
head(df_word)

#최빈 단어 top20 뽑고 그래프 그리기 
top20 <- df_word[order(df_word$freq, decreasing=T),][1:20,]
top20

library(ggplot2)

detach("package=ggplot2", unload=T)

top20<-df_word%>%
  arrange(desc(freq))%>%
  head(20)

  ggplot(top20,aes(x=freq,y=reorder(word,freq)))+
    geom_col()+
    geom_text(aes(label=freq),hjust=1, size=3, col='yellow')

  # coord_flip()  

#워드클라우드 그리기 
set.seed(1234)
pal <- brewer.pal(9,'Blues')[5:9]
wordcloud(words=df_word$word,
          freq=df_word$freq,
          min.freq = 5,
          max.words = 200,
          random.order = F,     #최빈단어 가운데 나오게
          rot.per = 0.1,        #rotation percentage
          scale=c(3,0.3),  
          colors=pal
          )

#
library(dplyr)
library(KoNLP)
library(wordcloud)
library(ggplot2)
library(stringr)


View(twitter)
rm(list=ls())
twitter <- read.csv('inData/twitter.csv', 
                    header=TRUE,
                    stringsAsFactors = F,
                    fileEncoding = 'UTF-8')

twitter <- rename(twitter,
                  no=번호, id=계정이름,date=작성일, tw=내용)
sort(table(twitter$id))

#글 게시 수가 150회이상 트윗한 게시물에 대해 최빈 top20개 단어를 출력, 시각화 하고 워드 클라우드를 완성 하시오 

idCount <- as.data.frame(table(twitter$id))
head(idCount)
idCount <- rename(idCount, id=Var1, count=Freq)
head(idCount)

#twitter <- left_join(twitter,idCount,by="id")
#view(twitter)

sampleId <- idCount[idCount$count<150, 'id']
sampleId
twitter1 <- subset(twitter,subset=id%in% sampleId)
View(twitter1) 

#필요없는 문자, 단어 삭제하기
twitter1$tw <- str_replace_all(twitter1$tw,'\\W',' ')
twitter1$tw <- str_replace_all(twitter1$tw, '[ㄱ-ㅎ]',' ')
View(twitter1)
Head(twitter1)

nouns <- extractNoun(twitter1$tw)



#워드카운드 생성
wordcount <- table(unlist(nouns))

df_word <- as.data.frame(wordcount, stringsAsFactors = FALSE)
str(df_word)

df_word <- rename(df_word, word=Var1, freq=Freq)
head(df_word)
str(df_word)

# 출현단어 중 2글자 이상만 분석
df_word <- filter(df_word, nchar(word)>1)
head(df_word)

# 최빈 단어 top20 뽑고 그래프 그리기
top20 <- df_word[order(df_word$freq, decreasing = T),][1:20,]
top20

top20 <- df_word %>% 
  arrange(desc(freq)) %>% 
  head(20) 

ggplot(top20, aes(x=freq, y=reorder(word, freq))) +
  geom_col() +
  geom_text(aes(label=freq), hjust=1, size=3, col='yellow')

# 워드클라우드 그리기

set.seed(1234)
pal <- brewer.pal(9, 'Blues')[5:9]
wordcloud(words = df_word$word,
          freq = df_word$freq,
          min.freq = 5,
          max.words = 200,
          random.order = F,
          rot.per = 0.1,
          scale = c(3,0.3),
          colors = pal)

