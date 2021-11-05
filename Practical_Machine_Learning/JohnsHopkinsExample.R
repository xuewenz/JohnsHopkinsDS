library(caret)
library(kernlab)
data(spam)

inTrain <- createDataPartition(y=spam$type,
                               p=0.75, list=FALSE)
training <- spam[inTrain,]
testing <- spam[-inTrain,]

set.seed(32343)

modelFit <- train(type ~., data=training, method="glm")
#Parameters explanation:
#type ~. : Im trying to predict type while using the other parameters as the inputs
#data=training: Im trying to build the model with the "training" data
#method="glm": Generalized Linear Model is used


modelFit$finalModel
#Look at the model

predictions <- predict(modelFit, newdata=testing)
#Emails Classifed spam or not spam
#print(predictions)

confusionMatrix(predictions,testing$type)
#statistics for how well the classifer did

