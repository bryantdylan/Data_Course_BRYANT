library(tidyverse)
library(leaflet)
library(terra)
install.packages("leaflet.extras")
leaflet::providers
library(htmltools)

#Assignment 4 Final Project Ideas

#1. Create a plaintext document named “final_project_idea.txt”

#2. In it, describe your idea for a data analysis final project

#3 Also, Describe the sort of data you will use, potential sources, and what the data might look like

#4 (If you already have data, skip this task) Create fake data that simulates what your final project data set might look like. Preferrably a csv file

#5 Generate a plot (using ggplot) using either your real or fake data that shows at least one expected result



RG_vector<-vect('Escalante_complete-polygon.shp')
RG_vector<-vect('/Users/bryan/OneDrive/Documents/BIOL_3100/Data_Course_BRYANT/Assignments/Assignment_4/mygeodata/Escalante_complete-polygon.shp')
RG_map<-leaflet() %>%
  addTiles()%>%
  addProviderTiles("Esri.WorldImagery") %>%
  addPolygons(data=RG_vector, color="skyblue", weight=2, opacity=0.8, fillOpacity =0.6)%>%
  addControl("Rock Glaciers in the Escalante Quad near Barney Top", position='topright', className='map-description')

RG_map <- RG_map %>%
  addControl(
    tags$style(HTML("
      .map-description {
        color: darkblue;        
        font-size: 16px;        
        font-weight: bold;      
        background-color: white; 
        padding: 8px;           
        border-radius: 5px;     
        box-shadow: 3px 3px 5px rgba(0,0,0,0.3); 
      }
    ")),
    position = "topright")
 

RG_map %>%
  addMiniMap(tiles=providers$Stamen.TonerLines, toggleDisplay=TRUE, position="bottomright", zoomLevelOffset = -5, width=400, height=400)

  