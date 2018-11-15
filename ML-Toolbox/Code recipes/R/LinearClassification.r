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


#Logistic Regression
#Logistic Regression is a classification method that models the probability of an observation belonging to one of two classes. 
#As such, normally logistic regression is demonstrated with binary classification problem (2 classes). 
#Logistic Regression can also be used on problems with more than two classes (multinomial), as in this case.

#iris = dataset
#Species = target variable

# load the package
library(VGAM)
# load data
data(iris)
# fit model
fit <- vglm(Species~., family=multinomial, data=iris)
# summarize the fit
summary(fit)
# make predictions
probabilities <- predict(fit, iris[,1:4], type="response")
predictions <- apply(probabilities, 1, which.max)
predictions[which(predictions=="1")] <- levels(iris$Species)[1]
predictions[which(predictions=="2")] <- levels(iris$Species)[2]
predictions[which(predictions=="3")] <- levels(iris$Species)[3]
# summarize accuracy
table(predictions, iris$Species)

#Linear Discriminant Analysis
#LDA is a classification method that finds a linear combination of data attributes that best separate the data into classes.
# load the package
library(MASS)
data(iris)
# fit model
fit <- lda(Species~., data=iris)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4])$class
# summarize accuracy
table(predictions, iris$Species)

#Partial Least Squares Discriminant Analysis
#Partial Least Squares Discriminate Analysis is the application of LDA on a dimension-reducing projection of the input data (partial least squares).

# load the package
library(caret)
data(iris)
x <- iris[,1:4]
y <- iris[,5]
# fit model
fit <- plsda(x, y, probMethod="Bayes")
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4])
# summarize accuracy
table(predictions, iris$Species)

#Support Vector Machine
#Support Vector Machines (SVM) are a method that uses points in a transformed problem space that best separate classes into two groups. 
#Classification for multiple classes is supported by a one-vs-all method. 
#SVM also supports regression by modeling the function with a minimum amount of allowable error.

#iris = dataset name
#Species = dependent (target) variable

# load the package
library(kernlab)
data(iris)
# fit model
fit <- ksvm(Species~., data=iris)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4], type="response")
# summarize accuracy
table(predictions, iris$Species)

#k-Nearest Neighbors
#The k-Nearest Neighbor (kNN) method makes predictions by locating similar cases to a given data instance (using a similarity function) and returning the average or majority of the most similar data instances.
# load the package
library(caret)
data(iris)
# fit model
fit <- knn3(Species~., data=iris, k=5)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4], type="class")
# summarize accuracy
table(predictions, iris$Species)

#Naive Bayes
#Naive Bayes uses Bayes Theorem to model the conditional relationship of each attribute to the class variable
# load the package
library(e1071)
data(iris)
# fit model
fit <- naiveBayes(Species~., data=iris)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4])
# summarize accuracy
table(predictions, iris$Species)