#10/15/2024
#install package
install.package ("ggmagnify", repos=c(""))
install.packages("ggmagnify", repos = c("https://hughjonesd.r-universe.dev", 
                                        "https://cloud.r-project.org"))
library(tidyverse)
iris %>%
  ggplot(aes(x=Sepal.Length, y= Sepal.Width))+
  geom_point()+
  ggmagnify :: geom_magnify( from=c(4.5,5,3,3.5), to c(6,7.5,2.5,4))

library(skimr)
dat<-read.csv ('./Data/Bird_Measurements.csv')
skim(dat)
names(dat)
View(dat)

keepers,
dat1<-dat %>%
  clean_names() %>%
  select(keepers, starts_with("m_"),-ends_with('_n')) %>%
  mutate(sex='m')

library(readxl)



read_xlsx("/Users/bryan/OneDrive/Documents/BIOL_3100/Data_Course_BRYANT/Data/Worst Data Storage Ever.xlsx")
path<- "/Users/bryan/OneDrive/Documents/BIOL_3100/Data_Course_BRYANT/Data/Worst Data Storage Ever.xlsx"
dat<-read_xlsx(path, sheet = 1, range= "A1:K10")
make_clean_names(names(dat))

#google regular expression to see more options other than start_with and end_with
fruit<-c('apple','pineapple','Apple')
grepl('apple', fruit)
grepl('apple', fruit, ignore.case=T)
grepl('^apple?', fruit, ignore.case=T)
which(grepl('apple', fruit)) # tells you which position or position range is true
dat[,which(grepl('^a_', names(dat), ignore.case=T))] #see class notes

strings<-c('') #missing notes

library(measurements)





#Notes 10/22/24

#Create your own function
my_function<-function {print('I hate Tuesday!')}

my_function<-function(a,b) {
  result<- a+b
  return(result)}

#must make a and b defaults
my_function(2)<-function(a,b=2) {
  result<- a+b
  return(result)}

function(a,b=2) {
  result<- a+b
  result_2<-a*b
  return(result)
  return(result_2)}


numbers<-c(2,3,4,5,6)

my_function3<-function(numbers) {
  avg<- mean(numbers)
  sum_values<-sum(numbers)
  return(list(mean=avg, sum=sum_values))}

my_function3<-function(numbers) {
  avg<- mean(numbers)
  sum_values<-sum(numbers)
  return(paste0('mean=', 'sum='))}

print(my_function3)

my_function3(numbers)

stats<-my_function3(numbers)
stats$mean
stats$sum
median()
mode()
#stats does not have all of the function such as median and mode
#SEE CLASS NOTES
check_even_odd<-function(x){
  if(x %% 2==0){
    return(paste(x, 'is even'))}
  else {return(paste(x, 'is odd'))}

print(check_even_odd)

print_seq(5)
library(tidyverse)


#to read in functions from another rscript???
source("/#path to function rscript.R")
#you can use the package creater function to create your own package (devtools package)


  
  
  
View(iris)
function_iris<-function(iris)
  {result<- iris$petal.length > 1.5 
  return(paste(iris, 'large flower')) }{
    result_2<- iris$petal.length < 1.5
    return(paste(iris,'small flower'))}
  

function_iris(1.6)

#google package to make CV or resume or use the files provided in data course


