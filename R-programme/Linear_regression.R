
```{r}
data=read.csv("insurance.csv")
data
```
```{r}
# Splitting the dataset into the Training set and Test set
install.packages('caTools')
library(caTools)
set.seed(123)
```

```{r}
split = sample.split(data$charges, SplitRatio = 2/3)
training_set = subset(data, split == TRUE)
test_set = subset(data, split == FALSE)
```
```{r}
# Fitting Simple Linear Regression to the Training set
regressor = lm(formula = charges ~ bmi,
data = training_set)
  
```

```{r}
# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)
```

```{r}
install.packages("ggplot2")
```

```{r}
# Visualising the Training set results
library(ggplot2)
ggplot() +
geom_point(aes(x = training_set$bmi,
              y = training_set$charges),
              colour = 'red') +
geom_line(aes(x = training_set$bmi,
              y = predict(regressor, newdata = training_set)),
              colour = 'blue') +
ggtitle('bmi vs charges (Training set)') +
xlab('bmi') +
ylab('charges')
```
```{r}
# Visualising the Test set results
library(ggplot2)
ggplot() +
geom_point(aes(x = test_set$bmi, y = test_set$charges),
colour = 'red') +
geom_line(aes(x = training_set$bmi,
              y = predict(regressor, newdata = training_set)),
colour = 'blue') +
ggtitle('Charges vs bmi (Test set)') +
xlab('bmi') +
ylab('charges')
```

