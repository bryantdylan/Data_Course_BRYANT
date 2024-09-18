#absolute path
list.files(path='Data_Course_Bryant/Data/')
list.files(path='Data_Course_Bryant/Data/', pattern = "\\.csv$")
#relative path with assigning path as an object
csv_files<-list.files(path='Data/', pattern = ".csv$")
#find the number of files that match your pattern (total .csv files in Data folder)
length(csv_files)           
df<-read.csv('Data/wingspan_vs_mass.csv')
#view the first five lines of the file
head(df, n=5)

b_files<-list.files(path='Data/', pattern = '^b', recursive = TRUE, full.names = TRUE)

for (i in b_files) {first_lines<-readLines(i, n=1)
}
print(first_lines)

csv_files<-list.files(pattern="\\.csv$", full.names=TRUE)
for (j in csv_files) {csv_lines<-readLines(j, n=1)


  
}
print(csv_lines)
