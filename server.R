# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

# load the necessary libraries
library(shiny)
library(ggplot2)
library(maps)
library(mapdata)

# load Department mapping data
LEB <- readRDS("gadm36_LBN_2_sp.rds")

# Define server logic required to draw the map and selected state
shinyServer(function(input, output) {
    
    sel_dept <- reactive({
        subset(LEB, NAME_1 %in% input$sel_dept)
    })
    
        output$mapPlot <- renderPlot({

        # draw the map with the selected state highlighted in light blue
            if (input$sel_dept != "") {
                ggplot(data = LEB) +
                geom_polygon(aes(x = long, y = lat, group = group), fill = "light yellow", color = "brown")+
                coord_fixed(1.3) +
                guides(fill=FALSE) + geom_polygon(data=sel_dept(), aes(x = long, y = lat, group = group), fill = "light blue",color = "brown") 
            }
            else {
                ggplot(data = LEB) +
                    geom_polygon(aes(x = long, y = lat, group = group), fill = "light yellow", color = "brown")+
                    coord_fixed(1.3)
                
            }
            

    })
    

})