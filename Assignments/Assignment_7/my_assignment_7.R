# Import Data

utah = read.csv("/Users/bryan/OneDrive/Documents/BIOL_3100/Data_Course_BRYANT/Assignments/Assignment_7/Utah_Religions_by_County.csv")
View(utah)

# Tidy up the data

library(tidyr)
library(dplyr)


utah_tidy <- utah %>%
  pivot_longer(
    cols = `Assemblies.of.God`:`Orthodox`, 
    names_to = "Religion", 
    values_to = "Proportion"
  ) %>%
  select(County, Pop_2010, Religious, Non.Religious, Religion, Proportion) %>%
  mutate(Proportion=Proportion*100)%>%
  rename(Percentage=Proportion)%>%
  filter(Percentage !=0)%>%
  mutate(Religious=Religious*100)%>%
  mutate(Non.Religious=Non.Religious*100)
View(utah_tidy) 
 
utah_tidy %>%
  mutate(County = gsub(" County", "", County))

utah_cleaned<-utah_tidy %>%
  mutate(County = if_else(str_ends(County, "County"),
                          str_remove(County, " County"),
                          County))
View(utah_cleaned)

#Explore the cleaned data set with a series of figures (Explore the data)
#Bar plot of county vs percentage of each religion per county
ggplot(utah_cleaned, aes(x = County, y = Percentage, fill = Religion)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = "Proportion of Religions Across Counties", x = "County", y = "Percentage") +
  theme_minimal()
## Bar plot showing religious vs non religious people per county
ggplot(data=utah_cleaned, aes(x = County)) +
  geom_bar(aes(y = Religious, fill = "Religious"), stat = "identity") +
  geom_bar(aes(y = Non.Religious, fill = "Non-Religious"), stat = "identity") +
  scale_fill_manual(values = c("Religious" = "orange", "Non-Religious" = "aquamarine4")) +
  labs(title = "Religious vs. Non-Religious Populations by County", x = "County", y = "Pop_2010") +
  theme_minimal()
#Pie plot showing the percentage of each religion in all of Utah
ggplot(utah_cleaned, aes(x = "", y = Percentage, fill = Religion)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y") +
  labs(title = "Religious Distribution", x = NULL, y = NULL) +
  theme_void() +
  scale_fill_brewer(palette = "Paired")
# Points representing population and the percentage of each religion
ggplot(utah_cleaned)+
  geom_point(aes(x=Pop_2010,y=Percentage, color=County), size=2)

#“Does population of a county correlate with the proportion of any specific religious group in that county?”
# Graph population and percentage but color by religion to see if there is a religion 
ggplot(utah_cleaned, aes(x = Pop_2010, y = Percentage, color=Religion)) +
  geom_point(alpha = 0.7) +
  labs(
    title = "Population vs Percent Religious",
    x = "Population (2010)",
    y = "Percent"
  ) +
  theme_minimal()
# It seems that the counties with smaller populations have higher percentage of LDS and Catholic. 
ggplot(utah_cleaned, aes(x = "", y = Percentage, fill = Religion)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y") +
  labs(title = "Religious Distribution", x = NULL, y = NULL) +
  theme_void() +
  scale_fill_brewer(palette = "Paired")


ggplot(data=utah_cleaned, aes(x = County)) +
  geom_bar(aes(y = Pop_2010), stat = "identity") +
  labs(title = "Religious vs. Non-Religious Populations by County", x = "County", y = "Pop_2010") +
  theme_minimal()

ggplot(utah_cleaned)+
  geom_point(aes(x=, y=Percentage, color=County))+
  geom_smooth(aes(x=Pop_2010, y=Percentage), method = "lm", color = "blue")+
  facet_wrap(~Religion)

## “Does proportion of any specific religion in a given county correlate with the proportion of non-religious people?”
ggplot(utah_cleaned)+
  geom_point(aes(x=Religion, y=Non.Religious))

utah_cleaned2 <- utah %>%
  select(County, LDS, Non.Religious)

ggplot(utah_cleaned2, aes(x =LDS, y = Non.Religious)) +
  geom_point(color = "blue", size = 3, alpha = 0.7) +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  theme_minimal()
ggplot(utah_cleaned2, aes(x =LDS, y = Non.Religious)) +
  geom_point(color = "blue", size = 3, alpha = 0.7) +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  theme_minimal()
# Higher LDS populations seem to correlate with higher non religious
