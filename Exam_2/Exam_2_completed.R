# 1. Read in the Unicef data
library(tidyverse)

unicef<-read_csv("/Users/bryan/OneDrive/Documents/BIOL_3100/Data_Course_BRYANT/BIOL3100_Exams/Exam_2/unicef-u5mr.csv")
View(unicef)

# 2. Get it into tidy format

 unicef_df<- unicef %>%
  pivot_longer(cols = starts_with("U5MR"), 
               names_to = "Year", 
               names_prefix = "U5MR.",
               values_to = "U5MR",
               values_drop_na = TRUE)
View(unicef_df) 

#3 Plot each country's 

unicef_df$Year <- as.integer(unicef_df$Year)
ggplot(unicef_df)+
  geom_line(aes(x=Year, y=U5MR, group=CountryName))+
  scale_x_continuous(breaks=c(1960,1980,2000))+
  labs(x="Year", y="U5MR")+
  facet_wrap(~Continent)

# 4. Save this plot as LASTNAME_Plot_1.png
ggsave("BRYANT_Plot_1.png", width=8, height=6, dpi=300)

#5 Create another plot that shows the mean U5MR for all the countries within a given continent at each year

mean_U5MR<- unicef_df %>%
  group_by(Year, Continent) %>%
  summarize(Mean_U5MR= mean(U5MR, na.rm=TRUE)) %>%
  ungroup()
View(mean_U5MR)

ggplot(mean_U5MR)+
  geom_line(aes(x=Year, y=Mean_U5MR, color=Continent, group=Continent, size=0.5))+
  labs(x="Year",y="Mean U5MR", title="U5MR per Continent over time")
#6 Save the plot as LASTNAME_Plot_2.png
ggsave("BRYANT_Plot_2.png", width=8, height=6, dpi=300)

#7 Create three models of U5MR 
  # mod1 should account for only Year
  # mod2 should account for Year and Continent
  # mod3 should account for Year, Continent, and their interaction term

View(unicef_df)

mod1<-lm(U5MR~Year, data=unicef_df)
summary(mod1)

mod2<- lm(U5MR~Year + Continent, data=unicef_df)
summary(mod2)

mod3<- lm(U5MR~Year*Continent, data=unicef_df)
summary(mod3)

#8 Compare the three models with respect to their performance

#Your code should do the comparing
#Include a comment line explaining which of these three models you think is best

mod_compare<- data.frame(
  Model=c("Mod1", "Mod2", "Mod3"),
  R_squared=c(summary(mod1)$r.squared, summary(mod2)$r.squared,summary(mod3)$r.squared),
  AIC=c(AIC(mod1),AIC(mod2),AIC(mod3)),
  BIC=c(BIC(mod1),BIC(mod2),BIC(mod3)))

print(mod_compare)
View(mod_compare)

### Based on the higher r squared values and the lowest AIC and BIC values, the best model is model 3.


# Plot the 3 models’ predictions
unicef_df$pred_mod1 <- predict(mod1, newdata = unicef_df)
unicef_df$pred_mod2 <- predict(mod2, newdata = unicef_df)
unicef_df$pred_mod3 <- predict(mod3, newdata = unicef_df)

View(predict_clean)

predict_clean <- unicef_df %>%
  pivot_longer(cols = starts_with("pred_mod"), 
               names_to = "Model", 
               values_to = "Predicted_U5MR") %>%
  mutate(Model = recode(Model,
                        "pred_mod1" = "Model 1",
                        "pred_mod2" = "Model 2",
                        "pred_mod3" = "Model 3"))

ggplot(predict_clean, aes(x = Year, y = Predicted_U5MR)) +
  geom_line(aes(color = Continent)) +
  facet_wrap(~Model) +
  labs(title = "Modeled Predictions of U5MR Over Time",
       x = "Year", y = "Predicted U5MR") +
  theme_minimal()

ggsave("BRYANT_Plot_3.png", width=8, height=6, dpi=300)

# 10 Bonus: Using your preferred model, predict what the U5MR would be for Ecuador in the
#year 2020. The real value for Ecuador for 2020 was 13 under-5 deaths per 1000 lives births.
# How far off was your model prediction

ecuador_2020 <- data.frame(Year = 2020, CountryName = "Ecuador", Continent = "Americas")

ecuador_2020$predicted_U5MR <- predict(mod1, newdata = ecuador_2020)
ecuador_2020$predicted_U5MR <- predict(mod2, newdata = ecuador_2020)
ecuador_2020$predicted_U5MR <- predict(mod3, newdata = ecuador_2020)
#I choose mod3
difference <- abs(ecuador_2020$predicted_U5MR - 13)
print(difference)

# Create any model of your choosing....
View(unicef_df)
mod4<- lm(U5MR~Year+Continent + CountryName, data=unicef_df)
summary(mod4)

ecuador_2020$predicted_U5MR <- predict(mod4, newdata = ecuador_2020)
difference <- abs(ecuador_2020$predicted_U5MR - 13)
print(difference)
