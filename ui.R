shinyUI(

    navbarPage("Predict MPG of Cars",
        tabPanel("About",
            fluidPage(
                titlePanel(""),
                h1("Regression Model"),
                p("The mtcars dataset in RStudio was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74 models)."),
                br(),
                p("Upon analysis on the aspects that has a high correlation to the fuel consumption variable; Miles Per Gallon, a generalised linear regression model is built for Miles Per Gallon (mpg) against Car Transmission (am), with the following covariates; Weight (wt, lb/1000) and Horsepower (hp)."),
                br(),
                br(),
                h1("Instructions"),
                p("To predict the mpg of a car, provide the values of the following 3 variables:"),
                strong("Car Transmission:"), span("Select either Automatic or Manual."),
                br(),
                strong("Weight:"), span("Slide the slider to select a weight."),
                br(),
                strong("Horsepower:"), span("Slide the slider to select a horsepower."),
                br(),
                br(),
                p("Click on 'go' button to submit to the model to predict the mpg."),
                br(),
                p("So, if you are ready, click on the 'Calculator' menu, to proceed.")
            )    
        ),
        tabPanel("Calculator",
            fluidPage(
                titlePanel(""),
                sidebarLayout(
                    sidebarPanel(
                        helpText("Predicts the Miles Per Gallons based on Transmission Type, Horsepower and Weight of car"),
                        
                        selectInput("transmission", 
                                    label = "Choose the type of transmission",
                                    choices = c("Automatic", "Manual"),
                                    selected = "Automatic"),
                        
                        sliderInput("hp", 
                                    label = "Gross horsepower:",
                                    min = 60, max = 300, value = 100, step = 1),
                        
                        sliderInput("wt", 
                                    label = "Weight (lb/1000):",
                                    min = 1.0, max = 5.0, value = 2.5, step = 0.001),
                        
                        submitButton("Go!")
                    ),
                    
                    mainPanel(
                        textOutput("transmission1"),
                        br(),
                        textOutput("hp1"),
                        br(),
                        textOutput("wt1"),
                        br(),
                        textOutput("computeMPG")
                    )
                )
            )
        )
    )
)