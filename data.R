library("maps")
library("dplyr")
library("ggplot2")


data <- read.csv("data.csv", stringsAsFactors = FALSE)
NY <- map_data("county") %>% filter(region == "new york")
print(ggplot(NY,aes(long, lat, group=group))+geom_polygon())

