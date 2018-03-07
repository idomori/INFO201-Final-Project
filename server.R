shinyServer(function(input, output) {
  
  graphMap <- function(var, year) {
    data <- df %>% filter(Year == year)
    full_data <- left_join(NY, data)
    if (var == "Violent.Rate") {
      gg <- ggplot(full_data, aes(long,lat, group=group, fill=Violent.Rate, text=County))
    } else if (var == "Property.Rate") {
      gg <- ggplot(full_data, aes(long,lat, group=group, fill=Property.Rate, text=County))
    } else {
      gg <- ggplot(full_data, aes(long,lat, group=group, fill=Firearm.Rate, text=County))
    }
    gg <- gg + geom_polygon( col="white") + labs(fill = var) + coord_map()
    ggplotly(gg)
  }
  
  currentGraph <- reactive({graphMap(input$crimeChoices, input$animation)})
  
  output$graph <- renderPlotly(
    currentGraph()
  )
  
})