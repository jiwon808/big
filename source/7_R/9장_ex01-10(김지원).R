#######################문제1-10번 #########################
#ex1.png ####(이미지,src저장) (문제-r파일-결과)
#1. datasets::
#(1) 'cars데이터 셋'을 이용하여 
#(2)'속도'에 대한 '제동거리의 산점도와 적합도'(신뢰구간그래프)를 나타내시오 
#(3)(단, 속도가 5부터 20까지 제동거리 0부터 100까지만 그래프에 나타냄).

library(datasets)
ggplot(data=cars   , aes(x=speed, y=dist)) + geom_point()+ 
    coord_cartesian(xlim=c(0,20)) +  
    coord_cartesian(ylim=c(0,100)) +        #y축 0부터2까지만 출력.  #줄235
  geom_smooth(method='lm')     ##직선으로 바꿔 #######    ####3번 충족 



#ex2.png ####  (O)
#(1) gapminder::gapminder 데이터 셋을 이용하여 
#(2) 1인당국내총생산에 대한 기대수명의 산점도를  
#(3)대륙별 다른 색으로 나타내시오.
#줄216 ***********

library(gapminder)
ggplot(data=gapminder,aes(x=gdpPercap, y=lifeExp)) + 
  geom_point(aes(size=continent, color=continent)) + 
  labs(x="gdpPercap",
       y="lifeExp")



#ex3.png ####
#(1)gapminder::gapminder 데이터 셋을 이용하여 
#(2)기대 수명이 70을 초과하는 데이터에 대해 
#(3)대륙별 데이터 갯수              (다이아몬드 예제)



#줄516
library(dplyr)
gapminder %>%
  filter(lifeExp >=70 )%>% 
  group_by(continent) %>% 
  summarise( n= n() ) %>%                         #데이터를 우선 뽑고 
  ggplot(aes(x=continent,y=n,fill=continent)) +            #geom_point(aes(color=Month)) +   # 외관선 줄 244  
  labs(title="기대수명이 70을 초과하는 데이터 빈도(대륙별)", x="대륙",y="빈도")+
  #geom_bar(stat="identity)                                                         #### legend바꾸는 법?????
  geom_col()




#ex4.png ####

#(1)gapminder::gapminder 데이터 셋을 이용하여 
#(2)기대수명이 70을 초과하는 데이터에 대해
#(3) 대륙별 '나라 갯수'.


gapminder %>%
  filter(lifeExp >=70 )%>%                           
  group_by(continent) %>% 
  summarise( n= n_distinct(country) ) %>%    #대륙별 '나라 갯수'.                         ####
  ggplot(aes(x=continent,y=n,fill=continent)) +    
  labs(title="기대수명이 70을 초과하는 대륙별 나라 갯수", x="continent" ,y="나라빈도")+
  #geom_bar(stat="identity)
  geom_col()


#ex5.png #### (o)
#줄 124 (boxplot)
#(1)gapminder::gapminder 데이터 셋을 이용하여 
#(2) 대륙별 기대수명의 사분위수를 시각화

#줄360
library(gapminder)
ggplot(gapminder,aes(x=continent,y=lifeExp))+
  geom_boxplot(aes(color=continent))     




#ex6.png ####
#(1) gapminder::gapminder 데이터 셋을 이용하여 
#(2) 년도별로 gdp와 기대수명과의 관계를 산점도를 그리고 
#(3) 대륙별 점의 색상을 달리 시각화



ggplot(gapminder,aes(x=gdpPercap,y=lifeExp))+
  geom_point(aes(color=continent))+     
  facet_wrap(~year) +
  scale_x_log10()
  coord_cartesian(xlim=c(0,45000))



#labs(title="Histogram with Auto Bining",
#       subtitle = "(Engine Displacement across Vehicle Classes)")+
#  theme(legend.position = "bottom")   #범례(legend)를 밑으로 내린다    줄318

#boxplot(iris$Sepal.Length)$stat               #$stat이상치 처리 용도.  줄332


