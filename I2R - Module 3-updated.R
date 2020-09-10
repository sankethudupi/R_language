###===================================================================================================###
###                                    INTRODUCTION TO R                                          ###
###                                        MODULE 3                                                  ###
###                                 [DESCRIPTIVE ANALYTICS]                                           ###                
###===================================================================================================###
#1. SUMMARIES AND STATISTICS
#=======================================================================================================
getwd()
#setwd("C:\\Users\\Gourab\\Desktop\\R")
cars <- read.csv("cars.csv")
View(cars)

#A. The summary() function
summary(cars$MPG)
summary(cars$Origin)
summary(cars)


#B. The by() / tapply() =function
?by
by(cars$Weight, cars$Origin, FUN=mean)
by(cars$Weight, cars$Origin, FUN=median)
by(cars$Weight, cars$Origin, FUN=sd)
by(cars$Weight, cars$Origin, FUN=summary)

tapply(cars$Weight, cars$Origin, FUN=mean)




#=======================================================================================================
#2. TABLES
#=======================================================================================================
table(cars$Origin)
table(cars$Cylinders)

summary(cars$Origin)

#there are no cars under our analysis which was manafactured in japan and has 5 cylinders
table(cars$Origin,cars$Cylinders)
#19.46% of all the cars under our analysis originates in japan
#from our sample we observed that 19.46% of originates in japan
prop.table(table(cars$Origin))
prop.table(table(cars$Origin))*100
round(prop.table(table(cars$Origin))*100,2)
#From our sample,we have observed that 0% of the total no of cars in japan
#has 8 cylinders

#from our sample we have observed that 16% of total no of cars in europe
#has got 4 cykinders=
#p(cars has 4 cyl|cars are originated in europe)=0.16     (x incorrect)

#...16% of all the cars have 4 cykinders and originates from Europe 
#p(cars having 4 cyl & cars originated in Eu) 0.16 (correct)
round(prop.table((table(cars$Origin,cars$Cylinders))),2)

#conditioning by rows
round(prop.table(table(cars$Origin,cars$Cylinders),1),2)
#from our sample we have observed that 90% of total no of car 
#in Europe has got 4 cylinders=
#p(cars has 4 cyl|cars are originated in Eu)=0.90 (correct)

#conditioning by columns
round(prop.table(table(cars$Origin,cars$Cylinders),2),2)
#..out of all cars having 8 cylinders 100% of them are originated in Us
#Us (or) ...100% of all the cars with 8 cylinders are from us origin
#p(cars originated in Us|cars has 8 cylinders)=1.00 (correct)





#=======================================================================================================
#3. HISTOGRAMS
#=======================================================================================================
hist(cars$MPG)
hist(cars$MPG,xlab ='Miles per galon',
              ylab = 'No of cars' ,
              main ='Histogram of MPG',
              col='red',border=F)


?hist
#=======================================================================================================
#4. BOXPLOTS
#=======================================================================================================
boxplot(cars$MPG)
boxplot(cars$MPG,horizontal = T,notch = T,col = 'red',xlab='MPG',
                                                        ylab='no of cars',
                                                        main='boxplot of MPG')

boxplot(cars$MPG~cars$Origin,horizontal = T)


#=======================================================================================================
#5. BAR CHARTS
#=======================================================================================================
barplot(table(cars$Origin))
barplot(prop.table(table(cars$Origin)),col='red')
barplot(prop.table(table(cars$Origin,cars$Cylinders)))
barplot(prop.table(table(cars$Origin,cars$Cylinders)),beside=T)


#=======================================================================================================
#6. SCATTERPLOTS AND PAIRWISE SCATTERPLOTS
#=======================================================================================================
plot(x=cars$MPG,y=cars$Weight,col='gold')
plot(x=cars$Cylinders,y=cars$MPG,col='red')
plot(x=cars$MPG,y=cars$Weight,col='red',type='l')
plot(x=cars$MPG,y=cars$Weight,col='red',type='b')
plot(x=cars$MPG,y=cars$Weight,col='red',pch=20)
highlight=cars[cars$MPG >35 & cars$Weight>2900 ,c('MPG','Weight')]
plot(x=cars$MPG,y=cars$Weight,pch=20)

points(x=highlight$Weight,y=highlight$MPG,pch=0,col='red',cex=10)
lines(x=highlight$Weight,y=highlight$MPG,pch=0,col='red',cex=1.5)
points(x=highlight$Weight,y=highlight$MPG,pch=0,col='gold',cex=10)
points(x=4,y=0,pch=0,cex=5)


#----------------------------------------------------------

plot(cars$Weight, cars$MPG, xlab="Weight of car", ylab="Miles per gallon"
     ,main="Association b/w MPG And Weight", pch=1)

highlights=cars[cars$MPG>35 & cars$Weight>2900,c("MPG","Weight")]
points(x=highlights$Weight, y=highlights$MPG, pch=0, cex=1.5, col='red')

#############################################################################
names(cars)
plot(cars)
data=cars[,2:7]
plot(data)
