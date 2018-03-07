library("maps")
library("dplyr")
library("plotly")

data <- read.csv("data.csv", stringsAsFactors = FALSE)
NY <- map_data("county") %>% filter(region == "new york")
data$County <- tolower(data$County)
data_2014 <- data %>% filter(Year == 2014)
colnames(NY)[which(colnames(NY) == "subregion")] <- "County"

full_data <- left_join(NY, data_2014)

g <- list(
  scope = 'usa',
  projection = list(type = 'albers usa'),
  lakecolor = toRGB('white')
)


p <- full_data %>%
  group_by(group) %>%
  plot_ly(
    x = ~long,
    y = ~lat,
    fillcolor = 'white',
    hoverinfo = "none"
  ) %>% 
  add_polygons(
    line = list(color = 'black', width = 0.5)) %>%
  layout(
    geo = g
  )  

print(p)