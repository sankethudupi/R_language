###===================================================================================================###
###                                     INTRODUCTION TO R                                           ###
###                                   MODULE 5 AND MODULE 6                                           ###
###                                      [DATA CLEANING]                                              ###                
###===================================================================================================###
#1. Handling variables with missing values
#=======================================================================================================

data <- c(88, 95,	85,	NA,	76,	69,	78,	NA,	70,	68)
data


#A.Using the data given above calculate,
#a.	The mean of the data.
mean(data)


#b.	The median of the data.
median(data)


#c.	The SD of the data.
sd(data)


#B. The is.na() function
#is.na()--> [Logical] Is the value an NA? -> TRUE or FALSE
is.na(data)


#subset the data that contains only the missing values
data[is.na(data)]

#subset the data that contains the non-missing values
data[!is.na(data)]

mean(data[!is.na(data)])
mean(data,na.rm=T)
#=======================================================================================================
#2. SIMPLE IMPUTATION
#=======================================================================================================

#A.	Impute the missing value by mean.
data[is.na(data)] = mean(data[!is.na(data)])
data
#B.	Impute the missing value by median.
data
data[is.na(data)] = median(data[!is.na(data)])
#=======================================================================================================
#3. CHOOSING BETWEEN MEAN OR MEDIAN IMPUTATION
#=======================================================================================================





#=======================================================================================================
#4. COMPLETE CASE ANALYSIS
#=======================================================================================================
length(complete.cases(fram))

fram_complete = fram[complete.cases(fram),]
dim(fram_complete)
summary(fram_complete)

#=======================================================================================================
#5. WORKING ON THE FRAMINGHAM DATA
#=======================================================================================================
setwd("C:/Users/anand/Desktop/Praxis/sem2/R")
fram <- read.csv("framingham.csv")

View(fram)
dim(fram)
str(fram)
summary(fram)



#=======================================================================================================
#6. IMPUTATION FOR CATEGORICAL VARIABLES
#=======================================================================================================

#A. MODE IMPUTATION
# Mode is the value withthe highest frequency
# Mode imputation --> replacing the missing values by mode

#Consider the variable education
summary(fram$education)
table(fram$education)
prop.table(table(fram$education))

fram$education[is.na(fram$education)] = 1
#B. KNN IMPUTATION

install.packages("VIM")
library(VIM)
?kNN

fram1 = kNN(fram)
summary(fram1)
View(fram1)

fram1 = subset(fram1,select=male:TenYearCHD)
View(fram1)

fram2 = kNN(fram,variable = 'education',k=10)
summary(fram2)


#NOTE: KNN IMPUTATION CAN ALSO IMPUTE NUMERICAL VARIABLES

#=======================================================================================================
#7. OUTLIERS - OUTLIERS IDENTIFICATION
#=======================================================================================================

p <- c(sample(60:100, 20),15,23,150,168)

#A. Through boxplots
boxplot(p)


#B. By specifying benchmarks
#most common benchmarks are (Q1 - 1.5*IQR, Q3 + 1.5*IQR) OR (mean - 2*SD, mean + 2*SD)




#NOTE: anything below LB is outlier & anything above the UB is an outlier



#=======================================================================================================
#8. OUTLIER TREATMENTS - TRIMMING
#=======================================================================================================





#=======================================================================================================
#8. WINSORIZATION
#=======================================================================================================

#Replacing the outliers by some nearby values
#We can replace the outliers by the UB or the LB (whichever is nearer)



#STEP 1 - any values above UB should be replaced by UB



#STEP 2 - any values bolow LB should be replaced by LB




#=======================================================================================================
#9. VARIABLE TRANSFORMATION
#=======================================================================================================
#SOMETIME TAKING LOG OR SQRT TRANSFORMATION HELPS







#=======================================================================================================
#10. WORKING ON THE FRAMINGHAM DATA
#=======================================================================================================

setwd("E:/Gourab Nath/R/R Session - Data")
fram <- read.csv("framingham.csv")


summary(fram$BMI)

#STEP 1 - Identify the presence of outliers



#STEP 2 - Specify the benchmarks



#STEP 3 - Count the number of outliers



#STEP 4 - Take log/sqrt tranformation & check if the number of outliers is reduced




#SQRT




#STEP 5 - Apply the winsorizing technique to correct the outliers
#if the log & sqrt transformation is not making any difference then we will use the original
#variable and winsorize the outliers








 


