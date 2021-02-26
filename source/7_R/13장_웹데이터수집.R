##################################################
###13장. 웹 데이터 수집집 ###
##################################################


# 1. 정적 웹 크롤링: 단일 페이지 크롤링 (rvest 패키지 사용)
install.packages("rvest")
library(rvest)

url <- "https://movie.naver.com/movie/point/af/list.nhn"
text <- read_html(url,encoding='CP949')
text

#영화제목; .movie
nodes <- html_nodes(text,'.movie')    ########.movie는 사이트 F12 보면 나옴
nodes
title <- html_text(nodes)
title

#해당 영화 페이지
movieInfo <- html_attr(nodes,'href')  ##########nodes 중 href #################
movieInfo <- paste0(url,movieInfo)   ####  paste0          url링크 붙일 시 중간 space 없애줌 
movieInfo

  
#평점: .list_netizen_score em
nodes <- html_nodes(text,".list_netizen_score em")              #text중의 movie, list_netizen_score,  title을 가지고 온다 
nodes
point <- html_text(nodes)              #nodes는  'html_nodes(text,".list_netizen_score em")  ' 이 기때문에 해당 페이지의 평점을 가져옴 
point

#영화 리뷰; .title
nodes <- html_nodes(text, '.title')
nodes
review <- html_text(nodes, trim=TRUE)
review <- gsub('\t','',review)
                            #3장 strsplit
review <- gsub('\n','',review)
review

review<-unlist(strsplit(review,'중[0-9]{1,2}'))[seq(2,20,2)]    #2부터20까지 2 4 6 8 10 12 14 16 18 20    #####이부분 3장 strsplit부분 참조 
review<- gsub('신고','',review)   #신고를 space로 대체 
review

page <- cbind(title, movieInfo)
page <- cbind(page, point)
page <- cbind(page,review)  #cbind는 2개 인자 밖에 못넣음. 옆에 다 column 추가 
View(page)


# csv파일로 out
write.csv(page,"outData/movie_review.csv")   #행번호 들어감 
write.csv(page,"outData/movie_review.csv", row.names = F)

#여러 페이지 정적 웹 크롤링 

home <-"https://movie.naver.com/movie/point/af/list.nhn"
site <- "https://movie.naver.com/movie/point/af/list.nhn?&page="
movie.review <- NULL

for(i in 1:100){
  url <- paste0(site,i);
  #cat(url,"\n")   #"\n"해야 가독성이 높다   #잘뿌려졌는지 확인용 
  text <- read_html(url,encoding='CP949')

  #영화제목; .movie
  nodes <- html_nodes(text,'.movie')    ########.movie는 사이트 F12 보면 나옴
  title <- html_text(nodes)
  
  #해당 영화 페이지
  movieInfo <- html_attr(nodes,'href')  ##########nodes 중 href #################
  movieInfo <- paste0(url,movieInfo)   ####  paste0          url링크 붙일 시 중간 space 없애줌 
  
  
  #평점: .list_netizen_score em
  nodes <- html_nodes(text,".list_netizen_score em")              #text중의 movie, list_netizen_score,  title을 가지고 온다 
  point <- html_text(nodes)              #nodes는  'html_nodes(text,".list_netizen_score em")  ' 이 기때문에 해당 페이지의 평점을 가져옴 

  
  #영화 리뷰; .title
  nodes <- html_nodes(text, '.title')
  review <- html_text(nodes, trim=TRUE)
  review <- gsub('\t','',review)
  #3장 strsplit
  review <- gsub('\n','',review)
  review<-unlist(strsplit(review,'중[0-9]{1,2}'))[seq(2,20,2)]    #2부터20까지 2 4 6 8 10 12 14 16 18 20    #####이부분 3장 strsplit부분 참조 
  review<- gsub('신고','',review)   #신고를 space로 대체 
  page <- cbind(title, movieInfo)
  page <- cbind(page, point)
  page <- cbind(page,review)  #cbind는 2개 인자 밖에 못넣음. 옆에 다 column 추가 
  movie.review <- rbind(movie.review,page)
}


View(movie.review)
write.csv(movie.review,'outData/movie_review100page.csv')      #csv파일 만들어짐 

# 1~100까지 크롤링한 영화들 중 평점에 높은 10개를 시각화 하시오. 
# 영화 리뷰 내용만 뽑아 최빈 단어 10개. 워드클라우드 시각화 

library(dplyr)
library(ggplot2)
library(KoNLP)
library(wordcloud)

movie <- as.data.frame(movie.review,stringsAsFactors = F)
str(movie)
movie$point <- as.numeric(movie$point)

result <- movie %>%
  group_by(title)%>%
  summarise(point.mean=mean(point),
            point.sum= sum(point),
            n=n())%>%
  arrange(desc(point.mean), desc(point.sum))%>%
  head(10)

