#caret model - Automatic Tuning Grid
#http://topepo.github.io/caret/bytag.html
#model training: http://topepo.github.io/caret/training.html
#model measurement: http://topepo.github.io/caret/other.html
#dataframe = WholeYear
#Y Value = SolarRad

#load library and set seed
library(caret)
set.seed(998)

#create a 20% sample of the data
WholeYear <- WholeYear[sample(1:nrow(WholeYear), 7000,replace=FALSE),]

# define an 75%/25% train/test split of the dataset
inTraining <- createDataPartition(ghi_data$GHI, p = .75, list = FALSE)
training <- ghi_data[inTraining,]
testing <- ghi_data[-inTraining,]

#10 fold cross validation
fitControl <- trainControl(method = "repeatedcv", number = 10, repeats = 1)

#train Random Forest Regression model with a tuneLenght = 1 (trains with 1 mtry value for RandomForest)
knnFit1 <- train(GHI~., data = training, method = "knn", trControl=fitControl)

#training results
knnFit1
