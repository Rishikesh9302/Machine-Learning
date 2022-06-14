# SVR

#Importing Dataset
dataset=read.csv("Position_Salaries.csv")
dataset=dataset[2:3]

install.packages('e1071')
library(e1071)

#Fitting SVR to the dataset
regressor=svm(formula= Salary~.,
              data=dataset,
              type='eps-regression')

#Predicting A New Salary
y_pred=predict(regressor,data.frame(Level=6.5))

#Visualising the SVR

library(ggplot2)
ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary),
             colour='red')+
  geom_line(aes(x=dataset$Level,y=predict(regressor,newdata=dataset)),
            colour='blue')+
  xlab('Level')+
  ylab("Salary")