#09/17/2024 (missed class this day)
# new package "palmerpenguins". 
library(tidyverse)
install.packages('palmerpenguins')
library(palmerpenguins)

# 1. subset this penguins data frame to only those observations where 
# bill_length_mm >40
penguins %>% names()


df_bill_greater_40 <- penguins %>% 
  filter(bill_length_mm > 40)

dim(penguins)
dim(df_bill_greater_40)
View(df_bill_greater_40)


# 2. how do I filter out this further for just female penguins?
df_bill_greater_40_F <- penguins %>% 
  filter(bill_length_mm > 40 & sex == 'female')
dim(df_bill_greater_40_F)
View(df_bill_greater_40_F)

# 3. from these I want to know the mean of body mass. what should i do?
mean(df_bill_greater_40_F$body_mass_g)


df_bill_greater_40_F$body_mass_g %>% 
  mean()


penguins %>% names

penguins %>% 
  filter(bill_length_mm > 40 & sex == 'female') %>% 
  pluck("body_mass_g") %>% 
  mean()


## Next ####
penguins %>% 
  filter(bill_length_mm > 40 & sex == 'female') %>% 
  group_by(species) %>% 
  summarize(mean_body_mass_g = mean(body_mass_g))


df_x <- penguins %>% 
  filter(bill_length_mm > 40 & sex == 'female') %>% 
  group_by(species) %>% 
  summarize(mean_body_mass_g = mean(body_mass_g),
            min_body_mass_g = min(body_mass_g),
            max_body_mass_g = max(body_mass_g),
            no_invidual = n())


penguins %>% 
  filter(bill_length_mm > 40 & sex == 'female') %>% 
  group_by(species) %>% 
  summarize(mean_body_mass_g = mean(body_mass_g),
            min_body_mass_g = min(body_mass_g),
            max_body_mass_g = max(body_mass_g),
            no_invidual = n())


penguins %>% 
  filter(bill_length_mm > 40 & sex == 'female') %>% 
  group_by(species) %>% 
  summarize(mean_body_mass_g = mean(body_mass_g),
            min_body_mass_g = min(body_mass_g),
            max_body_mass_g = max(body_mass_g),
            no_invidual = n()) %>% 
  arrange(mean_body_mass_g)


penguins %>% 
  filter(bill_length_mm > 40 & sex == 'female') %>% 
  group_by(species) %>% 
  summarize(mean_body_mass_g = mean(body_mass_g),
            min_body_mass_g = min(body_mass_g),
            max_body_mass_g = max(body_mass_g),
            no_invidual = n()) %>% 
  arrange(desc(mean_body_mass_g))



penguins %>% 
  filter(bill_length_mm > 40 & sex == 'female') %>% 
  group_by(species) %>% 
  summarize(mean_body_mass_g = mean(body_mass_g),
            min_body_mass_g = min(body_mass_g),
            max_body_mass_g = max(body_mass_g),
            no_invidual = n()) %>% 
  arrange(desc(mean_body_mass_g)) %>% 
  write_csv("./Data/penguins_summary.csv")

write.csv(file, path = )
getwd()


penguins %>% names

penguins %>% 
  filter(bill_length_mm > 40 & sex == 'female') %>% 
  group_by(species, island) %>% 
  summarize(mean_body_mass_g = mean(body_mass_g),
            min_body_mass_g = min(body_mass_g),
            max_body_mass_g = max(body_mass_g),
            no_invidual = n())


penguins %>% 
  filter(bill_length_mm > 40 & sex == 'female') %>% 
  group_by(species, island) %>% 
  summarize(mean_body_mass_g = mean(body_mass_g),
            min_body_mass_g = min(body_mass_g),
            max_body_mass_g = max(body_mass_g),
            no_invidual = n())


## 1. find the fat penguins (body_mass_g > 5000)
## 2. count how many are male and female
## 3. return the max body mass of male and female

penguins %>% 
  filter(body_mass_g > 5000) %>% 
  group_by(sex) %>% 
  summarize(N = n(),
            max_body = max(body_mass_g))


## 4. Add a new column to the original dataframe that indicates whether they're fat
penguins$fatty = penguins$body_mass_g > 5000
View(penguins)

