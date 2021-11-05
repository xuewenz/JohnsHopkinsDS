library(AppliedPredictiveModeling)
library(rattle)
library(caret)

data(segmentationOriginal)
inTrain <- createDataPartition(y = segmentationOriginal$Case, p = 0.6,
                               list = FALSE)
training <- segmentationOriginal[inTrain,]
testing <- segmentationOriginal[-inTrain,]

set.seed(125)
modFit <- train(Class~.,method = "rpart",data = training)
modFit$finalModel


fancyRpartPlot(modFit$finalModel)
