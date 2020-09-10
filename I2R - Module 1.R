###===================================================================================================###
###                                     Introduction to R                                          ###
###                                         MODULE 1                                          ###
###                                    [DATA AND VECTORS]                                             ###                
###===================================================================================================###
#1. READING THE CARS.CSV DATA IN R
#=======================================================================================================

getwd()                                 #get the working directory
setwd("C:\\Users\\anand\\Downloads")  #set the working directory
cars = read.csv("cars.csv")             #read the data


#========================================================================================================
#2. SOME INITIAL STEPS WITH DATA
#========================================================================================================
#A. Checking the dimension of the data
dim(cars)

#B. Number of rows of the data
nrow(cars)

#C. Number of columns of the data
ncol(cars)

#D. Studying the Structure of the data
str(cars)

#E. Printing first and last few lines of a data
head(cars)
tail(cars)
tail(cars,10)
#F. Viewing the entire data
View(cars)


#========================================================================================================
#3. INTRODUCTION TO VECTORS
#========================================================================================================

v <- 5 #assignment symbol
v+1


#A. Defining a vector

x <- c(12,34,24,45,7,18) # c stands for combine
x

#B. Generating regular sequences - The colon [:] operator
1:20
20:1

#C. Generating regular sequences - The seq() function
seq(50,100,5)
?seq
seq(50,100,length.out = 100)
rep(c(1,2,3),4)
rep(c(1,2,3), each=5)
#D. Renerating simple random sample
sample(10:100,10)
sample(c(0,1), size=10,replace=TRUE) #With replacement
sample(c(0,1),size=10,replace=TRUE,prob=c(0.8,0.2))

#========================================================================================================
#4. SOME USEFUL FUNCTIONS
#========================================================================================================

#A. sum()
sum(x)

#B. mean(), median(), sd(), var()
mean(x)
median(x)
var(x)
sd(x)
#C. max(), min()
max(x)
min(x)
#D. quantile()
quantile(x,c(0.25,0.9))

#E. length()
length(x)

#F. summary
summary(x)
summary(cars)


#========================================================================================================
#5. VECTOR SUBSETTING
#========================================================================================================

v=10
v>10

my_vec









#The conditional operators

# > is greater than 
# < is less than
# == is equal to
# <= is less than or equal to
# >= is greater than or equal to

x =  c(10,19,24,56,32)
x > 20
x == 24


#and - &
#or - |

(x>30 | x<10)
(x<30 & x >10)


#PROBLEM:
#Consider the following two vectors

x <- c(33,45,23,67,54,48)
y <- c(108,151,164,119,135,122)

x
y


#Write a R code to find the folowing solutions
# a. Vaues of x that are less than 35
x[x<35]
y[y<35]



# b. The number of observations in y that are more than 150
y[y>150]
length(y[y>150])
sum(y>150)

# c. The number of observations in y that are between 120 and 165
sum(((y>120)&(y<165)))



# d. The vaues in x that are less than 30 or greater than 50
x[((x>30)&(x<50))]


# e. The values in x for which the values in y is less than or equal to 120
x[(y<=165)]



# f. The values in y for which the values in x is equal to 45
y[x==45]



#========================================================================================================
#6. VECTORS IN DATA
#========================================================================================================

#Note that in a data set each rows or columns is nothing but a vector
#A variable in data can be extracted as follows:

cars$Horsepower
sum(cars$Horsepower)
mean(cars$Horsepower)









#PROBLEM (Reference: cars.csv)

# a. Which car has the highest mpg?
cars$Car[cars$MPG == max(cars$MPG)]


# b. Which car is the heaviest?
cars$car[cars$Weight == max(cars$Weight)]


# c. Which car is the lightest?
cars$Car[cars$Weight == min(cars$Weight)]


# d. Which car has the highest value of the horsepower?
cars$Car[max(cars$Horsepower)]


# e. What is the lowest value of the horsepower?
min(cars$Horsepower)


# f. What is the highest values of the mpg?
max(cars$MPG)



# g. List the top 10 percentile values of mpg.
quantile(cars$MPG,c(0.9,0.91,0.92,0.93,0.94,0.95,0.96,0.97,0.98,0.99))
quantile(cars$MPG,seq(0.91,0.99,0.01))

# h. List the name of cars which has mileage between 25 and 35 mpg.
cars$Car[cars$MPG>25 & cars$MPG<35]


# i. What is the average weight of the cars which has 8 cylinders?
mean(cars$Weight[cars$Cylinders==8])


# j. What is the average weight of the cars that are originated in Japan?

mean(cars$Weight[cars$Origin=='Japan'])

# k. Randomly select 20 cars from the given list of cars.
sample(cars$Car,20)
?sample










