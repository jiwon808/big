##################################################
###빅데이터 분석 결과 시각화 사례 연구 소스 ###
##################################################

# 3장 - 9장 
# 5-1 변수 rename    #내일까지 
#결측치 처리 , 이상치 처리  (하위 이상치 처리)

# 1. koweps_hpc10_2015_beta5.sav로드하여 변수명 변경

# 1.1 패키지 설치 및 로드하기
install.packages("foreign")
library(foreign) # SPSS 파일 불러오기
library(dplyr)   # 전처리
library(doBy)    # 전처리
library(ggplot2) # 시각화
library(readxl)  # 엑셀 파일
rm(list=ls(all.names = TRUE))

# 1.2 데이터 불러옴
getwd()
# setwd("C:/big/src/07_R")
raw_welfare <- read.spss(file='inData/Koweps/Koweps_hpc10_2015_beta1.sav',
                         # reencode = 'utf-8',
                         to.data.frame = T) # 이 파라미터 설정 없으면 list형태로 받아옴

View(raw_welfare)
welfare <- raw_welfare

## 1.3 데이터 검토
dim(welfare)
head(welfare)
tail(welfare)
View(welfare)
str(welfare)
summary(welfare)


welfare <- rename(welfare, gender=h10_g3, # 성별
                  birth = h10_g4,         # 태어난 연도
                  marriage=h10_g10,       # 혼인상태
                  religion = h10_g11,     # 종교
                  income = p1002_8aq1,    # 월급 
                  code_job = h10_eco9,    # 직업코드
                  code_region = h10_reg7) # 지역코드
welfare <- welfare %>% 
  select(gender, birth, marriage, religion, 
         income, code_job, code_region)
head(welfare)
View(welfare)
dim(welfare)
table(is.na(welfare))
colSums(is.na(welfare)) # 변수 별 NA인 데이터 갯수
colSums(!is.na(welfare))




### 2. 성별에 따른 월급 차이가 있는지 분석

# 2.1 채점기준1. 이상치 값 처리
table(welfare$gender, useNA = "ifany") # 이상치 없음. 1과 2만 있음
# 2.2 결측치 확인
table(is.na(welfare$gender))

# 2.3 gender값이 1을 male로, 2는 femaile로 변경하고 factor로 변경
str(welfare$gender)
summary(welfare$gender)
welfare$gender <- ifelse(welfare$gender==1, 'male','female')
welfare$gender <- as.factor(welfare$gender)
str(welfare$gender)
table(welfare$gender)

# factor 순서 바꾸려면 아래의 둘 중의 하나
welfare$gender <- factor(welfare$gender, levels=c('male','female'))

# 2.4 성별 비율 도표와 그래프 시각화
welfare %>% 
  group_by(gender) %>% 
  summarise(ratio = n()/nrow(welfare)*100) # 성별 비율

# 성별 비율을 그래프로
welfare %>% 
  group_by(gender) %>% 
  summarise(ratio = n()/nrow(welfare)*100) %>% 
  ggplot(aes(x=gender, y=ratio)) +
  geom_col(aes(fill=gender)) +
  labs(title = "남녀 성비") +
  scale_x_discrete(limits=c('female','male')) + # x축 순서 바뀜
  #scale_fill_discrete(limits=c('female','male'), labels=c("f", "m")) + # 범례의 텍스트 순서도 바뀜
  theme(legend.position = "none", 
        legend.background = element_rect(fill='lightgray'),
        legend.title = element_text(face=3, color='red'))  # face=3 ; 이텍릭

gender.ratio <- welfare %>% 
  group_by(gender) %>% 
  summarise(ratio = n()/nrow(welfare)*100)

pie(gender.ratio$ratio, 
    labels=paste(gender.ratio$gender, 
                 round(gender.ratio$ratio,1), 
                 '%'), clockwise = T)

ggplot(gender.ratio, aes(x="", y=ratio, fill=gender)) +
  geom_bar(stat = "identity") +
  coord_polar("y")

