library(shiny)

shinyUI(fluidPage(
  titlePanel("Bacteria Motility App"),
  sidebarLayout(
    sidebarPanel(
      numericInput("bacnum", "Number of bacteria:", 10, min = 1, max = 100),
      verbatimTextOutput("value"),

      numericInput("cvalue", "k constant c:", 10, min = 1, max = 100),
      verbatimTextOutput("cvalue"),

      textInput("seedvalue", "Simulation seed", "Give seed"),
      verbatimTextOutput("seedvalue"),

      actionButton("runif", "Compute simulation"),

      sliderInput("animation", "Run animation of simulation:",
                  min = 0, max = 100,
                  value = 1, step = 1,
                  animate = animationOptions(interval = 300, loop = FALSE))
    ),
    mainPanel(plotOutput("plot"))
    )
  )
)
