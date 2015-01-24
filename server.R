# Coursera - Developing Data Products
# Course Project - Shiny Application
# ====================================

library(shiny)

# Formula to predict fuel consumption
# (as estimated in regression model course)
mpg <- function(cyl, wt, am){
    out <- 39.42 - 1.51 * cyl - 3.13 * wt + 0.18 * am
    out
}

shinyServer(
    function(input, output){

        # Repeat the user inputs
        output$inputCyl <- renderPrint({as.numeric(input$cyl)})
        output$inputWt <- renderPrint({input$wt})
        output$transmission <- renderPrint(ifelse(input$am==1, 
                                                  "Automatic", "Manual"))
        output$inputAm <- renderPrint({as.numeric(input$am)})
             
        # Show the prediction
        output$prediction <- renderPrint({mpg(as.numeric(input$cyl), 
                                              input$wt,
                                              as.numeric(input$am))})
    }
)