# income 
summary(welfare$income) # 결측치까지 나옴       #결측치 12030개 
table(is.na(welfare$income))
# 히스토그램을 통해 income의 분포를 본다.
qplot(welfare$income)
qplot(welfare$income, xlim=c(0,1000))
ggplot(data=welfare, aes(income)) +
  geom_histogram() + # 연속적인 자료 income을 계급으로 나누어 계급별 도수분포표를 나타냄냄
  coord_cartesian(xlim = c(0,1000))


# 2.6 이상치를 결측 처리
# boxplot
boxplot(welfare$income)
bp <- boxplot(welfare$income)$stat
bp
table(welfare$income<=bp[1], useNA = "ifany") # 하위 이상치를 벗어난 값
table(welfare$income > bp[5],exclude = NULL) # 상위 이상치를 벗어난 값이 5%이상의 값이여서 상위 이상치는 이상치 처리하지 않는다!!!

welfare$income <- ifelse(welfare$income<=bp[1], NA, welfare$income) #0보다작거나 1과 같으면 NA 아니면 income

table(welfare$income1==bp[1], useNA = "ifany") # 이상치 처리 되었는지 학인
table(welfare$income==bp[1], useNA = "ifany")
table(is.na(welfare$income))
summary(welfare$income) # 하위 이상치만 처리한 데이터

# 2.7 성별에 따른 월급 차이 분석을 도표로
tapply(welfare$income, welfare$gender, FUN=mean, na.rm=T)
tapply(welfare$income, welfare$gender, FUN=sd, na.rm=T)
by(welfare$income, welfare$gender, mean, na.rm=T)
by(welfare$income, welfare$gender, sd, na.rm=T)
summaryBy(income~gender, data=welfare, FUN=c(mean, sd), na.rm=T)   ######gender별로 
aggregate(welfare$income, by=list(welfare$gender), mean, na.rm=T)
aggregate(welfare$income, by=list(welfare$gender), sd, na.rm=T)

# na.omit함수를 써서 아래의 방법을 쓸 수도 있음.             ########이 방법을 더 추천!!! (이 방법으로하면 1907년 등 NA 결측치가 안나옴. 따라서 이 방법을 추천!  gender를 birth로 바꾸면 알 수 있다)
temp <- welfare[, c('income','gender')]
temp <- na.omit(temp)    #직업이 입력되어있는 행까지 날아 갈 수 있어서 temp를 넣는다 
summary(temp)
summaryBy(income~gender, temp, FUN = c(mean, sd))        

welfare %>% 
  filter(!is.na(income) & !is.na(gender))%>% 
  group_by(gender)%>% 
  summarise(mean=mean(income),
            sd=mean(income))



# 2.7 성별에 따른 월급 차이가 있는지 그래프로 분석
welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(gender) %>% 
  summarise(income.mean = mean(income),
            income.sd = sd(income)) %>% 
  ggplot(aes(x=gender, y=income.mean)) +
  geom_bar(stat = 'identity') +
  labs(title="성비에 따른 평균 수입")

ggplot(data=welfare, aes(x=gender, y=income)) +
  geom_point(position="jitter", col="yellow", alpha=0.1)+
  geom_violin()+                                               #중위수 영역 
  geom_boxplot(aes(col=gender), fill='lightyellow', notch = T,width=0.7) +
  geom_rug(col="dimgray")+
  labs(title = "하위 이상치 처리 후 성별에 따른 수입 분석")+
  coord_cartesian(ylim=c(0,1000))


# 2.7 성별에 따른 월급차이가 있는지 통계적 분석
temp <- welfare %>%  filter(!is.na(income))
View(temp)
var.test(income~gender, data=temp) # 등분산성 테스트
t.test(income~gender, data=temp, var.equal=F)                         # p-value < 2.2e-16
# p-value가 0.05미만으로 성별에 따른 월급차이가 없다는 가설을 기각한다



