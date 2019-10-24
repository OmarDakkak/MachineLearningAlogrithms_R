# Polynomial Regression

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
# Fitting Linear Regression to the dataset
  lin_reg = lm(formula = Salary ~ .,
               data = dataset)
# Fitting Polynomial Regression to the dataset
  dataset$Level2 = dataset$Level^2;
  dataset$Level3 = dataset$Level^3;
  poly_reg = lm(formula = Salary ~ .,
                data = dataset)