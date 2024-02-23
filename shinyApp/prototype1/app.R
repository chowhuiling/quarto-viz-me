pacman::p_load(shiny, tidyverse)
               
exam <- read_csv("data/Exam_data.csv")



# Define UI for application that draws a histogram
ui <- fluidPage(
  titlePanel("Pupils Examination Result Dashboard"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "variable", 
                  label = "Subject:",
                  choices = c("English" = "ENGLISH",
                              "Mathematics" = "MATHS",
                              "Science" = "SCIENCE"),
                  selected = "ENGLISH"),
      sliderInput(inputId = "bins", 
                  label = "Number of beans",
                  min = 5,
                  max = 20,
                  value = 10) #default
      
    ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
)


# Define server logic required to draw a histogram
server <- function(input, output) {
  #note that the $distPlot has to be same case as the above plotOutput("distPlot")
  output$distPlot <- renderPlot({
    ggplot(data = exam,
           aes_string(x = input$variable)) +
      geom_histogram(bins = input$bins,
                     color = "black",
                     fill = "light blue")
  })
}

   

# Run the application 
shinyApp(ui = ui, server = server)
