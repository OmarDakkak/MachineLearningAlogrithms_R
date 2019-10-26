# SVR

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Splitting the dataset into the training set and the test set

###install.packages('caTools')
# 
# library(caTools)
# set.seed(123)
# 
# split = sample.split(dataset$Purchased, SplitRatio = 0.8) # dataset$DependentVariable 
# 
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set[, 2:3] = scale(training_set[, 2:3])
# test_set[, 2:3] = scale(test_set[, 2:3])

# Fitting the SVR to the dataset
#install.packages('e1071')
library(e1071)
regressor = svm(formula = Salary ~ .,
                data = dataset,
                type = 'eps-regression')

# Predicting a new result     
y_pred = predict(regressor, data.frame(Level = 6.5))

# Visualising the SVR results
#install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x= dataset$Level, y=dataset$Salary),
             color = 'red') +
  geom_line(aes(x= dataset$Level, y= predict(regressor, newdata = dataset)),
            color = 'green') +
  ggtitle('Truth or bluff (SVR)') + 
  xlab('Level') +
  ylab('Salary')