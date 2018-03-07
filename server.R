shinyServer(function(input, output) {
  
  graphMap <- function(var, year) {
    data <- df %>% filter(Year == year)
    full_data <- left_join(NY, data)
    gg <- ggplot(full_data, aes(long,lat, group=group, fill=eval(as.name(var)), text=County)) + 
      geom_polygon( col="white")
    ggplotly(gg)
  }
  
  currentGraph <- reactive({graphMap(input$crimeChoices, input$animation)})
  
  output$graph <- renderPlotly(
    currentGraph()
  )
  
})