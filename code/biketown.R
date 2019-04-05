#printing Biketown data with R"
install.packages("tidyverse")
library(tidyverse)
biketown <- read.csv("Desktop/DS19-Class/ds19-class/data/biketown-2018-trips/biketown-2018-trips.csv")
str(biketown)
summary(biketown)
library(lubridate)
biketown <- read.csv("Desktop/DS19-Class/ds19-class/data/biketown-2018-trips/biketown-2018-trips.csv")
str(biketown)

summary(biketown)
# this in tidyverse
biketown$hour <- hms(biketown$StartTime) %>%
stime <- hms(biketown$StartTime)
hour()

# same as this in base
stime <- hms(biketown$StartTime)
biketown$hour <- hour(stime)
freq_by_hour <- table(biketown$hour)

biketown$month <- mdy(biketown$StartDate)%>%
  month(label = T, abbr = T)

str(biketown$month)

freq_by_hour <- table(biketown$hour)
barplot(freq_by_hour)

#investigate hourly bins
hist(biketown$hour, breaks = seq(0, 24, 3))

# focus on the AM peak
am_peak <- subset(biketown, hour >= 7 & hour < 10)

hist(am_peak$hour, breaks = seq(7, 10, 1))#not great
barplot(table(am_peak$hour))

freq_by_month <- table(biketown$month)
barplot(freq_by_month)

#looking by station
freq_by_station <- table(biketown$StartHub)

#25 stations
top25_stations <- sort(freq_by_station, decreasing = T)[1:25]
dotchart(top25_stations)
