# Data Preprocessing 

# Importing the dataset
dataset = read.csv('Data.csv')

# Taking care of the missing data

dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)
dataset$Salary = ifelse(is.na(dataset$Salary),
                        ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                        dataset$Salary)
# is.na() is a function that tells if the value in the function is missing or not
# so by putting is.na(dataset$Age) we are checking to see is all the values 
# in the column Age are missing so it will return true is the value in the column 
# Age is missing and false is the value in the column Age is not missing

# Encoding Categorical data 

dataset$Country = factor(dataset$Country,
                         levels = c('France', 'Spain', 'Germany'),
                         labels = c(1, 2, 3))

dataset$Purchased = factor(dataset$Purchased,
                           levels = c('Yes', 'No'),
                           labels = c(1, 0))
  

# Splitting the dataset into the training set and the test set

###install.packages('caTools')

library(caTools)
set.seed(123)

split = sample.split(dataset$Purchased, SplitRatio = 0.8)

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
 
#Feature Scaling

training_set[, 2:3] = scale(training_set[, 2:3])
test_set[, 2:3] = scale(test_set[, 2:3])
## Column 1 and 4 are not numeric numbers they are just factors that's why
## we ommitted them and restricted to the [, 2:3] 2nd and 3rd colums!!





  
  