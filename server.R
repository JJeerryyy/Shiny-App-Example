#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({
 
    if (input$dataSource == "Co2North") {
      x = read.csv("Co2North.csv")
    } else {
      if(input$dataSource == "MaxTemp"){
        x = read.csv("MaxTemp.csv")
      } else{
        if(input$dataSource == "MinTemp"){
          x = read.csv("MinTemp.csv")
        } else{
          x=NULL
      }
      }
    }
    
 
    
      x    <- x[,3] 
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      
      XLIMITS = c(input$xmin, input$xmax)
      
      hist(x, breaks = bins, col = 'darkgray', border = 'white',xlim = XLIMITS,
           prob=input$DensityLogical)
      
     
      if(input$DensityLogical){
        if(input$BoundaryCorrect ){  
          xuse = c(-x,x)
          Dens = density(xuse,from = input$xmin)
          Dens$y = Dens$y*2
        }else{
          Dens = density(x)
        }
        lines(Dens)
      }
    
  
  })
})