### 3. 나이와 월급의 관계 - 몇살 때 월급이 가장 많을까 
names(welfare)
class(welfare$birth)

# anova_test, 
# 독립변수의 타입에 따라 결정

#채점기준 ① birth, income 필드 변수의 이상치와 결측치를 확인한다(2점).
#채점기준 ② birth변수를 이용하여 나이를 계산하고 이 값을 age 필드로 추가한다(2점).
#채점기준 ③ x축을 나이, y축을 월급으로 지정하고 / 나이에 따른 월급의 변화가 표현되도록 막대그래프나 선 그래프로 시각화한다(3점).
#채점기준 ④ 나이에 따른 월급의 차이가 있는지 관계를 분석한다(3점).
  

#3.1 birth 이상치 확인 
(b<-boxplot(welfare$birth)$stat)     #이상치 있는지 그래프로 확인
table(welfare$birth<b[1] | welfare$birth>b[5] )   #데이블로 이상치 없는지 확인 

summary(welfare$birth)         #결측치 확인 
table(!is.na(welfare$birth))   #결측치 확인 


#3.2 나이변수 추가 (나이는 2015년 기준으로)
dim(welfare)    # dimension
welfare$age <- 2015 - welfare$birth + 1     #나이변수 추가 
View(welfare) #나이 변수 하나 추가
head(welfare)
summary(welfare$age) 

#나이의 분포 

qplot(welfare$age)

ggplot(data=welfare, aes(age))+
  geom_histogram()

ggplot(data=welfare, aes(age))+
  geom_bar()   # 이것도 가능하나 막대그래프는 주로 범주형자료시 사용함

boxplot(welfare$age)$stat# 나이가 2살부터 109살까지 데이터 있음    
                                       ##############$stat  콘솔에 숫자가 나옴 

ggplot(welfare,aes(x=age)) + geom_boxplot()
ggplot(welfare,aes(y=age))+
  geom_boxplot()+
  theme(axis.text.x = element_blank() )+    #x축 눈끔을 없앰
  coord_cartesian(xlim=NULL)



# 3.3 x축을 나이와 y축을 나이별 평균 월급의 변화 시각화
age_income <- welfare %>% 
  filter(!is.na(welfare$income)) %>%   #수입 결측치 처리 
  group_by(age) %>% 
  summarise(income.mean = mean(income),  #나이 평균, 표준편차
            income.sd = mean(income)) 
View(age_income)


ggplot(age_income, aes(x=age, y=income.mean)) +
  geom_col()
ggplot(age_income, aes(x=age, y=income.mean)) +
#  geom_bar(stat='identity') +
  geom_line()

# 3.4 '나이'에 따른 '월급의 차이'가 있는지 분석
# '통계적으로 분석'하기 p값에 따라 (3개이상 집단의 평균의 차이를 비교하는데 사용)
result <- aov(income~age, data=welfare)
summary(result)

fit <- lm(income~age, data=welfare)
anova(fit)
# F-value값에 따라 나이에 따른 월급의 차이는 유의미한 것으로 본다

# 3.5 월급을 가장 많이 받는 나이대는
ggplot(age_income, aes(x=age, y=income.mean)) +
  geom_line() +
  coord_cartesian(xlim = c(20,60))
#xlim(c(45,60))
orderBy(~-income.mean, data=age_income)[1,]   # 월급을 가장 많이 받는 나이대 

age_income[order(age_income$income.mean, decreasing = T),]
age_income %>% 
  arrange(-income.mean) %>% # 이상치 처리 전 월급을 가장 많이 받는 나이는 53세
  head(1)


#4. (1)1번 문제의 결과인 data.frame변수를 이용하여 
    #(2) 연령대에 따른 월급의 차이가 있는지, 있으면 어떤 연령대가월급이 가장 많은지 분석하시오. 
    #(3)단, 연령대는 30세 이하는 young, 30~60세는 middle, 61세 이상은 old로 분류

