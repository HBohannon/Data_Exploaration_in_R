library(ggplot2)
library(dplyr)

levels(gapminder$country)

unique(gapminder$year)

Five_Countries <- filter(gapminder,country %in% c("Egypt","Japan","South Africa","Switzerland","United States"))

Five_CountriesClean <- select(Five_Countries, country, year, lifeExp, gdpPercap)

ggplot(Five_CountriesClean, aes(x = year, y = lifeExp, color = country)) +
  geom_point(aes(alpha = year), size = 3) + geom_path() +
  scale_alpha(range = c(0.3, 1.0)) +
  xlab("year") + ylab("Life Expectancy")

filter(Five_CountriesClean, year %in% c(1952, 2007)) 

median <- Five_CountriesClean %>% select(year,lifeExp) %>% group_by(1952) %>% summarise(medLife = median(lifeExp))

median2 <- Five_CountriesClean %>% select(year,lifeExp) %>% group_by(2007) %>% summarise(medLife = median(lifeExp))

