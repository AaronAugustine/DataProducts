
library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Shiny App to Calculate Marathon Pace, MPH, & Splits from Run time"),

  # Sidebar with controls to select a dataset and specify the
  # number of observations to view
  sidebarLayout(
    sidebarPanel(
      helpText("Enter the start time of the race."),
      selectInput("time", "Race Start time:",
                  c("7:00 AM" = "7:00:00",
                    "7:30 AM" = "7:30:00",
                    "8:00 AM" = "8:00:00",
                    "8:30 AM" = "8:30:00",
                    "9:00 AM" = "9:00:00"))
    ,
    helpText("Enter the time you expect to take to complete the race in Hours, Minutes and Seconds using the slider bars."),
      sliderInput("hours",
                  "Select Hours:",
                  min = 0,
                  max = 8,
                  value = 4,
                  step = 1)
    ,
     sliderInput("minutes",
                "Select Minutes:",
                min = 0,
                max = 59,
                value = 0,
                step = 1)
    ,
     sliderInput("seconds",
                "Select Seconds:",
                min = 0,
                max = 59,
                value = 0,
                step = 1)
    ),

    
    # Show a summary of the dataset and an HTML table with the 
    # requested number of observations
    mainPanel(
      h4("Results"),
      verbatimTextOutput("summary")
    )
  )
))