#채점기준 ① 파생변수 agegrade를 필드로 추가한다(2점).
#채점기준 ② agegrade 의 분포를 도표와 그래프로 시각화한다(3점).
#채점기준 ③ 연령대 별 월급의 boxplot을 시각화한다(2점).
#채점기준 ④ 실제로 연령대에 따른 월급 차이가 있는지 분석한다(3점).
  

  
# 4. 연령대에 따른 월급 차이 - 어떤 연령대의 월급이 가장 많은지 

dim(welfare)
names(welfare)
# 4.1 파생변수 agegrade 추가
#  young 30세 이하 / 30~60 middle / 61세 이상 - old
welfare <- welfare %>%
  mutate(agegrade = ifelse(age<=30, "young",
                           ifelse(age<=60, "middle", "old")))
str(welfare$agegrade)
# welfare$agegrade를 factor형 변수로 해도 됨.
# welfare$agegrade <- factor(welfare$agegrade, levels = c('young','middle','old'))

View(welfare)

# 4.2 agegrade의 분포를 도표와 그래프로

table(welfare$agegrade, useNA = "ifany")

qplot(welfare$agegrade) + xlim(c('young','middle','old'))
ggplot(data=welfare, aes(agegrade)) + 
  geom_bar(aes(fill=agegrade)) +
  #xlim(c('young','middle','old'))  #아래와 같음 
  scale_x_discrete(limits=c('young','middle','old')) +   #young,middle,old순서정함 
  theme(legend.position = "none")

# 4.3 연령대 별 월급의 boxplot
boxplot(income~agegrade, data=welfare, col=c('red','green','blue'))
ggplot(welfare, aes(x=agegrade, y=income, fill=agegrade)) +
  geom_boxplot(notch = T) +
  scale_fill_manual(values=topo.colors(3))+
  coord_cartesian(ylim=c(0,700))  #데이터가 많아서 모수 추청 쉽다 95%신뢰구간이 짧다 

# 4.4 연령대에 따른 월급 차이가 있는지 분석 도표
agegrade_income <- welfare %>% 
  group_by(agegrade) %>% 
  summarise(income.mean = mean(income, na.rm=T),
            income.sd= sd(income, na.rm=T))
agegrade_income
summaryBy(income~agegrade, welfare, FUN=c(mean, sd), na.rm=T)


# 4.4 연령대에 따른 월급 차이가 있는지 분석 시각화

ggplot(agegrade_income, aes(x=agegrade, y=income.mean)) +
  geom_col(aes(fill=agegrade)) +
  scale_x_discrete(limits=c('young','middle','old')) +
  theme(legend.position = "none")

ggplot(welfare, aes(x=agegrade, y=income)) +
  geom_point(position='jitter', col='orange', alpha=0.2)+
  geom_boxplot(aes(fill=agegrade), notch = T) +
  scale_x_discrete(limits=c('young','middle','old')) +
  scale_fill_discrete(limits=c('young','middle','old')) +
  geom_rug(col='dimgray')+
  coord_cartesian(ylim=c(0,400))

# 4.4 연령대에 따른 월급 차이가 통계적으로 유의미한지 분석
temp <- welfare %>%  filter(!is.na(income))
result <- aov(income~agegrade, data=temp)  
summary(result)

ft <- lm(income~agegrade, data=temp)    # anova쓰려면: anova함수를 쓸때 agegrade가 연속형이 아니라 '범주형 ' (1,2,3이아니라 'young', 'middle','old') (agegrade독립변수 '범주형', income도 범주형.-->anova를 사용시  lm회귀분석 필요     )
anova(fit)  
  

#5.  '성별에 따른 월급의 차이'는 '연령대 별로 다른지' 분석

#① 성별, 연령대, 월급 데이터의 결측치를 확인한다(3점).
  
#② 연령대별, 성별 월급의 평균과 표준편차, 빈도를 출력한다(3점).
  
