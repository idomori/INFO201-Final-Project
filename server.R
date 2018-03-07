shinyServer(function(input, output) {
  
  graphMap <- function(var, year) {
    data <- df %>% filter(Year == year)
    full_data <- left_join(NY, data_2014)
    
    gg <- ggplot(full_data, aes(long,lat, group=group, fill=eval(as.name(var)))) + 
      geom_polygon( col="white") + labs(color = "Cylinders"))

    ggplotly(gg, tooltip="sas")
  }
  currentGraph <- reactive({graphMap(input$crimeChoices, input$animation)})
  
  output$graph <- renderPlotly(
    currentGraph()
  )
})

