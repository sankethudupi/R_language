
#for loop
for (i in 1:5)#here i is vector in the list of vectors c(1,2,3,4,5)
{
  print("Happy Birthday")
}
#can run without the brackets also
#for loop runs as how much vectors in the list

#understand
x<-c(3,5,7,8)
for (i in 1 : length(x))
{
  print(x[i])
}

for (i in c(22,34,56,32,2))#it takes the length of the vector
{
  print("Hello world")
}

for (i in x)#here it takes the index
{
  print(i)
}

#----------------------------------------------------------
#paste function
paste("Hello","world")
paste("Hello"," ","World")# for concatinate strings

a<-"Apple"
b<-"Pie"

paste(a,b)#by default the separator is space
paste(a,b,sep = "-")#changing the separator

for (i in c("Bio","Phy","Chem"))
{
  print(paste("The subject is",i))
}

#----------------------------------------------------------
library(MASS)  
data("Boston")
View(Boston)

mean(Boston[,1])

# for printing the mean of each column
for (i in 1:ncol(Boston))
{
  print(mean(Boston[,i]))
}

# finding the names of the columns
names(Boston)

# for print the mean of each column with the variable name
for (i in 1:ncol(Boston))
{
  print(paste(names(Boston)[i],":",mean(Boston[,i])))
}

#shortening the above code

for (i in names(Boston))
{
  print(paste(i,":",round(mean(Boston[,i]),3)))
}

#--Another method to give names
avg<-numeric()#empty vector- only numerical values
avg<-c()#empty vector

for (i in 1:ncol(Boston))
{
  avg[i]<-round(mean(Boston[,i]),3)
}

avg
names(avg)

# giving names to the vectors
names(avg)=names(Boston)
names(avg)
avg

b = c(1,2,3,4)
names(b)=c("one","two","three","four")
b
## using matrix
avg = matrix(avg)
rownames(avg) <- names(Boston)
colnames(avg)<-"Mean"
avg
class(avg)
avg["zn","Mean"]

#-----------------------------------------------------------
#ploting histogram
hist(Boston$nox,main="Histogram of Nox",col='Blue',xlab='NOX')

# another way of plotting the same--
hist(Boston[,5],main=paste('Histogram of',"",names(Boston)[5]),xlab=names(Boston)[5])

#histogram of each columns automated

for (i in 1:ncol(Boston))
{
  hist(Boston[,i],col='Light blue',main=paste('Histogram of',"",names(Boston)[i]),xlab=names(Boston)[i],ylab='No of houses')
}

#-------------------------------------------------------------
#plotting box plot and histogram together
par(mfrow=c(2,1))
for (i in 1:ncol(Boston))
{
  boxplot(Boston[,i],col='maroon',border='grey5',horizontal = T,main=paste('Boxplot of',"",names(Boston)[i]),xlab=names(Boston)[i],ylab='No of houses') 
  hist(Boston[,i],col='Light blue',main=paste('Histogram of',"",names(Boston)[i]),xlab=names(Boston)[i],ylab='No of houses')
}
#----------------------------------------------------------
#storing the image files
getwd()
setwd('C:\\Users\\anand\\Desktop\\Praxis\\sem2\\R\\Boston graphs')
getwd()

for (i in 1:ncol(Boston))
{
  png(paste(names(Boston)[i],".png", sep=""))#start

  par(mfrow=c(2,1))
  

  boxplot(Boston[,i],col='maroon',border='grey5',horizontal = T,main=paste('Boxplot of',"",names(Boston)[i]),xlab=names(Boston)[i],ylab='No of houses') 
  hist(Boston[,i],col='Light blue',main=paste('Histogram of',"",names(Boston)[i]),xlab=names(Boston)[i],ylab='No of houses')
  dev.off()#end - this should be written
}
#------------------------------------------------------------
#Creating functions in R

bill<- function(bill,tax=10)
{
  total <- bill+bill*(tax/100)
  return(total)
}

bill(1000)
bill(1000,30)

#function without any argument ---------------------------

hello<- function()
{
  print('Hello')
}

hello()

#Function for getting the graphs of a data-----------------

graphs <- function(data)
{
  for (i in 1:ncol(data))
  {
    hist(data[,i],col='Light blue',main=paste('Histogram of',"",names(data)[i]),xlab=names(data)[i])
  }
}

graphs(Boston)
graphs(mtcars)

#----------------------------------------------------------
#storing the graphs
getwd()
setwd('C:\\Users\\anand\\Desktop\\Praxis\\sem2\\R\\mtcars graph')
graphs1 <-function(data)
{
  for (i in 1:ncol(data))
  {
    png(paste(names(data)[i],".png", sep=""))#start
    
    par(mfrow=c(2,1))
    
    
    boxplot(data[,i],col='maroon',border='grey5',horizontal = T,main=paste('Boxplot of',"",names(data)[i]),xlab=names(data)[i]) 
    hist(data[,i],col='Light blue',main=paste('Histogram of',"",names(data)[i]),xlab=names(data)[i],)
    dev.off()#end - this should be written
  }
}
graphs1(mtcars)
