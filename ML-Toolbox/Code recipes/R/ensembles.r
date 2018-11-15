#IMPORTING FILES

#From A Comma Delimited Text File
# first row contains variable names, comma is separator 
# assign the variable id to row names
# note the / instead of \ on mswindows systems 

mydata <- read.table("c:/mydata.csv", header=TRUE, 
  	sep=",", row.names="id")


#From Excel
# read in the first worksheet from the workbook myexcel.xlsx
# first row contains variable names
library(xlsx)
mydata <- read.xlsx("c:/myexcel.xlsx", 1)

# read in the worksheet named mysheet
mydata <- read.xlsx("c:/myexcel.xlsx", sheetName = "mysheet")


#From SPSS
# save SPSS dataset in trasport format
get file='c:\mydata.sav'.
export outfile='c:\mydata.por'. 

# in R 
library(Hmisc)
mydata <- spss.get("c:/mydata.por", use.value.labels=TRUE)
# last option converts value labels to R factors

#From SAS
# save SAS dataset in trasport format
libname out xport 'c:/mydata.xpt';
data out.mydata;
set sasuser.mydata;
run;

# in R 
library(Hmisc)
mydata <- sasxport.get("c:/mydata.xpt")
# character variables are converted to R factors

#Bagging CART
#Bootstrapped Aggregation (Bagging) is an ensemble method that creates multiple models of the same type from different sub-samples of the same dataset. 
#The predictions from each separate model are combined together to provide a superior result. 
#This approach has shown participially effective for high-variance methods such as decision trees.

#longley = dataset name
#employed = dependent (target) variable

# load the package
library(ipred)
# load data
data(longley)
# fit model
fit <- bagging(Employed~., data=longley, control=rpart.control(minsplit=5))
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley[,1:6])
# summarize accuracy
rmse <- mean((longley$Employed - predictions)^2)
print(rmse)

#Random Forest
#Random Forest is variation on Bagging of decision trees by reducing the attributes available to making a tree at each decision point to a random sub-sample. 
#This further increases the variance of the trees and more trees are required.

# load the package
library(randomForest)
# load data
data(longley)
# fit model
fit <- randomForest(Employed~., data=longley)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley[,1:6])
# summarize accuracy
rmse <- mean((longley$Employed - predictions)^2)
print(rmse)

#Gradient Boosted Machine
#Boosting is an ensemble method developed for classification for reducing bias where models are added to learn the misclassification errors in existing models. 
#It has been generalized and adapted in the form of Gradient Boosted Machines (GBM) for use with CART decision trees for classification and regression.
# load the package
library(gbm)
# load data
data(longley)
# fit model
fit <- gbm(Employed~., data=longley, distribution="gaussian")
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley)
# summarize accuracy
rmse <- mean((longley$Employed - predictions)^2)
print(rmse)

#Cubist
#Cubist decision trees are another ensemble method. 
#They are constructed like model trees but involve a boosting-like procedure called committees that re rule-like models.

# load the package
library(Cubist)
# load data
data(longley)
# fit model
fit <- cubist(longley[,1:6], longley[,7])
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley[,1:6])
# summarize accuracy
rmse <- mean((longley$Employed - predictions)^2)
print(rmse)