#③ 성별에 따른 월급의 차이가 연령대별로 다른지 시각화 한다(4점).
  

#5.1 결측치 확인 
table(is.na(welfare$gender))     #gender 결측치 확인 
table(is.na(welfare$agegrade))   #나이대 결측치 확인 
table(is.na(welfare$income))     #월급 결측치 확인 

#5.2 '연령대별', '성별' 월급의 '평균'과 '표준편차', '빈도'를 출력
gender_agegrade_income<-
  welfare %>%
  filter(!is.na(income))%>%
  group_by(agegrade,gender)%>%
  summarise(income.mean = mean(income),
            income.sd= sd(income),
            n=n())

gender_agegrade_income



#5.3 '성별에 따른 월급의 차이'가 / '연령대별로 다른지' 시각화 

ggplot(gender_agegrade_income, aes(x=agegrade,y=income.mean,fill=gender))+  #여기서y는연령대 월급 평균
  geom_bar(stat = 'identity', position='dodge')    #######stat = 'identity', position='dodge' (원래 위아래로 되어있는 bar graph를 왼쪽오른쪽 양쪽으로 볼 수 있게끔 해줌. 시각화로 데이터를 더 직관적이게 바라 볼 수 있음  )

ggplot(data=gender_agegrade_income, aes(x=agegrade,y=income.mean,fill=gender))+   
  geom_col(position="dodge")+
  scale_x_discrete(limits=c("young","middle","old"))  

#young연령대 남녀비교 
young <- ggplot(subset(welfare,agegrade=='young'),            ##welfare중 young한 나이대 
       aes(x=gender,y=income))+
  geom_point(position="jitter", col='brown', alpha=0.3 )+  # jitter is a great technique in dot plots, box plots with dots, and scatter plots. Jitter is a random value (or for our purposes pseudo-random) that is assigned to the dots to separate them so that they aren't plotted directly on top of each other.
  geom_violin()+                              
  geom_boxplot(aes(fill=gender), notch=T, width=0.7)


# middle 연령대 남녀비교
middle<-ggplot(subset(welfare,agegrade=='middle'),
       aes(x=gender,y=income))+
  geom_point(position="jitter", col='brown', alpha=0.3)+
  geom_violin()+
  geom_boxplot(aes(fill=gender), notch = T, width=0.7)



# old 연령대 남녀비교

old <- ggplot(subset(welfare, agegrade=='old'), 
              aes(x=gender, y=income)) +
  geom_point(position = "jitter", col='brown', alpha=0.3)+      ####geompoint는 (데이터의)분포를 보는 것 
  geom_violin() +                                               ####geomviolin   어떤 income때가 가장 많은지 볼 수 있다 
  geom_boxplot(aes(fill=gender),notch = T, width=0.7)

library(gridExtra)
grid.arrange(young, middle, old, ncol=3) 
                                          #여기서 young, middle, old는 그래프명



#6. 1번 문제의 결과인 data.frame변수를 이용하여 나이에 따른 월급 변화를 성별을 분리하여 시각화 하시오. 

#채점기준 ① 나이와 성별로 group_by하여 월급평균, 월급표준편차, 월급중앙값, 최소값과 최대값, 빈도을 산출한다(5점).
#채점기준 ② 나이에 따른 월급평균의 추이를 아래와 같은 그래프를 시각화하고, 아래의 그래프를 파일로도 출력한다(5점).


# #6. '나이'에 따른  '성별 월급' 차이 분석
# 6.1 '나이와 성별'로 그룹하여 / '월급평균, 월급표준편차, 월급중앙값, 최소값, 빈도' 출력


gender_age_income <- welfare%>%
  filter(!is.na(welfare$income))%>%
  group_by(age,gender)%>%
  summarise(income.mean=mean(income),
            income.sd=sd(income),
            income.median=median(income),
            income.min=min(income),
            income.max= max(income),
            n=n())

gender_age_income 


