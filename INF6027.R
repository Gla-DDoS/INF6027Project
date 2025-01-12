library(tidyverse)
library(MASS)
#load relevant dataset
team_stats <- read.csv("team_stats.csv")
#Check the dataset for missing value
summary(team_stats)
sum(is.na(team_stats))
#Split model into training and testing data
nrow(team_stats)
stats_train <- team_stats[1:80,]
stats_test <- team_stats[81:100,]
summary(stats_train)
summary(stats_test)
#Visualisation methods (Scatter plots)
ggplot(
  data=stats_train,
  aes(x=Attempts.on.target, y=Goals)
) + geom_point()
ggplot(
  data=stats_train,
  aes(x=Ball.Possession, y=Goals)
) + geom_point()
ggplot(
  data=stats_train,
  aes(x=Passes.accuracy, y=Goals)
) + geom_point()
#Correlation test of independence variables
cor.test(
  stats_train$Attempts.on.target,
  stats_train$Goals
)
cor.test(
  stats_train$Passes.accuracy,
  stats_train$Goals
)
cor.test(
  stats_train$Ball.Possession,
  stats_train$Goals
)
#Linear regression test for attempts on target
mod_Attempts_on_target <- lm(
  formula = Goals~Attempts.on.target,
  data = stats_train
)
summary(mod_Attempts_on_target)
#Inspect regression model
coef(mod_Attempts_on_target)
coefs_Attempts_on_target <- coef(mod_Attempts_on_target)
ggplot(
  data = stats_train,
  aes(x=Attempts.on.target, y=Goals)
) +
  geom_point() +
  geom_abline(mapping = aes(
    slope = 0.3390560,
    intercept = 0.1037546
  ), colour='red' )
#Calculate predicted values
train_resid <- stats_train
train_resid$predicted <- predict(mod_Attempts_on_target)
train_resid$residuals <- residuals(mod_Attempts_on_target)
train_resid[1:20,]
ggplot(
  data=train_resid,
  aes(x=Attempts.on.target,y=Goals)
) +
  geom_point(size=3) + # make the actual values show up more clearly
  geom_point(size=2, aes(y=predicted), shape=1) + # show the predicted values
  geom_segment(aes(xend=Attempts.on.target, yend=predicted), alpha=0.9, color='red') +
  geom_abline(mapping=aes(
    slope=0.3390560,
    intercept=0.1037546
  ), color='blue')
plot(
  mod_Attempts_on_target,
  which = 1
)

#make a copy of the test data to leave the original unaltered
stats_attempt_test <- stats_test
stats_attempt_test$predicted <- predict(mod_Attempts_on_target, newdata = stats_attempt_test)
stats_attempt_test$residuals <- stats_attempt_test$predicted - stats_attempt_test$Goals
#Remove unneeded variables for this result
stats_attempt_test <- stats_attempt_test[, -c(5,6)]
#Show the accuracy of the model's prediction  results
stats_attempt_test
predict(
  mod_Attempts_on_target,
  newdata = stats_test,
  interval = 'confidence'
)



#Linear regression test for ball possession
mod_ball_possession <- lm(
  formula = Goals~Ball.Possession,
  data = stats_train
)
summary(mod_ball_possession)
#Inspect regression model
coef(mod_ball_possession)
coefs_ball_possession <- coef(mod_ball_possession)
ggplot(
  data = stats_train,
  aes(x=Ball.Possession, y=Goals)
) +
  geom_point() +
  geom_abline(mapping = aes(
    slope =0.0270497,
    intercept = 0.0100152
  ), colour='red' )
#Calculate predicted values
train_resid <- stats_train
train_resid$predicted <- predict(mod_ball_possession)
train_resid$residuals <- residuals(mod_ball_possession)
train_resid[1:20,]
ggplot(
  data=train_resid,
  aes(x=Ball.Possession,y=Goals)
) +
  geom_point(size=3) + # make the actual values show up more clearly
  geom_point(size=2, aes(y=predicted), shape=1) + # show the predicted values
  geom_segment(aes(xend=Ball.Possession, yend=predicted), alpha=0.9, color='red') +
  geom_abline(mapping=aes(
    slope=0.0270497,
    intercept=0.0100152
  ), color='gray')
plot(
  mod_ball_possession,
  which = 1
)
predict(
  mod_ball_possession,
  newdata = stats_test,
  interval = 'confidence'
)
#make a copy of the test data to leave the original unaltered
stats_attempt_test <- stats_test
stats_attempt_test$predicted <- predict(mod_Attempts_on_target, newdata = stats_attempt_test)
stats_attempt_test$residuals <- stats_attempt_test$predicted - stats_attempt_test$Goals
#Remove unneeded variables for this result
stats_attempt_test <- stats_attempt_test[, -c(5,6)]
#Show the accuracy of the model's prediction  results
stats_attempt_test


#Linear regression test for passes accuracy
mod_pass_accu <- lm(
  formula = Goals~Passes.accuracy,
  data = stats_train
)
summary(mod_pass_accu)
#Inspect regression model
coef(mod_pass_accu)
coefs_pass_accu <- coef(mod_pass_accu)
ggplot(
  data = stats_train,
  aes(x=Passes.accuracy, y=Goals)
) +
  geom_point() +
  geom_abline(mapping = aes(
    slope = 0.03884638,
    intercept =-1.85883638
  , colour='red') )
#Calculate predicted values
train_resid <- stats_train
train_resid$predicted <- predict(mod_pass_accu)
train_resid$residuals <- residuals(mod_pass_accu)
train_resid[1:20,]
ggplot(
  data=train_resid,
  aes(x=Passes.accuracy,y=Goals)
) +
  geom_point(size=3) +        # make the actual values show up more clearly
  geom_point(size=2, aes(y=predicted), shape=1) + # show the predicted values
  geom_segment(aes(xend=Passes.accuracy, yend=predicted), alpha=0.9, color='red') +
  geom_abline(mapping=aes(
    slope=0.03884638,
    intercept=-1.85883638
  ), color='blue')
  
plot(
  mod_pass_accu,
  which = 1
)
predict(
  mod_pass_accu,
  newdata = stats_test,
  interval = 'confidence'
)
#make a copy of the test data to leave the original unaltered
stats_attempt_test <- stats_test
stats_attempt_test$predicted <- predict(mod_Attempts_on_target, newdata = stats_attempt_test)
stats_attempt_test$residuals <- stats_attempt_test$predicted - stats_attempt_test$Goals
#Remove unneeded variables for this result
stats_attempt_test <- stats_attempt_test[, -c(5,6)]
#Show the accuracy of the model's prediction  results
stats_attempt_test
