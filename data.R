library("maps")
library("dplyr")
library("plotly")

data <- read.csv("data.csv", stringsAsFactors = FALSE)
NY <- map_data("county") %>% filter(region == "new york")
data$County <- tolower(data$County)
data_2014 <- data %>% filter(Year == 2014)
colnames(NY)[which(colnames(NY) == "subregion")] <- "County"

full_data <- left_join(NY, data_2014) %>% group_by(group)









p <- ggplot(full_data, aes(long,lat, group= group, fill=Population, text=County)) + geom_polygon( col="white")

a <- ggplotly(p)


print(a)