# 6.2나이에 따른 월급 평균의 추이
png(filename = 'result.png', width=800, height=600)
ggplot(gender_age_income,aes(x=age,y=income.mean, col=gender))+ geom_line()  #시각화 그래프를 통해 middle, old층 월급 차이 많은 것으로 나옴 
dev.off()




#7. 1번 문제의 결과인 data.frame변수를 이용하여 직업별 월급의 차이가 나는지 분석하고, 만약 월급의 차이가나면 어떤 직업이 월급이 가장 많은지 상위 10개 직업군만 시각화하

  #채점기준 ① 직업별 월급 평균, 표준편차, 빈도를 평균월급 순으로 정렬하여 출력하여 직업별 월급의 추이를분석한다(3점).
  #채점기준 ② 직업별 월급의 차이를 분석한 후, 상위 소득 10개 직업군을 도표로 출력하고, 아래와 같은 그래프로 시각화한다. 시각화한 그래프는 ggsave함수를 이용하여 top10.png라는 그림파일로 저장한다(4점).

#채점기준 ③ 하위 소득 10개 직업군도 도표로 출력하고 시각화한다(4점).

  

# 7. 직업별 월급 차이

table(welfare$code_job)

# 7.1 '직업별' '월급 평균, 표준편차, 빈도'를 / '평균 월급 순'으로 정렬하여 출력.
job_list<-read_excel('inData/Koweps/Koweps_Codebook.xlsx', col_names = T, sheet=2)  #col_names = T  means  col_names 있다                                                                                                                             ###sheet=2   (해당 엑셀 파일에서 2nd sheet)
View(job_list)
head(job_list)
head(welfare)

welfare<-left_join(welfare,job_list,id="code_job")       #####어떻게 code_job과 매칭이 되는지??????? ############################
View(welfare)

job_income<-welfare%>%
  filter(!is.na(job) & !is.na(income))%>%
  group_by(job)%>%    
  summarise(income.mean=mean(income),                  ####summarise(는 groupby 후 mean,sd등 구할때 사),mutate(파생변수)    
            income.sd= sd(income),   
            n=n())%>%                                 #####n=n()  job들의 갯수 
  arrange(desc(income.mean))

View(job_income)
nrow(job_income)



# 7.2 상위 소득 10개 직업군 출력
top10 <- head(job_income, 10)
top10[,'job']

ggplot(data=top10, aes(x=income.mean, y=reorder(job, income.mean)))+
  geom_col()+
  labs(title = "상위 소득 10개 직업군", x="직업", 
       y="평균소득") +
  scale_y_discrete(limits=c('금속 재료 공학 기술자 및 시험원', 
                            '의료진료 전문가',
                            '의회의원 고위공무원 및 공공단체임원',
                            '보험 및 금융 관리자',
                            '제관원 및 판금원',
                            '행정 및 경영지원 관리자',
                            '문화 예술 디자인 및 영상 관련 관리자',
                            '연구 교육 및 법률 관련 관리자',
                            '건설 전기 및 생산 관련 관리자',
                            '석유 및 화학물 가공장치 조작원'),
                   labels=c('금속재료공학',
                            '의료진료','고위공무원','보험',
                            '제관원','행정경영','문화예술',
                            '연구교육','건설생산','석유화학'))


ggplot(data=top10, aes(x=income.mean, y=reorder(job,income.mean)))+
  geom_col()+
  #coord_flip() +
  labs(title="상위 소득 10개 직업군", x="직업", y="평균소득")




# 하위 소득득 10개 직업
bottom10<-welfare %>%
  filter(!is.na(income) & !is.na(job))%>%
  group_by(job)%>%
  summarise(mean.income=mean(income))%>%
  arrange(mean.income)%>%
  head(10)

bottom10

