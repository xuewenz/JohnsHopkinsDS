library(ElemStatLearn)
library(randomForest)

data(vowel.train)
data(vowel.test)

vowel.train$y <- as.factor(vowel.train$y)
vowel.test$y <- as.factor(vowel.test$y)

set.seed(33833)
VowelModel <- randomForest(y ~ ., data = vowel.train)
order(varImp(VowelModel), decreasing = T)