ggplot(result,aes(x=point.sum,
                  y=reorder(title,point.sum)), vjust=1)+
  geom_col(aes(fill=title))+
  labs(title="평점이 높은 top10", x="평점 총점")+
  geom_text(aes(label=paste('총점:', point.sum,'평균:', point.mean)), hjust=0)+
  coord_cartesian(xlim=c(0,120))+
  theme(axis.title.y = element_blank(),
        legend.position = "none")
#영화 리뷰 내용만 뽑아 최빈 단어 10개. 워크클라우드 시각화 

useNIADic()
movie$reivew <- gsub('\\W', ' ', movie$review)
movie$reivew <- gsub('[ㄱ-ㅎ]',' ', movie$review)
View(movie)
nouns <- extractNoun(movie$review)

wordcount <- table(unlist(nouns))
df_word <- as.data.frame(wordcount,stringsAsFactors = F)
df_word <- rename(df_word, word=Var1, freq=Freq)
View(df_word)
df_word <- filter(df_word,nchar(word)>1)

#최빈 단어 top20뽑고 그래프 그리기
top20 <- df_word[order(df_word$freq,decreasing =T),][1:20,]
top20
ggplot(top20, aes(x=freq,y=reorder(word,freq)))+
  geom_col()+
  geom_text(aes(label=freq),hjust=1,size=3, col='yellow')


#워드클라우드 그리기
set.seed(1234)
display.brewer.all() #palette이름과 색상들을 한꺼번에 봄
pal <- brewer.pal(8,'Dark2')
wordcloud(words=df_word$word,
          freq=df_word$freq,
          min.freq=5,
          max.words = 200,
          random.order = F,
          rot.per=0.1,
          scale=c(4,0.3),
          colors=pal)


#2.동적 웹 크롤링 (셀레니움 패키지 이용): 스크롤다운, 로그인이후, 버튼, ...
#특정 폴더 생성 후 3개의 파일을 다운받아 압축을 풀고 selenium 서버 가동 (note폴더 참조)

#필요한 패키지 다운로드와 로드 
install.packages("RSelenium")
library(httr)
library(rvest)
library(RSelenium)

#### Selenium 동적 웹 크롤링 준비 끝
remDr <- remoteDriver(port=4445L, #포트번호
                      browserName='chrome')  #사용할 브라우저 
remDr$open()    #server를 통해 연동
remDr$navigate('https://www.youtube.com')    #앞에 연 서버창이 '사이트주소'로 바꿈



welElem <- remDr$findElement(using='css',
                             '#search')
welElem$sendKeysToElement(list('과학 다큐 비욘드',key='enter'))   #유튜브에 '과학 다큐 비욘드'로 입력한 내용들이 나옴 

#현재 페이지의 html소스 가져오기 
html<- remDr$getPageSource()[[1]]        #[[1]]   유튜브페이지 소스의 맨 첫번째아이. ㄸ
html<-read_html(html)


#'#video-title' css안의 text가져오기
youtube_title <- html%>%
  html_nodes('#video-title')%>%
  html_text()

youtube_title[1:5] 

youtube_title <- gsub('\n','',youtube_title)
youtube_title[1:5]
youtube_title <- trimws(youtube_title)      
youtube_title

youtube_title_url <- html%>%
  html_nodes('#video-title')%>%
  html_attr('href')


youtube_title_url[1:10]

youtube_title_url<-
  ifelse(is.na(youtube_title_url),'',
         paste0('https://www.youtube.com/', youtube_title_url))

# youtube_title만 text파일로 뺀다 
write.table(youtube_title,
            file='outData/과학다큐결과.txt',
            sep=',',
            row.names=FALSE,  #행번호 없는게 편하다
            quote=FALSE)

# 예제1. 몇번 마우스를 스크롤 다운한 후 크롤링 (댓글)
#"Selenium"폴더 --> cmd --> 명령어 치고 -->창 열어두기 

remD <- remoteDriver(port=4445L,
                     browserName='chrome')
remD$open() #서버를 브라우저가 연다

remD$navigate('https://youtu.be/tZooW6PritE')
btn <- remD$findElement(using='css selector',
                        value='.html5-main-video')
btn$clickElement()    #영상 플레이 멈춤

#마우스 스크롤 다운 
remD$executeScript("window.scrollTo(0,500)")
remD$executeScript("window.scrollTo(500,1000)")
remD$executeScript("window.scrollTo(1000,1500)")
remD$executeScript("window.scrollTo(1000,3000)")
remD$executeScript("window.scrollTo(1000,5000)") ###########에러



#현재 페이지의 html 소스 가져오기
html <- remD$getPageSource()[[1]]
html <- read_html(html)

comments <- html%>% 
  html_nodes('#content-text')%>%
  html_text()
comments[1:10]                     


write.table(comments,
            file='outData/댓글.txt',
            sep=',', 
            #row.names=F,     #이거 안쓰면 '번호'가 잡힘
            quote=FALSE)

result <- cbind(youtube_title,youtube_title_url)
write.csv(result, file='outData/과학다큐결과.csv',
          row.names=F) #행번호 없애줌 