ggplot(bottom10,aes(x=mean.income, y=reorder(job,-mean.income)))+  ##-mean.income 월급 적은순부터 많은순 
  geom_col(aes(fill=job))+
  xlim(0,150)+
  labs(title="소득 하위 10직업군", x="직업군", y="평균소득")+
  theme(legend.position="none")


ggplot(data=bottom10, aes(x=reorder(job, -mean.income), y=mean.income))+
  geom_col(aes(fill=job))+
  coord_flip() +
  ylim(0,150)+labs(title = "소득 하위 10직업군", x="직업군", y="평균소득") +
  theme(legend.position = "none")






#8. 성별로 어떤 직업이 가장 많을지 분석
# 8.1 여성 최빈(가장많은) 직업 top10
female_top10<-welfare%>%
  filter(!is.na(job)&gender=='female')%>%
  group_by(job)%>%             # 여성  직업별 분류   (여기까지)
  summarise(cnt=n())%>%        # 여성 각 직업별 몇명있는지 (row수가 몇개 있는지)  (여기까지) 
  arrange(desc(cnt))%>%        #desc를 해서   큰순 부터 작은순 
  head(10)

female_top10
ggplot(data=female_top10, aes(y=reorder(job,cnt), x=cnt ) )+     #reoder 순서  #이름이 길어서y를 앞으로,x를 뒤로 
  geom_col()


# 남성 최빈 직업 top10

male_top10<-welfare %>%
  filter(!is.na(job)& gender=='male') %>%
  group_by(job) %>%
  summarise(cnt = n()) %>%
  arrange(desc(cnt)) %>%
  head(10)

male_top10
ggplot(data=male_top10,aes(x=reorder(job,cnt),y=cnt))+
  geom_col()+
  coord_flip()



### 9. 종교 유무에 따른 이혼율 

# 9.1 이상치 및 결측치 확인

table(welfare$religion,exclude=NULL)   #exclude=NULL ????? 무엇을 의미하는지?
table(!is.na(welfare$religion))


# 9.2 1은 종교-유, 2는 종교-무로 데이터 변경
welfare$religion <- ifelse(welfare$religion==1,"종교-유","종교-무")
welfare$religion


# 9.3 종교 유무의 빈도를 시각화
table(welfare$religion)
ggplot(welfare,aes(x=religion,fill=religion))+    #x축 religion 표시 
  geom_bar(width=0.7)+    #bar가 생김
  theme(legend.position = "none")


# 9.4 혼인 상태인 marriage에 따라, 파생변수 marriage_group 추가

welfare<-welfare %>%
  mutate(marriage_group = ifelse(marriage==1,"기혼", ifelse(marriage==3,"이혼",NA)))
          #marrage_group은 marraige로부터 나온 파생변수. 따라서 mutate사용 
head(welfare)  
table(welfare$marriage_group,useNA="ifany")
table(is.na(welfare$marriage_group))  #TRUE는 미혼, NA 아이, 별거, 사별 

colnames(welfare)









# 9.5 종교유무에 따른 이혼률 분석
temp<-welfare%>%
  filter(!is.na(marriage_group) & !is.na(religion))
View(temp)

head(temp)

#도표
table(temp$religion, temp$marriage_group)

#시각화
religion_marriage<- welfare %>%
  filter(!is.na(marriage_group))%>%
  group_by(religion, marriage_group)%>%
  summarise(n=n())%>%
  mutate(tot_group=sum(n))%>%
  mutate(pct= round(n/tot_group*100,1))  ####질문??????????  우선 한번 생각 
religion_marriage




# 9.6 분석한 결과를 '도표'와 '그래프'로 시각화
ggplot(religion_marriage, aes(x=religion, y=n, fill=marriage_group)) + 
  geom_col(position = "dodge")

# 기혼상태만
welfare %>% 
  filter(marriage_group=='기혼') %>% 
  group_by(religion) %>% 
  summarise(tot = n()) %>% 
  mutate(pct = tot/sum(tot)*100) %>% 
  ggplot(aes(x=religion, y=pct)) +
  geom_col()

