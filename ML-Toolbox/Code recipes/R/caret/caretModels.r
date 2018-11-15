#caret models
#http://topepo.github.io/caret/bytag.html
#model training: http://topepo.github.io/caret/training.html
#model measurement: http://topepo.github.io/caret/other.html
#dataframe = WholeYear
#Y Value = TotalSolarRad

set.seed(998) 
#define an 75%/25% train/test split of the dataset
inTraining <- createDataPartition(WholeYear$TotalSolarRad, p = .75, list = FALSE)

training <- WholeYear[inTraining,]

testing <- WholeYear[-inTraining,]
#Build a linear regression model


fitControl <- trainControl(method = "repeatedcv", number = 10, repeats = 10)





RFFit1 <- train(TotalSolarRad~., data = training, method = "lm", trControl = fitControl)




#predicitor variables
predictors(LMFit1)
#make predictions
testPredLM1 <- predict(LMFit1, testing)
#performace measurment
postResample(testPredLM1, testing$SolarRad)
#plot predicited verses actual
plot(testPredLM1,testing$TotalSolarRad)


























#RFE
#AllDayFeatures = df
#AllDayAllFeatures[,1:19] = X values
#AllDayAllFeatures[,20] = Y 
# define an 75%/25% train/test split of the dataset
inTraining <- createDataPartition(WholeYear$TotalSolarRad, p = .75, list = FALSE)
training <- WholeYear[inTraining,]
testing <- WholeYear[-inTraining,]

control <- rfeControl(functions = lmFuncs, method = "cv", number = 10)
lmrfeResults <- rfe(training[,1:19], training[,20], sizes = (1:19), rfeControl=control)
#apply model to test set
newpredictions<-predict(lmrfeResults,AllDayAllFeatures[,1:19])
plot(lmrfeResultsPred, AllDayAllFeatures[,20])




How does one code calculation specifications, using free-format operation codes and expressions, for
assignment of numeric, character, and logical values;
arithmetic operations;
logic operations; and
string handling operations?

The “region” column indicates in which of the four regions the purchase was made (1 = East, 2 = West, 3 = South, 4 = Central).




6000 * 12 = 72000
150




















# Use hollow circles
# Add linear regression line  
# (by default includes 95% confidence region)
#dat = dataset
ggplot(dat, aes(x=testing$TotalSolarRad, y=testPredLM1)) + geom_point(shape=1) + geom_smooth(method=lm) +ggtitle("Actual vs Predicted") + labs(x="Actual",y="Predicited") 
                            

#rfe feature selection
#There must be no 1:1 correlating vars in the Xs
#Xvars = Dataframe of predictors
#Yvar = Vector containing dependent var
rferesults <- rfe(Xvars, Yvar, sizes=c(1:31), rfeControl=control

#plot for Rsquared
plot(rferesults, type = c("g","o"), metric = "Rsquared")
#plot for RMSE
plot(rferesults, type = c("g","o"))

Can recursive feature elimination outperform traditional machine learning algorithms when predicting solar radiation