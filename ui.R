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
    tabPanel("Explore Data",
             # source("data.R")
             basicPage(
               h2("Index, Violent, Property, and Firearm Rates By County: Beginning 1990"),
               DT::dataTableOutput("mytable")
             ),
             verbatimTextOutput("summary")
    ),
    navbarMenu(
      "More",
      tabPanel("About the Project",
               fluidRow(includeMarkdown("tab3.Rmd"))),
      tabPanel("About Us"#,
               # fluidRow(
               #    column(9,
               #       #includeMarkdown("aboutUs.md")
               #     ),
               #     column(3,
               #       # img(class="img-polaroid",
               #       #   src=paste0("http://upload.wikimedia.org/",
               #       #   "wikipedia/commons/9/92/",
               #       #   "1919_Ford_Model_T_Highboy_Coupe.jpg")),
               #       # tags$small(
               #   "Source: Photographed at the Bay State Antique ",
               #   "Automobile Club's July 10, 2005 show at the ",
               #   "Endicott Estate in Dedham, MA by ",
               #   a(href="http://commons.wikimedia.org/wiki/User:Sfoskett",
               #     "User:Sfoskett")
               #  )
               # )
               # )                        )
      )
    )
  )))