
library(knitr)
library(car)
library(datasets)

data(mtcars)
cars <- mtcars
cars$am <- as.factor(cars$am)
levels(cars$am) <- c("Automatic", "Manual")

bestmodel <- lm(mpg ~ am+wt+hp, data=cars)

shinyServer(function(input, output) {
    
    output$transmission1 <- renderText({
        paste("You have selected transmission type: ", input$transmission)
    })
    
    output$hp1 <- renderText({ 
        paste("You have chosen horsepower: ", input$hp)
    })
    
    output$wt1 <- renderText({ 
        paste("You have chosen weight: ", input$wt)
    })
    
    output$computeMPG <- renderText({
        input$goButton
        inputvalue <- data.frame(am=input$transmission, wt=input$wt, hp=input$hp)
                       
        paste("The predicted Miles per Gallon is :", signif(predict(bestmodel, inputvalue),3))
    })    
})