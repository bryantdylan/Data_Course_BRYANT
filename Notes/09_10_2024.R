#pop quiz
x<-c(1,2,3,4,5)

#write a for-loop that prints the results of 1+x
for (i in x) {print (i+1)
  
}

#1####
##2####
###3####
####4####

#vector : one dimension, only stores things of one type
vec_1<-c(1,2,3)
vec_2<-c(1,"2",3)
vec_3<-c(TRUE,TRUE,FALSE)
vec_4<-c("TRUE",TRUE,FALSE)
1>3


#matrix : more than one dimension, same type
mat_1<-matrix(c(1:6),nrow=2, ncol= 3)
1:6
seq(1,10, by=2)
seq(1,10, by=1)
mat_2<-matrix(c(1,2,'3', TRUE),nrow=2, ncol= 2)

#array :multi-dimension, same type
array (1:3, c(2,4))
as.array(letters)

array<- array(mat_1,mat_2)

#data frame : 2 dimension, different types
x_2<-read.csv('wide_income_rent.csv')
View(x_2)
str(x_2)

dim(mat_1)
dim(x_2)
length(vec_1)
length(x_2[1])
length(length(vec_1))
class(x_2)
class(vec_2)
class(vec_3)

#list : multi-dim, different types
list_x<-list(1,2,3,4,5)

list<-list(mat_1, x_2)

list[1]
list[2]
for (variable in list) {print(variable)
  
}

# simple logical data
1>0
1==1 # must use two equal signs
2>=3
2>=2 #>= greater than or equal to
#2 is not 3
2==3
2!=3 #!= not equal to

cars
letters
iris

# step 1: check the structure and how many dimensions there are
iris
str(iris)
dim(iris)
View(iris)
colnames(iris)
names(iris)

#statistics
mean(iris$Sepal.Length)
max(iris$Sepal.Length)
min(iris$Sepal.Length)
sd(iris$Sepal.Length)
summary(iris$Sepal.Length)

#pull out one species 
big_iris<-iris[iris$Sepal.Length>6,]
dim(big_iris)
View(big_iris)

six_iris<-iris[iris$Sepal.Length==6,]
dim(six_iris)
x_iris<-iris[iris$Sepal.Length>7|iris$Sepal.Length<5]

iris$Sepal.Length +1
iris$area<-iris$Sepal.Length*iris$Sepal.Width #adds column to data frame
View(iris)

iris$color<-c(rep('white',148),'blue','orange')
View(big_iris)
names(big_iris)
plot(big_iris$Sepal.Length, big_iris$Sepal.Width, col='blue','orange','white')

#install package
install.packages('ggplot2')
install.packages('qrcode')
library(qrcode)
url<-'https://.......'
qr<-qrcode::qr_code(url)
plot(qr)

#install ggplot2 and Tidyverse
install.packages("ggplot2")
install.packages("tidyverse")
