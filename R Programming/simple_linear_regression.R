# Simple Linear Regression

#Importing Dataset
dataset=read.csv("Salary_Data.csv")

#Splitting into Training & Test Set
library(caTools)
set.seed(123)
split=sample.split(dataset$Salary,SplitRatio = 2/3)
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)

#Fitting Simple Linear Regression to the training set
regressor=lm(formula= Salary ~ YearsExperience,
             data=training_set)



#Doing the same on the test set
y_pred=predict(regressor,newdata = test_set)

#Visualising Training Set
install.packages('ggplot')
library(ggplot2)
ggplot()+
  geom_point(aes(x=training_set$YearsExperience,y=training_set$Salary,colour='red'))+
  geom_line(aes(x=training_set$YearsExperience,y=predict(regressor,newdata=training_set),colour='blue'))+
  ggtitle("Salary Vs Experience (Training Set)")+
  xlab("Years of Experience")+
  ylab("Salary")

#Visualising Test Set
ggplot()+
  geom_point(aes(x=test_set$YearsExperience,y=test_set$Salary,colour='red'))+
  geom_line(aes(x=training_set$YearsExperience,y=predict(regressor,newdata = training_set),colour='blue'))+
  ggtitle("Salary vs Experience (Test Set)")+
  xlab("Years of Experience")+
  ylab("Salary")