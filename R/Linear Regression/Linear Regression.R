#Simple Linear Regression
dataset = read.csv('Salary_Data.csv')

#Splitting Dataset to Training and Test
#install.package()
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary,SplitRatio = 2/3)
training_set = subset(dataset,split == TRUE)
test_set = subset(dataset,split == FALSE)


regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

# Predecting the Test Set
y_pred = predict(regressor,newdata = test_set)
# install.packages('ggplot2')

#Visualizing

library(ggplot2)
ggplot() + 
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'red') + 
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor,newdata = training_set)), 
            colour='blue') + 
  ggtitle('Salary vs Experinence (Training Set)') + 
  xlab('Years of Expeience') + 
  ylab('Salary')

ggplot() + 
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') + 
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor,newdata = training_set)), 
            colour='blue') + 
  ggtitle('Salary vs Experinence (Test Set)') + 
  xlab('Years of Expeience') + 
  ylab('Salary')
  