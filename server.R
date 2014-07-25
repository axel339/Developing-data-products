BMI <- function(weight,height) {
  calc <- weight/height^2
  if(calc <15) text <- "Very severely underweight"
  else if (calc>=15 && calc<16) text <- "Severely underweight"
  else if (calc >=16 && calc<18.5) text <- "Underweight"
  else if (calc >=18.5 && calc<25) text <- "Healthy weight"
  else if (calc >=25 && calc<30) text <- "Overweight"
  else if (calc >=30 && calc<35) text <- "Modereatly obese"
  else if (calc >=35 && calc<40) text <- "Severely obese"
  else if (calc >=40) text <- "Very severely obese"
  sprintf("%s -> %s",calc, text)
}
shinyServer(
  function(input, output) {
    output$conv_weight<- renderPrint({input$weight*as.numeric(input$selectWeight)})
    output$conv_height<- renderPrint({input$height*as.numeric(input$selectHeight)+input$inches*0.0254})
    output$bmi <- renderPrint({BMI(input$weight*as.numeric(input$selectWeight),input$height*as.numeric(input$selectHeight)+input$inches*0.0254)})
  }
)