# 이혼상태만
welfare %>% 
  filter(marriage_group=='이혼') %>% 
  group_by(religion) %>% 
  summarise(tot = n()) %>% 
  mutate(pct = tot/sum(tot)*100) %>% 
  ggplot(aes(x=religion, y=pct)) +
  geom_col()

# t-test는 독립변수는 볌주형, 종속변수는 연속형이여야 적합하다.
var.test(data=temp, marriage~religion)
t.test(data=temp, marriage~religion, var.equal=F) #p-value가 0.045로 종교유무에 따라 결혼상태가 다소 다를 수 있다.





#10. 지역별 연령대 비율을 분석. 노년층이 많은 지역은 어디인지 출력. 

#채점기준 ① 결측치를 확인한다(2점).
#채점기준 ② region 파생변수를 지역명으로 추가한다(2점).1:서울 2:수도권(인천/경기) 3:부산/경남/울산 4:대구/경북 5:대전/충남 6:강원/충북 7:광주/전남/전북/제주도
#채점기준 ③ '지역별 연령대 비율'을 분석한 도표 및 그래프를 시각화한다(3점).
#채점기준 ④ '노년층이 많은 지역'이 어디인지 시각화한다(3점).

class(welfare$code_region)
# 10.1 결측치 확인
table(welfare$code_region,useNA="ifany")
table(!is.na(welfare$agegrade))  #연령대, 지역 모두 NA가 없음 
table(!is.na(welfare$code_region))

# 10.2 region파생변수 추가
region_list <- data.frame(code_region=c(1:7),
                            region=c('서울',
                                     '수도권(인천/경기)',
                                     '부산/경남/울산',
                                     '대구/경북',
                                     '대전/충남',
                                     '강원/충북',
                                     '광주/전남/전북/제주도'))

region_list
welfare <- left_join(welfare, region_list, by="code_region")
head(welfare)
table(welfare$code_region)
table(welfare$region)

# 10.3과 4 지역별 연령대 비율을 분석한 도표 및 그래프
region_agegrade<-welfare %>%
  group_by(region, agegrade)%>%
  summarise(n=n())%>%
  mutate(tot_group=sum(n))%>%
  mutate(pct= round(n/tot_group*100,2))  #지역별 연령대  (강북지역 노년층 몇%) ####

edit(region_agegrade)


# 전연령층 지역별 인구
ggplot(data=region_agegrade, aes(x=reorder(region,n), y=n, fill=agegrade))+
  geom_col(position='dodge')+
  theme(axis.text.x=element_text(angle=70,vjust=0.7)) # 노년층이 많은 지역은 광주/전남/전북/제주


# 전연령층 지역별 비율
ggplot(data=region_agegrade,aes(x=reorder(region,n), y=pct, fill=agegrade))+
  geom_col(position='dodge')+
  theme(axis.text.x=element_text(angle=70,vjust=0.5)) # 노년층 비율이 많은 지역은 대구/경북



# 노년층이 많은 순
oldagegrade_region <- region_agegrade %>%
  filter(agegrade == 'old')%>%
  arrange(desc(n))

oldagegrade_region
ggplot(oldagegrade_region, aes(x=n,y=reorder(region,n)))+
  geom_col()
cat('노년층 인구가 많은 순 :', oldagegrade_region$region)

# 노년층 비율이 높은 순
oldagegrade_region <- region_agegrade %>%
  filter(agegrade=='old') %>%
  arrange(desc(pct))

oldagegrade_region

ggplot(data=oldagegrade_region,
       aes(x=pct, y=reorder(region,pct)))+
      geom_col()
  
cat('노년층 비율이 높은 순 :', oldagegrade_region$region)


library(dplyr)
table(welfare$gender, welfare$agegrade)

  welfare %>%
  filter(!is.na(income))%>%
  group_by(agegrade, gender)%>%
  summarise(income.mean = mean(income),
            income.sd= sd(income),
            n=n())


