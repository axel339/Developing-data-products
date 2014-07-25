shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("BMI calculator"),
    sidebarPanel(
      numericInput('weight', 'Weight', 70, min = 30, max = 400, step = 1),
      selectInput("selectWeight", label = "Select weight unit",choices = list("Kilogram" = 1, "Pound" = 0.453592),selected = 1),
      numericInput('height', 'Height', 1.80, min = 0, max = 15, step = 0.01),
      selectInput("selectHeight", label = "Select height unit",choices = list("Meters" = 1, "Feet" = 0.3048),selected = 1),
      conditionalPanel(
        condition = "input.selectHeight == 0.3048",
        numericInput("inches","+ Inches (optional)",0,min=0,max=20),step=1),
      submitButton('Submit')
    ),
    mainPanel(
      h3('Your BMI'),
      h4('Your weight in Kilogram'),
      verbatimTextOutput(c("conv_weight","selectWeight")),
      h4('Your height in meters'),
      verbatimTextOutput("conv_height"),
      h4('Which resulted in a calculation of '),
      verbatimTextOutput("bmi")
    )
  )
)