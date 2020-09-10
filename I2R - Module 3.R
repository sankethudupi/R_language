###===================================================================================================###
###                                    INTRODUCTION TO R                                          ###
###                                        MODULE 3                                                  ###
###                                 [DESCRIPTIVE ANALYTICS]                                           ###                
###===================================================================================================###
#1. SUMMARIES AND STATISTICS
#=======================================================================================================


#groupy by in boxplot
boxplot(cars$MPG~cars$Origin)

#=======================================================================================================
#5. BAR CHARTS
#=======================================================================================================

barplot(table(cars$Origin))# table needed to be given so that the count is taken as  height

# proportion also can be used
barplot(prop.table(table(cars$Origin)),col = 'Maroon')


data 


barplot(prop.table(table(cars$Origin,cars$Cylinders)),color = 'lightblue',beside =  T)
#=======================================================================================================
#6. SCATTERPLOTS AND PAIRWISE SCATTERPLOTS
#=======================================================================================================
plot(cars$Weight,cars$MPG,xlab='Weight of the car',ylab='Miles per Gallon',
     main = 'Association between MPG and Weight')

plot(cars$Weight,cars$MPG,xlab='Weight of the car',ylab='Miles per Gallon',
     main = 'Association between MPG and Weight',pch = 20)

# highlighty certain points
highlights = cars[cars$MPG>35 & cars$Weight>2900,c('MPG','Weight')]

points(x=highlights$Weight,y=highlights$MPG,pch=0,cex=1.5,col='red')

data = cars[,2:7]
plot(data)

cor(cars$MPG,cars$Weight)
