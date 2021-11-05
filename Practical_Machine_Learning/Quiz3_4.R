missClass = function(values, prediction){sum(((prediction > 0.5) * 1) != values) / length(values)}

library(ElemStatLearn)
data(SAheart)
set.seed(8484)
train <- sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/2,replace=F)
trainSA <- SAheart[train,]
testSA <- SAheart[-train,]

set.seed(13234)

SAModel <- train(chd ~ age + alcohol + obesity + tobacco + typea + ldl, 
                      data = trainSA, method = "glm", family = "binomial")

missClass(testSA$chd, predict(SAModel, newdata = testSA))
missClass(trainSA$chd, predict(SAModel, newdata = trainSA))
