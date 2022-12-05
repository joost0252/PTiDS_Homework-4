library("shiny")
library("circular")
library("Directional")
library("plotrix")
library("raster")
library("ggforce")
library("Bacteriagroupf")

shinyServer(function(input, output) {
  #v <- reactiveValues(data = NULL)

  #sliderValues <- reactive({ (input$animation)})

  #output$value <- renderText({ input$bacnum })

  #output$value <- renderText({ input$cvalue })

  #output$value <- renderText({ input$seedvalue })

  #observeEvent(input$runif, {
  #  v$data <- runif(100)
  #})

  #observeEvent(input$reset, {
  #  v$data <- NULL
  #})


  output$plot <- renderPlot({
    plot(-15:15, -15:15, type="n", xlab = "X Position", ylab = "Y Position")
    grid(nx = NULL, ny = NULL, col = "lightgray", lty = "solid", lwd = par("lwd"), equilogs = TRUE)
    draw.circle(0,0,0.5*3, border="orange", col="orange")
    for (i in 1:N){
      print(points(xpos[i], ypos[i], type = "p", pch = "x"))

    }
    #print(points(xpos[1], ypos[1], type = "p", pch = "2"))
    #print(points(xpos[2], ypos[2], type = "p", pch = "2"))
    #print(points(xpos[3], ypos[3], type = "p", pch = "3"))
    #print(points(xpos[4], ypos[4], type = "p", pch = "4"))
    #print(points(xpos[5], ypos[5], type = "p", pch = "5"))
  })
})
