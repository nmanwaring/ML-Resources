
#summer2003 = dataframe

#divide dataset into parts 70% for training and 30% for testing
trainSize <- round(nrow(Summer2003)*0.7)
testSize <- nrow(Summer2003) - trainSize
# reorder
set.seed(123)
training_indices <-sample(seq_len(nrow(Summer2003)),size = trainSize)
#build test and train sets
trainSet <- Summer2003[training_indices,]
testSet <- Summer2003[-training_indices,]
#trained the model
lmmodel <- lm(formula = trainSet$TotalSolarRad ~.,data = trainSet)
#model summary
summary(lmmodel)
#made predictions with the trained linear model
lmpred <- predict(lmmodel, testSet, interval = "predict", level=.95)

