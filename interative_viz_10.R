dam_reservoir<-read.csv("invaso_diga_2010.csv")
dam_reservoir<-dam_reservoir$Reservoir
ui <- fluidPage(
  # App title
  titlePanel("Reservoir level"),
  sidebarLayout( sidebarPanel(
    sliderInput(inputId = "bins",
                label = "Bins number:",
                min = 1,
                max = 70,
                value = 10) ),
    
    mainPanel(
      plotOutput(outputId = "distPlot")
      
    )))

# to draw a histogram on server
server <- function(input, output) {
  
  
  output$distPlot <- renderPlot({
    
    x    <- dam_reservoir
    x    <- na.omit(x)
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "#75cadb", border = "black",
         xlab = "Water level a.s.l.",
         main = "Distribution of water levels during Jan,Feb,Mar")
    
    
  })
  
}
shinyApp(ui = ui, server = server)

