
#load data set
library(tidyverse)
df<-read_csv("./Data/wide_income_rent.csv")

#plot rent price for each state (state on x axis and y on y-axis), bar chart

View(df)
t(df)
df2<-t(df)
head(df2)
class(df2)
str(df2)

df2<-t(df) %>% as.data.frame()
class(df2)
head(df2)
dim(df2) #53  2

#df2<-df2[row,col]
df3<-df2[-1,]

row.names(df3)
df3$state<- row.names(df3)
View(df3)

names(df3)
names(df3)<-c('income','rent','state')

ggplot(data=df3,aes(x=state, y=rent))+
  geom_bar(stat='identity')+
  labs(title='Income to rent by state',
       x='state',
       y='rent')+
  theme(axis.text.x=element_text(angle=45, hjust=1))


pivot_longer()
pivot_wide()

df_test<-data.frame(
  ID=c(1,2,3),
  Height=c(150,160,170),
  Weight=c(55,65,75))


df_longer<-df_test %>%  
  pivot_longer(cols=c(Height, Weight),
               names_to = "Measure",
               values_to = "Value")
View(df_longer)

df_test
df_longer
df_wider

df_wider<-df_longer %>%  
  pivot_wider(names_from = "Measure",
               values_from = "Value")

df %>% pivot_longer(-variable) %>%
  View()

df %>% pivot_longer(-variable, names_to='state',values_to = 'amount') %>%
  View()

df_long<-df %>% pivot_longer(-variable, names_to='state',values_to = 'amount') %>%
  pivot_wider(names_from='variable', values_from = 'amount')%>%
  ggplot(aes(x=state,y=rent))+
  geom_bar(stat=identity)+
  labs(title='income to rent by state',
       x='state',
       y='rent')+
  theme(axis.text.x=element_text(angle=45, hjust=1))

View(df_long)

#one variable in multiple columns --> pivot_longer()
#multiple variables in one column --> pivot_wider()

table1
table2

df_table2<-table2
View(df_table2)

df_table2_wider<-df_table2 %>% pivot_wider(names_from='type', values_from='count')
View(df_table2_wider)
View(df_table2)


table3 %>%
  separate(rate, into=c('case','population'))

table4a
table4b

x<-table4a %>%
  pivot_longer(-country,names_to = 'year', values_to='case')
y<-table4b %>%
  pivot_longer(-country,names_to = 'year', values_to='population')

# in order to combine data frames you must have at least one column in common

x
y
full_join(x,y)

table5
