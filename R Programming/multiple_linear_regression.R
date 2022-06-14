# Multiple Linear Regression


#Data Preprocessing

#Importing Dataset
dataset=read.csv("50_Startups.csv")

#Encoding The Categorical Variable
dataset$State=factor(dataset$State,
                     levels=c('New York','California','Florida'),
                     labels=c(1,2,3))


#Splitting the Dataset into Training & Test Set
library(caTools)
set.seed(123)
split=sample.split(dataset$Profit,SplitRatio=0.8)
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)


#Fitting the Multiple Linear Model into the dataset
regressor=lm(formula=Profit~.,data=training_set)

#Predicting the results
y_pred=predict(regressor,newdata = test_set)

#Building an optimal model using Backward Elimination
regressor=lm(formula=Profit ~ R.D.Spend+Marketing.Spend,
             data=dataset)
