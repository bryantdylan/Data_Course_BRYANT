#notes 11/05/24


library(ggplot2)
library(tidyverse)
library(modelr)
library(dplyr)

#Using the mpg dataset, investigate how city fuel economy (cty) is affected
# by engine displacement (displ) and drivetrain type (drv.)

mod1<- mpg %>%
  glm(data = mpg,formula= cty~displ+drv)
summary(mod1)
data(mpg)
str(mpg)

mod1<- mpg %>%
  aov(data = .,formula= cty~displ+drv)
#whats the difference between a linear model and anova
# only tells you which ones affect model. LM gives you estimation and anova give you just the variable that affect.

# the following package makes nice summary tables
install.packages("kableExtra")
library(kableExtra)
library(broom)
broom :: tidy(mod1) %>%
  kableExtra::kable()%>%
  kableExtra::kable_classic()

broom :: tidy(mod1) %>%
  kableExtra::kable()%>%
  kableExtra::kable_classic(lightable_options = 'hover')

add_predictions(mpg, mod1) %>%
  ggplot(aes(x=pred, y=cty))+
  geom_point()

add_residuals(mpg, mod1) %>%
  ggplot(aes(x=resid, y=cty))+
  geom_point()

#split data to train
dim(mpg)
234*0.8
234-187

install.packages("caret")
library(caret)
id<- caret :: createDataPartition(mpg$cty, p=0.8, list = F)
length(id)

train<-mpg[id,]
test<-mpg[-id,]
dim(train)
dim(test)

mod2<-glm(data=train, formula=cty~displ+drv)
add_predictions(test, mod2) %>% View()


#how off is the model
add_predictions(test, mod2) %>%
  mutate(error=abs(pred-cty)) %>%
  pluck('error') %>%
  summary()

install.packages("vegan")
library(vegan)
#see teams notes
mat<-iris %>%
  dplyr :: select(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width) %>%
  as.matrix
adonis2(mat ~iris$Species)

#multi-dimension scaling
metaMDS()
mds<-metaMDS(mat)
mds$points
data.frame(species=iris$species, mds1=mds$points[1], mds2=mds$points[2])%>%
  ggplot(aes(x=mds1, y=mds2, color=species))+
  geom_point()+
  stat_ellipse()


#in output for rmd you can change the format and style 






