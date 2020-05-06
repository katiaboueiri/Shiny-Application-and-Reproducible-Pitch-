# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

# load required libraries
library(shiny)
library(sp)

# load Department mapping data
LEB <- readRDS("gadm36_LBN_2_sp.rds")

# make the first Department choice be NA
choices <- c("")

# append the Department choices
choices <- c(choices, unique(LEB$NAME_1))

# Define UI for application
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Department Identification"),
    
    # Sidebar with drop down selector to choose the Department
    # Also includes instructions to use the application
    sidebarLayout(
        sidebarPanel(
            "Select a Department to highlight:",
            selectInput("sel_dept", "",choices, selected = NULL, multiple=FALSE),
            h4("Detailed Instructions"),
            "This application allows you to choose a Department to highlight on a map of the various departments of Lebanon 
      Use the selector above to choose a department to display."
        ),
        
        # Show the map plot
        mainPanel(
            h4("The Departments of Lebanon"),
            plotOutput("mapPlot")
        )
    )
))
