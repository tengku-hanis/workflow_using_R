# Answer for data visualisation with ggplot2 exercise
# Tengku Muhammad Hanis Mokhtar
# September 19, 2023

# OPEN hints if needed: https://tengku-hanis.github.io/hint_workflow_using_R/hint.html

# Packages ----------------------------------------------------------------

library(tidyverse)


# Data --------------------------------------------------------------------

data("iris")
skimr::skim(iris)


# Question 1 --------------------------------------------------------------

# Make histogram for variable Sepal.Length and give title for the histogram plot

ggplot(data = iris, mapping = aes(x = Sepal.Length)) +
  geom_histogram() +
  labs(title = "Histogram of Sepal.Length")


# Question 2 --------------------------------------------------------------

# Make a scatter plot between variables Sepal.Width and Petal.Width and give different colors 
# for each species (variable Species)

ggplot(data = iris, mapping = aes(x = Sepal.Width, y = Petal.Width, color = Species)) +
  geom_point() 

# Next, separate the scatter plot, so that each species is its own plot

ggplot(data = iris, mapping = aes(x = Sepal.Width, y = Petal.Width, color = Species)) +
  geom_point() +
  facet_grid(~Species)


# Question 3 --------------------------------------------------------------

# Make a line plot on top of a scatter plot between variables Sepal.Length and Petal.Length and 
# give different colors for each species (variable Species)

ggplot(data = iris, mapping = aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  geom_point() +
  geom_line()
