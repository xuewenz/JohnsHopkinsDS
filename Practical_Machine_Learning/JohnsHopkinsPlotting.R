library(ISLR)
library(ggplot2)
library(caret)
library(Hmisc)
library(gridExtra)

data(Wage)
summary(Wage)

inTrain <- createDataPartition(y=Wage$wage,
                               p=0.7, list=FALSE)
training <- Wage[inTrain,]
testing <- Wage[-inTrain,]
dim(training)
dim(testing)

FPlot <- featurePlot(x=training[,c("age","education","jobclass")],
            y=training$wage,
            plot="pairs")
QPlot <- qplot(age,wage,data=training, color = education)
QPlot + geom_smooth(method = "lm",formula=y~x)

cutWage <- cut2(training$wage,g=3)
table(cutWage)

p1 <- qplot(cutWage,age, data = training, fill=cutWage,
            geom = c("boxplot"))
p2 <- qplot(cutWage,age, data = training, fill=cutWage,
            geom = c("boxplot","jitter"))
grid.arrange(p1,p2, ncol=2)

t1 <- table(cutWage,training$jobclass)
prop.table(t1,1)
#i want to get the prop of each group (row)
#if i pass 2 then it will be column

QPlot2 <- qplot(wage,color=education,data=training,geom="density")

