############  AIC Model Comparison with stepAIC
# The function below will take output from stepAIC and create a data frame with AIC values, differences between models, likelihood of models, and model weights for inferring the "best" subset of models (based on 95% confidence).
# Author: Matt Barbour
# Date: October 14, 2013

stepAIC_comparison <- function(stepAIC_model) {
  stepAIC_models <- as.character(stepAIC_model$anova$Step) # converts to character
  stepAIC_models[1] <- "null model (+ 1)" # inputs null model formula
  AIC_values <- stepAIC_model$anova$AIC
  delta <- AIC_values - min(AIC_values) # calculate AIC difference between models
  likelihood <- round(exp(-0.5*delta),3) # calculate likelihood of each model
  weights <- round(likelihood/sum(likelihood),3) # calculate the weight of each model
  cbind.data.frame(stepAIC_models, AIC_values, delta, likelihood, weights)
}