mutate()


iris %>% names()

iris %>% 
  mutate(ares = Sepal.Length * Sepal.Width)




#09/19/2024 class notes

#convert the following code expressions into "pipe format" to make them more readable

unique(stringr::str_to_title(iris$Species))
max(round(iris$Sepal.Length),0)
mean(abs(rnorm(100, 0, 5)))
median(round(seq(1,100,0.01),1))

#convert to pipe format (%>%)
iris$Species %>%
  stringr::str_to_title() %>%
  unique() %>%
  
  
iris$Sepal.Length %>%
  round(0) %>%
  max()
  
rnorm(100,0,5) %>%


#notes (correct quiz above later)

#4. Add a new column to the original dataframe (penguins) that indicates whether theyre fat using mutate

#create new column
mutate()
# name of new col
mutate(fatstate=)
#value of new col
#fat= (body_mass_g>5000)
#skinny=(body_mass_g<=5000)
mutate(fatstate=)

#case_when()  if this is true then do this thing
#case_when('condition' ~ 'if condition is T, action')
case_when(body_mass_g>5000 ~ 'fat', body_mass_g<= 5000 ~ 'skinny')

df_fat_penguins<-penguins %>%
  mutate(fatstate= case_when(body_mass_g>5000 ~ 'fat', body_mass_g<= 5000 ~ 'skinny'))
View(df_fat_penguins)

#make a graph
df_fat_penguins %>%
  ggplot(mapping=aes()) #aes=aesthetic

df_fat_penguins %>% names
df_fat_penguins %>%
  ggplot(mapping=aes(x=body_mass_g, y=bill_length_mm)) + 
  geom_point()

df_fat_penguins %>%
  filter(!is.na(fatstate)) %>% #removes na values 
  ggplot(mapping=aes(x=body_mass_g, y=bill_length_mm, color=fatstate)) + 
  geom_point()

is.na(df_fat_penguins$fatstate)

df_fat_penguins %>%
  filter(!is.na(fatstate)) %>% #removes na values 
  ggplot(mapping=aes(x=body_mass_g, y=bill_length_mm, color=fatstate, shape=sex)) + 
  geom_point()

df_fat_penguins %>%
  filter(!is.na(fatstate)) %>% #removes na values 
  filter(!is.na(sex)) %>%
  ggplot(mapping=aes(x=body_mass_g, y=bill_length_mm, color=fatstate, shape=sex)) + 
  geom_point() +
  geom_smooth() +
  scale_color_viridis_d(option = 'rocket')

df_fat_penguins %>%
  filter(!is.na(fatstate)) %>% #removes na values 
  filter(!is.na(sex)) %>%
  ggplot(mapping=aes(x=body_mass_g, y=bill_length_mm, color=fatstate, shape=sex)) + 
  geom_point() +
  geom_smooth() +
  scale_color_manual(values=c('darkgreen','grey24'))+
  theme_minimal()+
  theme(axis.title = element_text(angle=180,face="italic"))
#google gg plot cheat sheet 
#search kaggle.com to find data sets to play with 
#can also search google dataset search

#09/24/2024 Notes
#warm up activity
library(tidyverse)
library(ggplot2)

#Make an interesting plot using the penguin data
df_fat_penguins %>%
  ggplot(mapping=aes(x=penguins$flipper_length_mm, y=penguins$body_mass_g, color=penguins$flipper_length_mm)) +
  geom_point()+
  geom_smooth()
df_fat_penguins %>%
  ggplot(mapping=aes(x=penguins$island, y=penguins$body_mass_g))+
  geom_boxplot()+
  geom_jitter(height=0, width = 0.1, alpha=0.2)

df_fat_penguins %>%
  ggplot(aes(x=body_mass_g, fill=species))+
  geom_density(alpha=0.5)

#penguins %>%
  #ggplot(aes(x= ,
   #          y=  ))+
  #geom_point


#read in tsv file
df<-read.delim('./Data/DatasaurusDozen.tsv')
View(df)
head(df)
names(df)
str(df)
dim(df)

# 1. Open data file
# 2. look at data 

