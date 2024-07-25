library(shiny)

# Define UI for application
ui <- fluidPage(
  titlePanel("Gender Ratio by State in India"),
  sidebarLayout(
    sidebarPanel(
      helpText("This application displays the gender ratio in each state of India.")
    ),
    mainPanel(
      tableOutput("genderRatioTable")
    )
  )
)

# Define server logic
server <- function(input, output) {
  # Comprehensive dummy data frame
  gender_ratio_data <- data.frame(
    State = c("Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh", 
              "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jharkhand", 
              "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur", 
              "Meghalaya", "Mizoram", "Nagaland", "Odisha", "Punjab", 
              "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura", 
              "Uttar Pradesh", "Uttarakhand", "West Bengal"),
    GenderRatio = c(972, 920, 954, 918, 991, 
                    973, 919, 879, 972, 948, 
                    973, 1084, 931, 929, 985, 
                    989, 976, 931, 979, 895, 
                    928, 889, 996, 933, 961, 
                    912, 963, 950)
  )
  
  # Render the table
  output$genderRatioTable <- renderTable({
    gender_ratio_data
  })
}

# Run the application
shinyApp(ui = ui, server = server, options = list(host = '0.0.0.0'))
