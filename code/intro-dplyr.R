# Intro to dplyr
library(dplyr)

# load gapminder data as sample dataset

gapminder <- read.csv("data/gapminder_data.csv",
                      stringsAsFactors = F)

gapminder$continent <- as.factor(gapminder$continent)
gapminder$continent <- as.character(gapminder$continent)

mean(gapminder[gapminder$continent == "Africa", "gdpPercap"])

#this is a pipe: %>%
#Functions we will learn today from dplyr:
#1. select()
#2. filter()
#3. group_by()
#4. summarize()
#5. mutate()

#what attributes are in gapminder

colnames(gapminder)
subset_1 <- gapminder %>%
  select(country, continent, lifeExp)

#select every attribute except 2
subset_2 <- gapminder %>%
  select(-lifeExp, -pop)
str(subset_2)

#select some attributes but rename a few of them for clarity
subset_3 <- gapminder %>%
  select(country, population = pop, lifeExp, 
         gdp = gdpPercap)
str(subset_3)  

#using filter()
africa <- gapminder %>%
  filter(continent == "Africa") %>%
  select(country, population = pop, lifeExp)
table(africa$country)

#did not use pipe
africa <- filter(gapminder,continent == "Africa")
africa <- select(africa, country, population = pop,
                 lifeExp)

# select year, population, country, for Europe
europe <- gapminder %>%
  filter(continent == "Europe") %>%
  select(year, population = pop, country)
europe_table <- table(europe$country)
View(europe_table)

#working with group_by() and summarize
#it groups as data frames within data frames
#so you can do the same thing to subsets of data

str(gapminder %>% group_by(continent))

#summarize mean gdp per continent
gdp_continent <-  gapminder %>%
  group_by(continent) %>%
  summarize(mean_gdp = mean(gdpPercap))
View(gdp_continent)  

gdp_continent <- gapminder %>%
  group_by(continent) %>%
  summarize(mean_gdp = mean(gdpPercap),
            mean_lifeExp = mean(lifeExP)

#calculate mean population for all continents
mean_pop_continent <- gapminder %>%
  group_by(continent) %>%
  summarize(mean_pop_continent = mean(pop))
View(mean_pop_continent)

# count () and n()
gapminder %>%
  filter(year == 2002) %>%
  count(continent,sort = TRUE)

#using n() as a function when you don't know how many observations you have
#but need to do a calculation based on n
gapminder %>%
  group_by(continent) %>%
  summarize(se = sd(lifeExp)/sqrt(n()))

#mutate is your friend
#to add a new table to gapminder
xy <- data.frame(x = rnorm(100),
                 y = rnorm(100))
head(xy)
xyz <- xy %>%
  mutate(z = x*y)
head(xyz)

#head means the first six rows.
#tail means the last six rows.

#add one more column to gapminder
#column gives full GDP for each continent

#total gdp by country
total_gdp_country <- gapminder %>%
  mutate(total_gdp = pop*gdpPercap)
head(total_gdp_country)


gdp_per_continent <- gapminder %>%
  mutate(total_gdp = pop*gdpPercap) %>%
  group_by(continent) %>%
  summarize(cont_gdp = sum(total_gdp))
gdp_per_continent

