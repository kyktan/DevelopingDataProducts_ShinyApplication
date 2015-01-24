# Coursera - Developing Data Products
# Course Project - Shiny Application
# ====================================

library(shiny)

shinyUI(fluidPage(
    # Application title
    titlePanel("Developing Data Products - Course Project"),
    
    sidebarLayout(
        sidebarPanel(        
            h3("User inputs"),
                
            selectInput(inputId="cyl", label=h4("# of cylinders"),
                        choices = list("4" = 4, "6" = 6, "8" = 8), selected=4),
            
            sliderInput(inputId="wt", label=h4("Weight (1000lbs)"),
                        min=1.5, max=5.5, value=3.5),
            
            radioButtons(inputId="am", label=h4("Transmission"),
                         choices = list("Automatic" = 1, "Manual" = 0), selected=1),
            
            submitButton("Submit")
        ),
    
        mainPanel(
            tabsetPanel(
                tabPanel("Documentation",
                       h3("Description"),
                       p("This is a shiny application created as a project 
                         submission for the Coursera Developing Data Products course."), 

                       p("The app predicts 
                         the miles per gallon of a car based on user inputs of 
                         1) the number of cylinders the car has; 
                         2) the weight of the car (in 1000lbs); and
                         3) whether the car has an automatic or manual transmission."),
                       
                       h3("Using the application"),
                       
                       p("To make a prediction, select the desired inputs
                         in the side panel on the left, then click the Submit button."),
                       
                       p("The predicted miles per gallon will be displayed on the 
                         Application tab.")
                       ),  
              
                tabPanel("Application",
                       h3("Results of prediction"),
                       
                       h4("You entered"),
                       
                       h5("Cylinders"),
                       verbatimTextOutput("inputCyl"),
                       
                       h5("Weight"),
                       verbatimTextOutput("inputWt"),
                       
                       h5("Transmission"),
                       verbatimTextOutput("transmission"),
                       
                       h4("The predicted miles per gallon is"),
                       verbatimTextOutput("prediction")                           
                       )
            )            
        )
    )
))