#ggplot(iris,aes(y=Sepal.Length,x=Species)) + #시각화 표현
#  geom_boxplot(aes(fill=Species),col='dimgray')+         #col: Species 선이 바뀐다  #fill: 안에 색깔이 바뀐다 
#  scale_fill_manual(values=c('#FF0000','yellow','green'))           줄339


#줄371 중위수 
 #geom_boxplot(aes(col=rank), fill="lightyellow",notch= T)+
 #notch = T : 중위수에 대해서 95% 신뢰구간 표현, 신뢰구간이 겹치는지 파악 

#boxplot width 줄402
 #geom_boxplot(width=0.3, fill='green')
 
 
 #밀도분표 줄409
 #geom_density() +
 
 
 #줄 431
 # 도수분포표 ; 막대도표, 히스토그램 모두
# 히스토그램: 연속형 자료를 계급으로 나누어 / 계급별 도수를 나타냄
      #geom_histogram()함수 
# 막대도표: 범주형 자료의 빈도를 나타냄 
    #geom_bar(), geom_col()함수 
 
 #  theme(legend.position = "bottom",
 #       axis.text.x = element_text(angle=60, vjust=0.7
#                                   ))+   #밑에 이름 60도 기울려서 나옴  vjust=0.5 약간 밑으로 내림 
#    scale_fill_manual(values=topo.colors(7)) +   #ppt 16page
#    labs(title="제조사 별 class 빈도표")
 
 #다이아몬드 줄493
 
 # 4.9 차트 분할 출력 
 
 

#ex7.png ####
#(1)gapminder::gapminder 데이터 셋에서 
#(2)북한과 한국의 년도별 GDP 변화를 산점도로 시각화하시오
#(3)(북한:Korea, Dem. Rep. 한국:Korea, Rep. substr(str, start, end)함수 이용)   ########질문???????


gapminder%>%
  filter( country %in% c ( 'Korea, Dem. Rep.'  , 'Korea, Rep.' )) %>%
  ggplot(aes(x=year, y=gdpPercap)) +
  geom_point(aes(shape=country, col=country)) +                               
  labs(title="GDP의 변화(한국과 북한)")+
  scale_shape_manual(values=c(1,3))            ###에러: Insufficient values in manual scale. 2 needed but only 1 provided.
   

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

gapminder%>%
  #filter(gdpPercap)%>% #filter안에 T,F만 들어갈 수 있다 
  filter( country %in% c ( 'China', 'Japan' ,'Korea, Dem. Rep.'  , 'Korea, Rep.' )) %>%
  ggplot(aes(x=year, y=gdpPercap, col=country) ) +  #x축,y축
  geom_point(shape=1)+ 
  geom_line() +    #추세선
  labs(title="한중일 4개국의 GDP 변화를 산점도와 추세선")





#ex9.png ####
#(1)gapminder::gapminder 데이터 셋에서 
#(2)한중일 4개국별 '인구변화' 를 산점도와 추세선으로 시각화 하시오
#(3) (scale_y_continuous(labels = scales::comma)추가시 우측처럼)

gapminder%>%
  filter( country %in% c ( 'China', 'Japan' ,'Korea, Dem. Rep.'  , 'Korea, Rep.' )) %>%
  ggplot(aes(x=year, y=pop, col=country) ) +  #x축,y축
  geom_point(shape=1)+ 
  geom_line() +    #추세선
  labs(title="한중일 4개국의 인구변화의 산점도와 추세선")




#ex10.png ####
#10.Ggplot2::economic 데이터 셋의 
#(2) 개인 저축률(psavert)가 시간에 따라 어떻게 변해 왔는지 알아보려 한다. 
#(3) 시간에 따른 개인 저축률의 변화를 나타낸 시계열 '그래프'와 '추세선'을 시각화하시오

ggplot2%>%
  
library(ggplot2)
ggplot(data=economics, aes(x=date, y=psavert)) +  #x축,y축   #ggplot함수이름  #background초기화 
  labs(title="개인저축률 시계열 그래프")+
  geom_line(col='red', size=2) +    #추세선  두툼하게 
  geom_smooth(col='pink')    












