###===================================================================================================###
###                                      INTRODUCTION TO R                                           ###
###                                          MODULE 4                                           ###
###                                    [DATA MANIPULATION]                                            ###                
###===================================================================================================###
#1. The class() function
#=======================================================================================================
x=4.0
class(x)
y = c(1,2,3,4)
class(y)
char = 'abc'
class(char)
my_char = c('a','b','c')
class(my_char)

class(cars$MPG)
class(cars$Model)
class(cars$Car)
class(cars$Origin)
class(cars$Origin)
class(cars$Weight)


str(cars)
class(cars)
#=======================================================================================================
#2. Class conversion
#=======================================================================================================
 y

z = as.matrix(y)
class(z)
t(z)
u = matrix(y,2,2)
u
u[1,]
u[,2]

?length
length(y)

?dim
dim(z)#dimension

cars$Weight = as.numeric(cars$Weight)
class(cars$Weight)

#=======================================================================================================
#3. Sort & Order
#=======================================================================================================

#A. Sort the variable Acceleration in ascending order
sort(cars$Acceleration)[1:20]


#B. Sort the variable Weight in Decsending Order
sort(cars$MPG,decreasing = T)



#C. Sort the data by MPG in increasing order
order(cars$MPG)
cars2 = cars[order(cars$MPG),]
View(cars2)

vec = c(22,15,17)
order(vec)
order(-vec)
-vec

cars3=cars[order(-cars$MPG),]
View(cars3)



#D. Sort the data by origin and then sort by MPG
cars4 = cars[order(cars$Origin,-cars$MPG),]
View(cars4)


#E. Sort the data by Cylinders and then by MPG




#F. Sort the data by MPG in ascending order and by cylinder in descending order





#=======================================================================================================
#4. Data Transformation
#=======================================================================================================

# Plot a scatter plot between MPG and weight. Comment of the linearity.
attach(cars)
plot(MPG,Weight)
detach(cars)


# Re-plot the scatter plot by taking the log transformation of both the variables. Does the linearity 
# Improve?
plot(log(Weight),log(MPG))



# But there is a problem! Check the summary of log(MPG). What do you observe?
summary(log(MPG))



# Can you identify where we got misleaded? Probably the answer lies in the summary of MPG.
##---> Zeroes present in the data
###  can be infered from the summary


# How can we correct this?

summary(log(MPG+1))


# Study the association between MPG and Horsepower.
plot(MPG,Horsepower)
plot(log(MPG),log(Horsepower))




#=======================================================================================================
#5. The ifelse() function
#=======================================================================================================

# PROBLEM 1:
# Create a variable HP which will take only two values:
# IF Horsepower < 100 THEN "Low HP"
# IF Horsepower >= 100 THEN "High HP"

#ifelse(testcondition, value when true, value when false)
#ifelse(condition1,value when true, condition2)

cars$HP = ifelse(cars$Horsepower<100,'Low HP','High HP')
View(cars)



#PROBLEM 2:
# Create a Variable MPG_Rate which will take on the values as follows:
# IF MPG < 15 THEN "Normal"
# IF MPG >= 15 AND MPG <=25 THEN "GOOD"
# IF MPG >= 25 AND MPG <=35 THEN "GREAT"
# IF MPG >= 35 THEN "AWESOME"

cars$MPG_rate = ifelse(cars$MPG<15,'Normal',ifelse(cars$MPG<=25,'Good',ifelse(cars$MPG<=35,'Great','Awesome')))

View(cars)



#=======================================================================================================
#6. SQL in R
#=======================================================================================================

install.packages('sqldf')
require(sqldf)
?require

sqldf('SELECT * from mtcars')
sqldf('select mpg from mtcars')
sqldf('select mpg, wt from mtcars')
sqldf('select mpg, wt from mtcars order by mpg')
sqldf('select mpg, wt from mtcars order by mpg')
sqldf('select am, avg(mpg) as avg_mpg from mtcars group by am')
sqldf('select am, avg(mpg) as avg_mpg from mtcars group by am')
sqldf('select am, avg(mpg), stdev(mpg) from mtcars group by am')

View(mtcars)




