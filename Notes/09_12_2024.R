mtcars
data()
str(mtcars)

#1 Build a data frame from mtcars with only rows that have more than 4 cylinders
dat<-data.frame(mtcars)
dat_2<-data.frame(mtcars)
cars_more4cyl<-dat[dat$cyl>4,]
#or
mtcars_cyl<-mtcars[mtcars$cyl>4,]
View (mtcars_cyl)

#2 Pull out just the miles per gallon of those cars and find the mean, min, and max
df_mpg<-mtcars[mtcars$mpg]
mpg<-cars_more4cyl$mpg
mean(mpg)
min(mpg)
max(mpg)

str(mtcars)
mtcars$cyl<-as.character(mtcars$cyl)
data(mtcars)

#restore data
dat<-data.frame(mtcars)
dat<-dat[,c(1:3)] 
dat<-data.frame(mtcars)  #resets previous code back to your original data

as.numeric(c('1','2','2'))
as.numeric(c('1','f','2'))


haircolor<-c('black','brown','brown','brown','red')
as.factor(haircolor)

#assign everything in mtcars as character using loop

dat<-data.frame(mtcars)
names(dat)
mtcars$cyl<-as.character(mtcars$cyl)
for (i in names(dat)) {
  
  dat[,i]<-as.character(dat[,i])
}
 str(dat)
 
 i='mpg'
i='cyl' 



#apply repeats function for whole data set
dat<-apply(mtcars,2,as.character)
dat<-apply(mtcars,2,as.numeric)
 #general format [apply(x,margin,...)]
#margin #1=row  #2=col
#data[row, column]

#mean value of each column
apply(dat,2,mean)

#other apply functions
lapply(list,function)
sapply ()
vapply ()

#tidyverse package  #google tidyverse hotkeys
#Build a data frame from mtcars with only rows that have more than 4 cylinders
library(tidyverse)
cyl_cars<-mtcars %>% 
  filter(cyl>4)
dim(cyl_cars)

mtcars %>%
  filter(cyl>4) %>%
  mean(mpg)

cyl_cars$mpg %>%
  mean()

abs(mean(mtcars$mpg)) #opt1
mtcars$mpg %>% #opt 2
  mean()

##select both mpg>19 and vs=1
select_19_mpg<-mtcars[mtcars$mpg>19 & mtcars$vs==1,] #opt1
dim(select_19_mpg)

select_19_mpg_tidy<-mtcars%>% #opt2
  filter(mpg>19 &vs==1)


#cool map package (pulls maps from google maps)
library(ggmap)
library("ggmap")

df_brassica<-read.csv('brassica data...')
df_brassica$long<-geocode(df_brassica$country)
#? research how to ggmap for future use
geocode"white house"

