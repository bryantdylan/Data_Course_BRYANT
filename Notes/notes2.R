#10/8

#Start with the messy BP data and clean it up to the point where we paused in the last class

install.packages(janitor)
library(readxl)
library(tidyverse)
library(janitor)
dat<-read_xlsx('./Data/messy_bp.xlsx', skip=3)
View(dat)

dat %>% select(starts_with('HR'))

dat %>% pivot_longer(starts_with('BP')), names_to='visit',values_to='bp') %>%
  View()
####

View(dat[-c(1:3),])
bp<-dat %>%
  select(-starts_with('HR'))
bp %>% 
  pivot_longer(starts_with('BP'), names_to='visit', values_to='bp') %>% View() %>%
  mutate(visit=case_when(visit =='BP...8' ~1,
                         visit =='BP...10' ~2,
                         visit =='BP...12' ~3)) %>% View() %>%
  separate( bp, into=c('systolic','diatolic'))

###copied notes below
bp <- dat %>% 
  select(-starts_with('HR'))

bp <- bp %>% 
  pivot_longer(starts_with('BP'),
               names_to = 'visit',
               values_to = 'bp') %>% 
  mutate(visit = case_when(visit == 'BP...8' ~ 1,
                           visit == 'BP...10' ~ 2,
                           visit == 'BP...12' ~ 3)) %>% 
  separate(bp, into = c('systolic', 'diatolic')) 

hr <- dat %>% 
  select(-starts_with('BP'))

hr <- hr %>% 
  pivot_longer(starts_with('HR'),
               names_to = 'visit',
               values_to = 'hr') %>% 
  mutate(visit = case_when(visit == 'HR...9' ~ 1,
                           visit == 'HR...11' ~ 2,
                           visit == 'HR...13' ~ 3)) 

df <- full_join(bp, hr) %>% 
  clean_names()

df$sex %>% unique()
df$month_of_birth %>% unique()
df$race %>% unique()


df %>% mutate(race = case_when(race == 'Caucasian' | race == 'WHITE' ~ 'White',
                               TRUE ~ race)) %>% 
  View()

| # or
  && # and  
  
  if 
elseif
elseif
elsif 
else
  
  1976/11/30
11/30/1976
30/11/1976

2024-10-8 12:21:42

df %>% mutate(race = case_when(race == 'Caucasian' | race == 'WHITE' ~ 'White',
                               TRUE ~ race)) %>% 
  mutate(birthday = paste(year_birth, month_of_birth, day_birth, sep = '-') %>% 
           as.POSIXct()) %>% 
  select(-pat_id, -month_of_birth, -day_birth, -year_birth) %>% 
  mutate(systolic = systolic %>% as.numeric(),
         diatolic = diatolic %>% as.numeric()) %>% 
  mutate(hispanic = case_when(hispanic == 'Hispanic' ~ TRUE,
                              TRUE ~ FALSE)) # fallback condition


df_2 <- df %>% mutate(race = case_when(race == 'Caucasian' | race == 'WHITE' ~ 'White',
                                       TRUE ~ race)) %>% 
  mutate(birthday = paste(year_birth, month_of_birth, day_birth, sep = '-') %>% 
           as.POSIXct()) %>% 
  select(-pat_id, -month_of_birth, -day_birth, -year_birth) %>% 
  mutate(systolic = systolic %>% as.numeric(),
         diatolic = diatolic %>% as.numeric()) %>% 
  mutate(hispanic = case_when(hispanic == 'Hispanic' ~ TRUE,
                              TRUE ~ FALSE))

df_2 %>% ggplot(aes(x = visit, y =hr, color = race)) +
  geom_path()

df_2 %>% ggplot(aes(x = visit, 
                    y =hr, 
                    color = race)) +
  geom_line() +
  facet_wrap(~ race)


df_2 %>% ggplot(aes(x = visit, 
                    color = race)) +
  geom_path(aes(y = systolic)) +
  geom_path(aes(y = diatolic)) +
  facet_wrap(~ race)




time = as.POSIXct('30/11/1976')

#end of copy


update.packages()
#10/10
# What plots did you create, and what do you think this study was about?
#what should be x and y values

df_2%>%
  ggplot(aes(x=visit, y=hr, color=race)) +
  geom_path(aes(y=systolic)) +
  facet_wrap()


###new dataset

dat<-read_csv('./Bird_Measurements.csv')
install.packages('janitor')
install.packages('skimr')
library('skimr')




