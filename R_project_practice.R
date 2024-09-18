# show current working directory
getwd()

#list files in current directory
list.files()

#relativepath
list.files(path='Data_Course_Bryant/Assignments/')

#read.csv("NAME_OF_FILE.csv")
#uppercase and lowercase make a difference!
readLines()
readlines()
?readline

#separate lines 
x<-readLines("NAME_OF_FILE.csv")
y<-paste(x[1],sep=',')

str(x)
list_x <- as.list(x)

#how to uncharacter
list_x <- as.list(x)
df_x <- as.data.frame(x)

#view data in data frame
View(df_x)
y<-paste(df_x,sep=',')
View(y)
#functions above need some correction but process is mostly correct, you can also use the read.csv function as well

#read file [FILENAME] in and assign name [x_2]
x_2<-read.csv('FILENAME')

#show row names
row.names(x_2)<-x_2$variable

#create plot
plot(x_2$variable1, x_2$variable2)
#x_2[row, column]
x_2[2,2]
#above: show row 2 and column 2 in file

#remove row names so it will plot :[,-1] removes the column number with the row names
df_x_2<- x_2[,-1]
[row, column]
plot(df_x_2[1,],df_x_2[,2])
#above: plots the two variable from the row/column that you pulled from 


#What is a loop? A loop will keep running code until you tell it to stop
rock_1
rock_2
...
rock_10
#for (variable in vector) {}
for (i in 1:3) {print(i)
  
}

print('1')
print('2')
print('3')

#Another example of fxn above : gives rock samples in asending order from 1 to 3
for (i in 1:3) {print(paste('rock_',i, sep="_"),collapse=NULL)
  
}
  
flavor=c('mint chocolate chip','chocolate','I hate ice cream')

for (i in flavor) {print("what's your favorite ice cream flavor?")
  print(i)
  #print(past('rock'i, sep="_"), collapse=NULL)
}

#another example
for (i in 1:5) {print(i+1)
  
}
