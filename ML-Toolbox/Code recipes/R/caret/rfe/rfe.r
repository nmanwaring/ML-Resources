library(readr)
votes <- read_csv("~/ML Toolbox/R Scripts/caret/rfe/house-votes-84.csv")
View(votes)
house_votes_84[rev_house_votes_84 == '?'] <- NA
is.na(votes)
cleaned_votes <- na.omit(house_votes_84)
View(cleaned_votes)

#load library and set seed
library(caret)
set.seed(998)

# define an 75%/25% train/test split of the dataset
inTraining <- createDataPartition(cleaned_votes$party, p = .75, list = FALSE)
training <- cleaned_votes[inTraining,]
testing <- cleaned_votes[-inTraining,]

# define the control using a random forest selection function
control <- rfeControl(functions=rfFuncs, method="cv", number=10)
# run the RFE algorithm
results <- rfe(clean_votes_features[1:16], clean_votes_dep_var[1], sizes=c(1:16), rfeControl=control)
# summarize the results
print(results)
# list the chosen features
predictors(results)
# plot the results
plot(results, type=c("g", "o"))