df %>%
  group_by(dataset)%>%
  summarise (mean_x=mean(x),
             sd_x=sd(x),
             min_x=min(x),
             max_x=max(x))
df %>%
  ggplot(aes(x=x,
             y=y))+
  geom_point()+
  facet_wrap(~dataset)

df %>%
  ggplot(aes(x=x,
             fill=dataset))+
  geom_density(alpha=0.4)

install.packages('GGally')
library(GGally)
GGally::ggpairs(penguins)


install.packages("gapminder")
library(gapminder)

penguins %>%
  filter(!is.na(sex))%>%
  ggplot(aes(x=bill_length_mm, y=body_mass_g))+
  geom_point(size=4, alpha=0.75) +
  facet_wrap(~species, scales='free') +
  scale_color_viridis_d(end=0.8)

penguins %>%
  filter(!is.na(sex))%>%
  ggplot(aes(x=bill_length_mm, y=body_mass_g))+
  geom_point(size=4, alpha=0.75) +
  facet_wrap(~species) +
  scale_color_viridis_d(end=0.8)+
  labs(x='X-axis Title',
       y='Y-axis Title')+
  theme_bw()+
  theme(strip.background = element_blank(),strip.text=element_text(face='bold', size=12),
        axis.text=element_text(face='bold', size=12))


#09/26/2024

install.packages("gapminder")
install.packages('ggimage')  
install.packages('gganimate')  
install.packages('patchwork')
install.packages('ggminder')

library(gapminder)
library(ggimage)
library(gganimate)
library(patchwork)
library(ggminder)


glimpse(gapminder)
View(gapminder)
df_gapminder<-gapminder
df_gapminder
ggplot(df_gapminder,aes(x=year, y=lifeExp, color=continent)) +
  geom_point(aes(size=pop))+
  facet_wrap(~continent)+
  scale_color_viridis_d()

ggsave("./CoolPlot.png", plot=p1, width=8, height=6, dpi= 300, units='cm')


dat<-data.frame(x=1:10, y=rnorm(10))
ggplot(dat, aes(x=x,y=y))  +
  geom_point (size=5)+
  geom_line()+
  xkcdaxis(range(dat$x, range(dat$y))+
  theme_xkcd
  
str(p1)

p1 + theme_dark
p1_dark<- p1 + theme_dark   
p1 + p1_dark
p1/p1_dark
(p1+p1)/p1_dark  
(p1+p1)/p1_dark +patchwork::plot_layout(guides='collect') +
  plot_annotation('My cool plot!')

p1<-ggplot(mtcars, aes (x=wt, y=mpg))+geom_point()+ ggtitle("Plot 1")
p2<-ggplot(mtcars, aes (x=wt, y=mpg))+geom_point()+ ggtitle("Plot 2")
p3<-ggplot(mtcars, aes (x=wt, y=mpg))+geom_point()+ ggtitle("Plot 3")

(p1+p2)/p3+
  plot_annotation('Cool Car plot', tag_levels='a')+
  patchwork::plot_layout(guides='collect')

p2<-p1 +facet_wrap(~continent)
p1/p2

p3<-ggplot(df_gapminder,aes(x=gdpPercap, y=lifeExp, color=continent)) +
  geom_point(aes(size=pop))+
  scale_color_viridis_d()

#gganimate turns plots into animated graphs
df_gapminder$country %>% unique ()

?transition_time

p3+transition_time( time=year)
df_gapminder$year %>% range

p3+transition_time( time=year) +
  labs(title='Year: {frame_time}')

p3<-geom_text(aes(label=country))

ggplot(df_gapminder,aes(x=gdpPercap, y=lifeExp, color=continent)) +
  geom_point(aes(size=pop))+
  scale_color_viridis_d()+
  geom_text(aes(label=country))

df_gapminder$country %>%

my_country=c('United States','China', 'Uganda', 'Vietnam')
df_gapminder%>%
  mutate(my_country=case_when(country %in% country))

anim_save("./cool_anim.gif", animation=p4)

ggsave"./cool_anim.png, width=9,height=4,dpi=300, p4"


install.packages('leaflet')
library(leaflet)
