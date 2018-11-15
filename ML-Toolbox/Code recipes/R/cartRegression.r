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


#Classification and Regression Trees
#Classification and Regression Trees (CART) split attributes based on values that minimize a loss function, such as sum of squared errors.
#longley = dataset name
#employed = dependent (target) variable

# load the package
library(rpart)
# load data
data(longley)
# fit model
fit <- rpart(Employed~., data=longley, control=rpart.control(minsplit=5))
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley[,1:6])
# summarize accuracy
rmse <- mean((longley$Employed - predictions)^2)
print(rmse)

#Conditional Decision Trees
#Condition Decision Trees are created using statistical tests to select split points on attributes rather than a loss function.
# load the package
library(party)
# load data
data(longley)
# fit model
fit <- ctree(Employed~., data=longley, controls=ctree_control(minsplit=2,minbucket=2,testtype="Univariate"))
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley[,1:6])
# summarize accuracy
rmse <- mean((longley$Employed - predictions)^2)
print(rmse)

#Model Trees
#Model Trees create a decision tree and use a linear model at each node to make a prediction rather than using an average value.
# load the package
library(RWeka)
# load data
data(longley)
# fit model
fit <- M5P(Employed~., data=longley)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley[,1:6])
# summarize accuracy
rmse <- mean((longley$Employed - predictions)^2)
print(rmse)

#Rule System
#Rule Systems can be crated by extracting and simplifying the rules from a decision tree.
# load the package
library(RWeka)
# load data
data(longley)
# fit model
fit <- M5Rules(Employed~., data=longley)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley[,1:6])
# summarize accuracy
rmse <- mean((longley$Employed - predictions)^2)
print(rmse)




