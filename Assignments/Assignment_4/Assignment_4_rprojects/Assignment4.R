library(tidyverse)
library(leaflet)
library(terra)
install.packages("leaflet.extras")
leaflet::providers
library(htmltools)



RG_data<-read.csv('/Users/bryan/OneDrive/Documents/BIOL_3100/Data_Course_BRYANT/Assignments/Assignment_4/Assignment_4_FAKE_data_final_project_idea.csv')
View(RG_data)
ggplot(RG_data)+
  geom_point(aes(x=Area, y=Average_elevation, color=Rock_Glacier))

cardinal_direction <- as.factor(RG_data$slope_cardinal_direction)

ggplot(RG_data)+
  geom_point(aes(x=length, y=width, color=slope_cardinal_direction))


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

