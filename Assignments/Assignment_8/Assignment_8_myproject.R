#Write a script that:
  #1. loads the “/Data/mushroom_growth.csv” data set

mush<-read.csv("C:/Users/bryan/OneDrive/Documents/BIOL_3100/Data_Course_BRYANT/Data/mushroom_growth.csv")
View(mush)

#2. creates several plots exploring relationships between the response and predictors
library (ggplot2)
  

mush1<-ggplot()+
  geom_point(data=mush, aes(x=Light, y=GrowthRate))+
  geom_smooth(data = mush, aes(x = Light, y = GrowthRate), method = "loess", color = "red")+
  facet_wrap(~Species)
print(mush1)

mush_1<-ggplot()+
  geom_point(data=mush, aes(x=Light, y=GrowthRate))+
  geom_smooth(data = mush, aes(x = Light, y = GrowthRate), method = "loess", color = "red")+
  facet_wrap(~Humidity)
print(mush_1)

mush2<-ggplot(mush, aes(x = Light, y = GrowthRate)) +
  geom_boxplot()+
  facet_wrap(~Species)
print(mush2)

mush3<-ggplot(mush, aes(x = Nitrogen, y = GrowthRate)) +
  geom_point()+
  geom_smooth(data = mush, aes(x = Nitrogen, y = GrowthRate), method = "loess", color = "red") +
  facet_wrap(~Species)
print(mush3)

mush_3<-ggplot(mush, aes(x = Nitrogen, y = GrowthRate)) +
  geom_point()+
  geom_smooth(data = mush, aes(x = Nitrogen, y = GrowthRate), method = "loess", color = "red") +
  facet_wrap(~Humidity)
print(mush_3)

mush4<-ggplot(mush, aes(x = GrowthRate, y = Temperature)) +
  geom_point()+
  geom_smooth(data = mush, aes(x = GrowthRate, y = Temperature), method = "loess", color = "red")
print(mush4)
  
mush5<-ggplot(mush, aes(x = Humidity, y = GrowthRate)) +
  geom_boxplot() +
  ggtitle("Growth Rate vs Humidity")
print(mush5)

mush6<-ggplot(mush, aes(x = Light, y = GrowthRate, color = Species)) +
  geom_point() +
  facet_wrap(~ Species) +
  ggtitle("Growth Rate vs Light by Species")


#3. defines at least 4 models that explain the dependent variable “GrowthRate”

mush_model1 <- lm(GrowthRate ~ Light, data = mush)
summary(mush_model1)

mush_model2 <- lm(GrowthRate ~ Light + Nitrogen + Temperature, data = mush)
summary(mush_model2)

mush_model3<-lm(GrowthRate ~ Temperature + Nitrogen, data = mush)
summary(mush_model3)

mush_model4<- lm(GrowthRate ~ Temperature+Light, data=mush)
summary(mush_model4)

mush_model5 <- lm(GrowthRate ~ Light * Humidity, data = mush)
summary(mush_model5)

mush_model6 <- lm(GrowthRate ~ Light + Nitrogen + Temperature + Humidity + 
               Light:Humidity + Nitrogen:Temperature, data = mush)
summary(mush_model6)


#4calculates the mean sq. error of each model

mse_model1 <- mean(residuals(mush_model1)^2)
cat("MSE for Model 1:", mse_model1, "\n")

mse_model2 <- mean(residuals(mush_model2)^2)
cat("MSE for Model 1:", mse_model2, "\n")

mse_model3 <- mean(residuals(mush_model3)^2)
cat("MSE for Model 1:", mse_model3, "\n")

mse_model4 <- mean(residuals(mush_model4)^2)
cat("MSE for Model 1:", mse_model4, "\n")

mse_model5 <- mean(residuals(mush_model5)^2)
cat("MSE for Model 1:", mse_model5, "\n")

mse_model6 <- mean(residuals(mush_model6)^2)
cat("MSE for Model 1:", mse_model6, "\n")

#5 selects the best model you tried

### The best model is model 6 because it has the lowest mean square error and accounts for the most variables. 


#6adds predictions based on new hypothetical values for the independent variables used in your model

mush_new <- data.frame(
  Light = c(5, 15, 25),    
  Humidity = c("Low", "Low", "Low"),
  Nitrogen = c(0,10,20),
  Temperature = c(20,20,20))

mush_pred <- predict(mush_model6, newdata = mush_new)


mush_new$Predicted_GrowthRate <- mush_pred

print(mush_new)

#7 plots these predictions alongside the real data
mush_combined<-mush
mush_combined$Predicted_GrowthRate<-predict(mush_model6, newdata=mush_combined)
View(mush_combined)


plot_combined<-ggplot(mush_combined, aes(x = Predicted_GrowthRate, y = GrowthRate)) +
  geom_point() +
  geom_smooth(data = mush_combined, aes(x = Predicted_GrowthRate, y = GrowthRate), method = "loess", color = "red")+
  labs(
    title = "Predicted vs Actual Growth Rate",
    x = "Predicted",
    y = "Actual Growth Rate")
  
print(plot_combined)

#Upload responses to the following as a numbered plaintext document to Canvas:
  #1. Are any of your predicted response values from your best model scientifically meaningless? Explain.
## Based on the summary statistics of the best model (model6), nitrogen was found to be statistically meaningless because the p-value in the summary
#table was greater than 0.05 which is considered insignificant. 

  #2. In your plots, did you find any non-linear relationships? Do a bit of research online and give a link to at least one resource explaining how to deal with modeling non-linear relationships in R.
# It appears that temperature and nitrogen exhibit non-linear relationships. The following websites provide information to help handle these non-linear relationships:
#https://www.geeksforgeeks.org/non-linear-regression-in-r/
#https://tuos-bio-data-skills.github.io/intro-stats-book/non-linear-regression-in-R.html
#https://www.econometrics-with-r.org/8.1-a-general-strategy-for-modelling-nonlinear-regression-functions.html

  #3. Write the code you would use to model the data found in “/Data/non_linear_relationship.csv” with a linear model (there are a few ways of doing this)
non_lin<-read.csv("C:/Users/bryan/OneDrive/Documents/BIOL_3100/Data_Course_BRYANT/Data/non_linear_relationship.csv")
View(non_lin)


ggplot(non_lin, aes(x = predictor, y = response)) +
  geom_point() +
  geom_smooth(method = "loess", color = "red", se = TRUE)

#model
poly_model <- lm(response ~ poly(predictor, 2), data = data)
summary(poly_model)

quad_mod<-lm(response ~ poly(predictor, 2), data=non_lin)
summary(quad_mod)

mse_quad <- mean(residuals(quad_mod)^2)
cat("MSE for Model:", mse_quad, "\n")