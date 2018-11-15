#load library and set seed
library(caret)
set.seed(998)

# define an 75%/25% train/test split of the dataset
inTraining <- createDataPartition(iris$Species, p = .75, list = FALSE)
training <- iris[inTraining,]
testing <- iris[-inTraining,]

#10 fold cross validation
fitControl <- trainControl(method = "repeatedcv", number = 10, repeats = 1)

system.time(
  rfFit1 <- train(Species~., data = training, method = "rf", trControl=fitControl)
)

#training results
rfFit1