require(shiny)
require(caret)
require(AppliedPredictiveModeling)
require(gbm)
require(e1071)
require(survival)
require(splines)
data(abalone)

#To measure shuckled weight, viscera weight and shell weigh, you would have to kill your abalone :(
abalone = abalone[,-6:-8] 
abalone[,1] = as.factor(abalone[,1])
#Separate data into training and test sets.
inTrain = createDataPartition(abalone$Type, p = 0.9, list = FALSE)
training = abalone[inTrain,]
testing = abalone[-inTrain,]

#set the seed for reproducibility
set.seed(132)
#I've tried several methods and boosting was the most efficient.
trControl = trainControl(method = "cv", number = 4, allowParallel =TRUE)
modFit = train(Type ~ ., method = "gbm", data = training,trControl = trControl, verbose = FALSE)

#This function is necessary to predict the sex based on the input.
createRow = function(x){
    t = matrix(rep(0),nrow = 1, ncol = 5)
    t[1,] = x
    t = as.data.frame(t)
    names(t) = names(abalone)[2:6]
    t
}