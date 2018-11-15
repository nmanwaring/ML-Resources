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

#Multivariate Adaptive Regression Splines
#Multivariate Adaptive Regression Splines (MARS) is a non-parametric regression method that models multiple nonlinearities in data using hinge functions (functions with a kink in them).
#longley = dataset name
#employed = dependent (target) variable
# load the package
library(earth)
# load data
data(longley)
# fit model
fit <- earth(Employed~., longley)
# summarize the fit
summary(fit)
# summarize the importance of input variables
evimp(fit)
# make predictions
predictions <- predict(fit, longley)
# summarize accuracy
rmse <- mean((longley$Employed - predictions)^2)
print(rmse)

#Support Vector Machine
#Support Vector Machines (SVM) are a class of methods, developed originally for classification, that find support points that best separate classes. SVM for regression is called Support Vector Regression (SVM).
#longley = dataset name
#employed = dependent (target) variable

# load the package
library(kernlab)
# load data
data(longley)
# fit model
fit <- ksvm(Employed~., longley)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley)
# summarize accuracy
rmse <- mean((longley$Employed - predictions)^2)
print(rmse)

#k-Nearest Neighbor Regression
#The k-Nearest Neighbor (kNN) does not create a model, instead it creates predictions from close data on-demand when a prediction is required. A similarity measure (such as Euclidean distance) is used to locate close data in order to make predictions.
#longley = dataset name
#employed = dependent (target) variable
#k = # of neighbors

# load the package
library(caret)
# load data
data(longley)
# fit model
fit <- knnreg(longley[,1:6], longley[,7], k=3)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley[,1:6])
# summarize accuracy
rmse <- mean((longley$Employed - predictions)^2)
print(rmse)

#Neural Network
#longley = dataset name
#employed = dependent (target) variable

library(nnet)
# load data
data(longley)
x <- longley[,1:6]
y <- longley[,7]
# fit model
fit <- nnet(Employed~., longley, size=12, maxit=500, linout=T, decay=0.01)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, x, type="raw")
# summarize accuracy
rmse <- mean((y - predictions)^2)
print(rmse)


#Support Vector Machine Regression
#Support Vector Machines (SVM) are a method that uses points in a transformed problem space that best separate classes into two groups. 
#Classification for multiple classes is supported by a one-vs-all method. 
#SVM also supports regression by modeling the function with a minimum amount of allowable error.

# load the package
library(kernlab)
# load data
data(longley)
# fit model
fit <- ksvm(Employed~., longley)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley)
# summarize accuracy
rmse <- mean((longley$Employed - predictions)^2)
print(rmse)