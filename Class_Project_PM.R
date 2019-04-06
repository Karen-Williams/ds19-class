#Making graphs with PM 2.5 Data to test skills
install.packages("scales")
library(scales)
library(ggplot2)
library(tidyr)
library(dplyr)
library(lubridate)


PM25 <- read.csv("data/pm25data.csv")
PM25_Month <- PM25 %>%
  mutate(date_l = mdy(Date), day = day(date_l))

p <- ggplot(PM25_Month, aes(x = date_l, y = FinePM, group = Monitor, color = Monitor)) +
  geom_point() + ylab("PM 2.5 (ug/m3)") + xlab("2008 - 2018") 

p


