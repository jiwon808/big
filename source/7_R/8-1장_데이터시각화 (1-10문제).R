#######################문제1-10번 #########################
#ex1.png ####(이미지,src저장) (문제-r파일-결과)
#1. datasets::
#(1) 'cars데이터 셋'을 이용하여 
#(2)'속도'에 대한 '제동거리의 산점도와 적합도'(신뢰구간그래프)를 나타내시오 
#(3)(단, 속도가 5부터 20까지 제동거리 0부터 100까지만 그래프에 나타냄).

library(datasets)
ggplot(data=cars   , aes(x=speed, y=dist)) + geom_point()+ 
  geom_smooth(method='lm')      ##직선으로 바꿔 #######    ####3번 충족 



#ex2.png ####  (O)
#(1) gapminder::gapminder 데이터 셋을 이용하여 
#(2) 1인당국내총생산에 대한 기대수명의 산점도를  
#(3)대륙별 다른 색으로 나타내시오.


library(gapminder)

#줄216 ***********
ggplot(data=gapminder,aes(x=gdpPercap, y=lifeExp)) + 
  geom_point(aes(size=continent, color=continent)) + 
  labs(x="gdpPercap",
       y="lifeExp")



#ex3.png ####
#(1)gapminder::gapminder 데이터 셋을 이용하여 
#(2)기대 수명이 70을 초과하는 데이터에 대해 
#(3)대륙별 데이터 갯수              (다이아몬드 예제)

barplot(gapminder, main="기대수명이 70을 초과하는 데이터 빈도(대륙별)")


#줄516
gapminder %>%
  filter(lifeExp >=70 )%>% 
  group_by(continent) %>% 
  summarise( n= n() ) %>%                         #데이터를 우선 뽑고 
  ggplot(aes(x=continent,y=n,fill=n)) + 
  labs(title="기대수명이 70을 초과하는 데이터 빈도(대륙별)", x=)+
  #geom_bar(stat="identity)
  geom_col()






#ex4.png ####

#(1)gapminder::gapminder 데이터 셋을 이용하여 
#(2)기대수명이 70을 초과하는 데이터에 대해
#(3) 대륙별 '나라 갯수'.

barplot(gapminder, main="기대수명이 70을 초과하는 대륙별 나라 빈도")




#ex5.png ####
#줄 124 (boxplot)
#(1)gapminder::gapminder 데이터 셋을 이용하여 
#(2) 대륙별 기대수명의 사분위수를 시각화

#줄360

ggplot(gapminder,aes(x=continent,y=lifeExp))+
  geom_boxplot(aes(fill=continent))     ######fill아니고 외곽line만    교정!!



#ex6.png ####
#(1) gapminder::gapminder 데이터 셋을 이용하여 
#(2) 년도별로 gdp와 기대수명과의 관계를 산점도를 그리고 
#(3) 대륙별 점의 색상을 달리 시각화





#ex7.png ####
#(1)gapminder::gapminder 데이터 셋에서 
#(2)북한과 한국의 년도별 GDP 변화를 산점도로 시각화하시오
#(3)(북한:Korea, Dem. Rep. 한국:Korea, Rep. substr(str, start, end)함수 이용)   ########질문???????

gapminder%>%
  filter( country %in% c ( 'Korea, Dem. Rep.'  , 'Korea, Rep.' )) %>%
  ggplot(aes(x=year, y=gdpPercap)) +
  geom_point(aes(pch=country),pch=3) +                                               ########한국만 + 로 바꿔. 수정!! 
  labs(title="GDP의 변화(한국과 북한)") 

gapminder$country

#filter이용해서  한국,북한을 빼 




#plot(x, y1, pch=0,type="b",col='red', ylim=c(-8,2),yaxt="n", bty='n', ylab="")                  #ylim은y좌표 
# pch; 0:네모, 1:원, 2:세모, 3: 십자, 4: x, 5: 다이아몬드 ..
#      문자 해당 문자 
#type: p:점, 1:선, b:점선동시 , o:점선켭치면서동시 , h:히스토그램, s:계단모양, n:좌표찍지 않음  
#col; 1:black,  2:red, 3:green, 4:blue, 5:cyan, 6:purple, 7:yellow, 8:gray

#ylim, xlim; y눈금, x눈금 조정
#yaxt: y축 눈금 없애기 
#bty: 그래프 박스 타입 (o,L,7,U,C,n)




#ex8.png ####
#(1)gapminder::gapminder 데이터 셋을 이용하여 
#(2)한중일 4개국별 GDP 변화를 산점도와 추세선으로 시각화 하시오.

ggplot(data=gapminder, aes(x=year, y=gdpPercap) ) +  #x축,y축
  geom_point(position='jitter', col='brown', alpha=0.1, pch=2)+
  #position='jitter' : 산점도를 분산해서  
  geom_line() +    #추세선
  labs(title="한중일 4개국의 GDP 변화를 산점도와 추세선")+
  geom_smooth(method='lm') 





#ex9.png ####
#(1)gapminder::gapminder 데이터 셋에서 
#(2)한중일 4개국별 인구변화 변화를 산점도와 추세선으로 시각화 하시오
#(3) (scale_y_continuous(labels = scales::comma)추가시 우측처럼)


#         geom_point
# 줄419   geom_line








#ex10.png ####
#10.Ggplot2::economic 데이터 셋의 
#(2) 개인 저축률(psavert)가 시간에 따라 어떻게 변해 왔는지 알아보려 한다. 
#(3) 시간에 따른 개인 저축률의 변화를 나타낸 시계열 '그래프'와 '추세선'을 시각화하시오


ggplot(data=economics, aes(x=date, y=psavert) ) +  #x축,y축
  geom_line() +    #추세선
  geom_smooth(method='lm')    #직선이 아니고 곡선. 교정!!












