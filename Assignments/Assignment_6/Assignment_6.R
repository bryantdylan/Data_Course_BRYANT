# Assignment 6

library(tidyverse)
data_6<-read.csv("/Users/bryan/OneDrive/Documents/BIOL_3100/Data_Course_BRYANT/Assignments/Assignment_6/BioLog_Plate_Data.csv")

#1. Clean this data into tidy (long) form
View(data_6)

data_6_long <- pivot_longer(
  data_6,
  cols = starts_with("Hr_"),
  names_to = "Time",   
  values_to = "Absorbance"
)
View(data_6_long)

data_6_long$Time <- as.numeric(gsub("Hr_", "", data_6_long$Time))
View(data_6_long)

# 2. Create a new colum specifying whether a sample is from soil or water.

data_new_column <- data_6_long %>%
  mutate(Sample_Type = ifelse(grepl("Water", Sample.ID, ignore.case = TRUE), "water", "soil"))
View(data_new_column)

# 3. Generate a plot

filtered <- data_new_column %>%
  filter(Dilution == 0.1)
View(filtered)

ggplot(filtered,aes(x=Time, y=Absorbance, color=Sample_Type, group=Sample_Type))+
  geom_smooth(method = "loess", se = FALSE)+
  facet_wrap(~Substrate)+
  labs(x = "Time (hours)", y = "Absorbance", title = "Absorbance over Time when Dilution is 0.1")

# 4. Generate animated plot

Itaconic_acid <- data_new_column %>%
  filter(Substrate=="Itaconic Acid")
View(Itaconic_acid)

mean_absorbance <- Itaconic_acid %>%
  group_by(Time, Dilution, Sample.ID)%>%
  summarize(Mean_Absorbance = mean(Absorbance, na.rm = TRUE))%>%
  ungroup()
View(mean_absorbance)

library(gganimate)

animated_plot <- ggplot(mean_absorbance, aes(x = Time, y = Mean_Absorbance, color = Sample.ID, group = Sample.ID)) +
  geom_line() +
  labs(x = "Time (hours)", y = "Mean Absorbance", title = "Mean Absorbance for Itaconic Acid over Time by Dilution") +
  facet_wrap(~ Dilution)+
  transition_reveal(Time)

# Render the animation
animate(animated_plot, nframes = 100, fps = 10, width = 800, height = 600)
