
library(tidyverse)
library(rstanarm)

fit <- lm(mpg ~ wt, data = mtcars)
summary(fit)

fit_bayes <- stan_glm(mpg ~ wt, data = mtcars)
fit_bayes

## New Weight
new_wt <- data.frame(wt = 3.3)

## Point Prediction
predict(fit, newdata = new_wt)
predict(fit_bayes, newdata = new_wt)

## Prediction with uncertainty
pred_uncertain <- posterior_linpred(fit_bayes, newdata = new_wt)
head(pred_uncertain)

hist(pred_uncertain)
mean(pred_uncertain)
sd(pred_uncertain)
quantile(pred_uncertain, probs = c(0.05, 0.50, 0.90))


## Predictive distribution for a new observation in the population
pred_dist <- posterior_predict(fit_bayes, newdata = new_wt)
head(pred_dist)

hist(pred_dist)
mean(pred_dist)
sd(pred_dist)
quantile(pred_dist, probs = c(0.05, 0.50, 0.90))

