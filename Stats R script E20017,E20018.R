### Statistics End term Assignment - E20017,E20018.

### 1. Hypothesis Testing using p-values:

library(ggplot2)
?midwest
View(midwest)

t.test(midwest$percollege, mu = 32, alternative = "less")

# To test if the midwest average is less than the national average
# we performed t-test. The results below show a p-value < .001 supporting 
#the alternative hypothesis that "the true mean is less than 32%."

### 2. Chi-Square test for contingency tables:

# In the built-in data set survey, the Smoke column records the students
# smoking habit, while the Exer column records their exercise level. 
# The allowed values in Smoke are "Heavy", "Regul" (regularly), 
# "Occas" (occasionally) and "Never". As for Exer, they are "Freq" (frequently),
# "Some" and "None".

# Problem:
# Test the hypothesis whether the students smoking habit is independent of their
# exercise level at .05 significance level.

library(MASS)                                # load the MASS package 
tbl = table(survey$Smoke, survey$Exer) 
tbl           # the contingency table

chisq.test(tbl)

# We applied the chisq.test function to the contingency table tbl,
# and found the p-value to be 0.4828.
# As the p-value: 0.4828 is greater than the .05 significance level,
# we fail to reject the null hypothesis that the smoking habit is independent
# of the exercise level of the students.

### 3. One Way Anova:
### 4. Tukey Test:

library(multcompView)

df <- read.csv("https://raw.githubusercontent.com/guru99-edu/R-Programming/master/poisons.csv")
View(df)

# Checking whether all treatment effect are same
treatment = aov(df$time + df$poison~ df$treat)
summary(treatment)

#p value is not significant i.e greater than 0.05. So, we fail reject the Null Hypothesis
# we conclude that all treatments are equal.

#We can run Tukey test to check treatment pairs.
tukey <- TukeyHSD(x=treatment, 'df$treat', conf.level=0.95)
tukey

# Tuckey test representation :
plot(curr_tukey , las=1 , col="brown")
#Tukey plot shows that all mean pairs are equal


### 5. Multi-Linear Regression - Partial F-test:

# Partial F-test: This test is used to compare if SSE of a super set of features
# is different from a subset of features.

library(MASS)

data("mtcars")
View(mtcars)
?mtcars

lmF <- lm(mpg~cyl+hp+wt, mtcars)
lmR <- lm(mpg~cyl+hp, mtcars)
sseR <- sum(lmR$residuals^2 )
sseF <- sum(lmF$residuals^2 )
n <- nrow(mtcars)
k <- 3
r <- 2
PartialFstat <- ((sseR - sseF) / (k-r)) / (sseF/(n-k-1))
PartialFstat

anova(lmR,lmF)

# using different set of reduced features
lmR1 <- lm(mpg~cyl, mtcars)
sseR1 <- sum(lmR1$residuals^2 )
r<- 1
PartialFstat <- ((sseR1 - sseF) / (k-r)) / (sseF/(n-k-1))
PartialFstat
anova(lmR1,lmF)

### 6. Multi-Linear Regression - Multi-collinearity:

install.packages("performance")
library(performance)

data(mtcars)
model <- lm(mpg ~ wt + cyl + gear + disp, data = mtcars)

# now check for multicollinearity
check_collinearity(model)


# The variance inflation factor is a measure to analyze the magnitude
# of multicollinearity of model terms. A VIF less than 5 indicates a
# low correlation of that predictor with other predictors. A value
# between 5 and 10 indicates a moderate correlation, while VIF values
# larger than 10 are a sign for high,not tolerable correlation of model predictors.

# The Increased SE column in the output indicates how much larger the
# standard error is due to the correlation with other predictors.


### 7. Logistic Regression - Variable Importance:

#Import Libraries
library(caret)
library(pscl)
library(ROCR)
library(pROC)

#import dataset
mydata <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")

# converting ategorical variable and target variable to factor
mydata$admit <- factor(mydata$admit)

# Training the model
mylogit <- train(admit ~ ., data = mydata, method = 'glm',family = "binomial")
summary(mylogit)

# Omnibus Test
# this is simply computing LRT statistic as: -2.LLo - (-2.LLk) at df=k
LLk = mylogit$finalModel$deviance
LL0 = mylogit$finalModel$null.deviance
LLk
LL0
LRTstat = LL0-LLk
LRTstat
LRTdf = 1 # this is # of features used in the model
# Get p value for LRTstat from Chi Sq, RT, for this df
pchisq(LRTstat,df=LRTdf, lower.tail = FALSE)
# from above result we reject the null hypothesis i.e. not all variables are zero.

# Walds Test
# individual feature level t / z statistic and p value
summary(mylogit)
# p value gives the signifance of each variable

# variable importance based on t statistic
varImp(mylogit)
#from the results we can conclude that variabel 'gre' is not significant


### 8. Evaluation of Classification Models:

# Confusion Matrix
newdata <- mydata[-1]
trainPredicted <- predict(mylogit,newdata=newdata)
confu <- confusionMatrix(mydata$admit,trainPredicted)
confu

#AUC - ROC Curve

mylogit1 <- glm(admit ~ .,data = mydata,family = "binomial"(link='logit'))
p <- predict(mylogit1, newdata=newdata,type="response")
pr <- prediction(p, mydata$admit)
prf <- performance(pr, measure = "tpr", x.measure = "fpr")
auc <- performance(pr, measure = "auc")
auc <- auc@y.values[[1]]
auc
plot(prf, tick=TRUE)


### 9. LDA - Bayes Discriminant Function:

library(MASS)

mydata = mtcars
View(mydata)
str(mydata)

mydata$am <- as.factor(mydata$am)
df.lda <- lda(am~., data=mydata)
df.lda
pred <- predict(df.lda,newdata = mydata[,c('mpg','cyl','disp','hp','drat','wt','qsec','vs','gear','carb')])
pred


