# Data visualisation with ggplot2
# Tengku Muhammad Hanis Mokhtar
# September 19, 2023
# Ref: https://bookdown.org/drki_musa/dataanalysis/exploratory-data-analysis-eda.html#eda-with-plots


# Packages ----------------------------------------------------------------

library(tidyverse)
library(mlbench)


# Data --------------------------------------------------------------------

data("PimaIndiansDiabetes2")
?PimaIndiansDiabetes2

skimr::skim(PimaIndiansDiabetes2)


# Visualisation -----------------------------------------------------------

# Basic plot
ggplot() + #data
  geom_point() + #type of plot we want
  labs() + #other element: title
  theme() #other element: theme of plot


## 1. One variable - cat ----

ggplot(data = PimaIndiansDiabetes2, mapping = aes(x = diabetes)) +
  geom_bar()

# Further customise: bar plot
bar_plot <- 
  ggplot(data = PimaIndiansDiabetes2, mapping = aes(x = diabetes)) +
  geom_bar(alpha = 0.3, fill = "navyblue", linetype = 1.5, color = "darkblue") 
bar_plot

# Further customise: axis label
bar_plot2 <- 
  bar_plot +
  xlab("Diabetic patients") +
  ylab("Number of patients")
bar_plot2

# Further customise: title and related elements
bar_plot3 <- 
  bar_plot2 +
  labs(title = "Distribution of diabetic people in the data", 
       subtitle = "(Updated version of the data)",
       caption = "Data owner: National Institute of Diabetes and Digestive and Kidney Diseases")  
bar_plot3

# Further customise: theme
bar_plot4 <- 
  bar_plot3 +
  theme_minimal()
bar_plot4  

# Further customise: edit name of group (advanced!)
PimaIndiansDiabetes2 %>% 
  mutate(diabetes = fct_recode(diabetes, Negative = "neg", Positive = "pos")) %>% 
  ggplot(mapping = aes(x = diabetes)) +
  geom_bar(alpha = 0.3, fill = "navyblue", linetype = 1.5, color = "darkblue") +
  xlab("Diabetic patients") +
  ylab("Number of patients") +
  labs(title = "Distribution of diabetic people in the data", 
       subtitle = "(Updated version of the data)",
       caption = "Data owner: National Institute of Diabetes and Digestive and Kidney Diseases") +
  theme_minimal()
  

## 2. One variable - cont ----

ggplot(data = PimaIndiansDiabetes2, mapping = aes(x = insulin)) +
  geom_histogram()

# Further customise
ggplot(data = PimaIndiansDiabetes2, mapping = aes(x = insulin)) +
  geom_histogram(aes(y = after_stat(density)), alpha = 0.3, fill = "navyblue") +
  geom_density(color = "blue", linewidth = 1) +
  xlab("2-Hour serum insulin") + 
  ylab("Frequency") +
  labs(title = "Histogram for 2-hour serum insulin") +
  theme_bw()


## 3. Two variables - cont x cont ----

ggplot(data = PimaIndiansDiabetes2, mapping = aes(x = insulin, y = mass)) +
  geom_point()

# Further customise
ggplot(data = PimaIndiansDiabetes2, mapping = aes(x = insulin, y = mass)) +
  geom_point(alpha = 0.3, color = "red") +
  xlab("2-Hour serum insulin") + 
  ylab("BMI") +
  labs(title = "Scatter plot for 2-hour serum insulin vs. BMI",
       caption = expression(~italic("*BMI = body mass index"))) +
  theme_minimal()

## 3. Two variables - cont x cat ----

ggplot(data = PimaIndiansDiabetes2, mapping = aes(x = diabetes, y = mass)) +
  geom_boxplot()

# Further customise
ggplot(data = PimaIndiansDiabetes2, mapping = aes(x = diabetes, y = mass, color = diabetes)) +
  geom_boxplot(outlier.color = "orange", outlier.shape = 13, outlier.size = 3) +
  xlab("Diabetic patients") +
  ylab("BMI") +
  labs(title = "Box plot for BMI",
       caption = expression(~italic("*BMI = body mass index"))) +
  theme_minimal() +
  theme(legend.position = "none")

## 4. Three variables - faceting plot ----

ggplot(data = PimaIndiansDiabetes2, mapping = aes(x = insulin, y = mass, color = diabetes)) +
  geom_point() 

ggplot(data = PimaIndiansDiabetes2, mapping = aes(x = insulin, y = mass)) +
  geom_point() +
  facet_grid(~ diabetes)

# Further customise
PimaIndiansDiabetes2 %>% 
  mutate(diabetes = fct_recode(diabetes, Negative = "neg", Positive = "pos")) %>% 
  ggplot(mapping = aes(x = insulin, y = mass, color = diabetes)) +
  geom_point() +
  facet_grid(~ diabetes) +
  xlab("2-Hour serum insulin") +
  ylab("BMI") +
  labs(title = "Scatter plot of BMI vs. serum insulin separated by diagnosis",
       caption = expression(~italic("*BMI = body mass index"))) +
  theme_bw() +
  theme(legend.position = "none")


# Miscellaneous ------------------------------------------------------------

## gganimate ---
library(gganimate)

PimaIndiansDiabetes2 %>% 
  mutate(diabetes = fct_recode(diabetes, Negative = "neg", Positive = "pos")) %>% 
  ggplot(mapping = aes(x = insulin, y = mass, color = diabetes)) +
  geom_point() +
  xlab("2-Hour serum insulin") +
  ylab("BMI") +
  labs(title = "Scatter plot of BMI vs. serum insulin",
       subtitle = "Pregnancy = {closest_state}") +
  theme_bw() +
  theme(legend.position = "none") +
  transition_states(pregnant,
                    transition_length = 3,
                    state_length = 1)




