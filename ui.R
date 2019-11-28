#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Study of Climate Data"),
  
  radioButtons("dataSource", "",
               c("Co2North (Number of bins set to 50 and x-axis min/max set to 300/450 to see)" = "Co2North",
                 "Canadian Maximum Temperature" = "MaxTemp",
                 "Canadian Minimum temperature" = "MinTemp")),

  sidebarLayout(
    sidebarPanel(
       sliderInput("bins",
                   "Number of bins:",
                   min = 0,
                   max = 20000,
                   value = 4000,
                   step = 50),
       
       numericInput("xmin", "x-axis minimum:", -50),
       numericInput("xmax", "x-axis maximum value:", 50),
       
       checkboxInput("DensityLogical", strong("Add density plot?"), FALSE),
       
       conditionalPanel(
         condition = "input.DensityLogical == true",
         helpText(HTML("<h3>You might want to adjust the boundary estimate???</h3>")),  
         checkboxInput("BoundaryCorrect", strong("Correct the density plot at zero?"), FALSE)  
         
    )
    ),
    
  
    
    # Show a plot of the generated distribution
    mainPanel(
      
      tabsetPanel(type = "tabs",
                  tabPanel("Climate Data",plotOutput("distPlot")),
                  tabPanel("Reference",source("ref.R")$value()),
                  tabPanel("How did I graph plot with csv file?",source("how.R")$value())
       
    )
  )
)))
