# Regression Template

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

# Fitting the Regression Model to the dataset
# Create your regressor here


# Predicting a new result     
y_pred = predict(poly_reg, data.frame(Level = 6.5))

# Visualising the Regression Model results
#install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x= dataset$Level, y=dataset$Salary),
             color = 'red') +
  geom_line(aes(x= dataset$Level, y= predict(poly_reg, newdata = dataset)),
            color = 'green') +
  ggtitle('Truth or bluff (Regression Model)') +
  xlab('Level') +
  ylab('Salary')

# Visualising the Regression Model results (for higher resolution and smoother curve)
#install.packages('ggplot2')
library(ggplot2)
x_grid = seq(min(dataset$Level, max(dataset$Level), 0.1))
ggplot() +
  geom_point(aes(x= dataset$Level, y=dataset$Salary),
             color = 'red') +
  geom_line(aes(x= x_grid, y= predict(poly_reg, newdata = data.frame(Level = x_grid))),
            color = 'green') +
  ggtitle('Truth or bluff (Regression Model)') +
  xlab('Level') +
  ylab('Salary')


