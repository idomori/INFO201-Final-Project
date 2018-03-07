source("data.R")
library(markdown)
library(shinythemes)
library(DT)
library(dplyr)
library(shiny)
shinyUI(fluidPage(
  theme = shinytheme("darkly"),
  navbarPage(
    "New York Crime Rate",
    tabPanel("Visualize",
             sidebarLayout(
               sidebarPanel(
                 selectInput(
                   "crimeChoices",
                   label = "Choose the type of crime to visualize",
                   choices = list(
                     "Violent Crimes" = "Violent.Rate",
                     "Property Crimes" = "Property.Rate",
                     "Firearm Crimes" = "Firearm.Rate"
                   ),
                   selected = "Violent.Rate"
                 ),
                 fluidRow(column(3))
               ),
               mainPanel(
                 plotlyOutput("graph"),
                 sliderInput(
                   "animation",
                   "Year",
                   min = 1990,
                   max = 2015,
                   value = 2002,
                   step = 1,
                   animate = animationOptions(interval = 900, loop = TRUE),
                   width = '100%',
                   sep = ""
                 )
               )
             )),
    tabPanel(
      "Explore Data",
      basicPage(
        h2(
          "Index, Violent, Property, and Firearm Rates By County: Beginning 1990"
        ),
        DT::dataTableOutput("mytable")
      ),
      verbatimTextOutput("summary")
    ),
    navbarMenu(
      "More",
      tabPanel("About the Project",
               fluidRow(includeMarkdown("tab3.Rmd"))),
      tabPanel("About Us",
               fluidRow(includeMarkdown("infoaboutme.rmd")))
    )
  )
))