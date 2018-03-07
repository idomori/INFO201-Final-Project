library(shiny)

fluidPage(
  titlePanel("New York Crime Rates | BC Boundless"),
  sidebarLayout(
    hr(), 
    checkboxGroupInput("crimeChoices", label = "Choose the type of crime to visualize", 
                       choices = list("Violent Crimes" = "Violent.Rate", 
                                      "Property Crimes" = "Property.Rate",
                                      "Firearm Crimes" = "Firearm.Rate"), 
                       selected = "Violent Crimes"),
    fluidRow(column(3))
  ), 
  
  mainPanel(
    plotOutput("graph"),  
    sliderInput("animation", "Year",
                min = 1990, max = 2015,
                value = 1, step = 5,
                animate = animationOptions(interval = 1, loop = TRUE))
  )
)
