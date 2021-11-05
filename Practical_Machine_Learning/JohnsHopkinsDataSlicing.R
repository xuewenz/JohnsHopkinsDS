library(caret)
library(kernlab)
data(spam)

inTrain <- createDataPartition(y=spam$type,
                               p=0.75, list=FALSE)

training <- spam[inTrain,]
testing <- spam[-inTrain,]
#dim(training)

set.seed(32323) #to make random "constant"
folds1 <- createFolds(y=spam$type, k=10,
                     list=TRUE, returnTrain = TRUE)
#Creating K fold aka splitting the datasets into K number
#of sample sets
#returnTrain = false: returning just the test set samples

folds2 <- createResample(y=spam$type, times=10,
                        list=TRUE)

tme <- 1:1000
folds3 <- createTimesSlices(y=tme,intialWindow=20,
                           horizon=10)

