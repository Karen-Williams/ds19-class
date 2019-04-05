#printing Biketown data with R"
install.packages("tidyverse")
library(tidyverse)
biketown <- read.csv("data/gapminder_data.csv")
str(biketown)
summary(biketown)
