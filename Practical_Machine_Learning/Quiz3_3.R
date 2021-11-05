library(pgmm)
data(olive)
olive <- olive[,-1]
newdata <- as.data.frame(t(colMeans(olive)))

OliveModel <- train(Area ~ ., method = "rpart", data = olive)

predict(OliveModel, newdata = newdata)
