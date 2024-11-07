View(iris)
ggplot(iris)+
  geom_point(aes(x=Species, y=Sepal.Length), color='brown')+
  geom_point(aes(x=Species, y=Sepal.Width), color='sandybrown')+
  geom_point(aes(x=Species, y=Sepal.Length), color='orangered')+
  geom_point(aes(x=Species, y=Sepal.Width), color='green')



ggplot(iris)+
  geom_point(aes(x=Sepal.Length, y=Species))+
  geom_point(aes(x=Petal.Length, y=Species))+
  geom_point(aes(x=Petal.Width, y=Species))+
  geom_point(aes(x=Sepal.Width, y=Species))+
  scale_x_log10()+
  scale_color_gradient(low='blue', high="darkblue")

img <- readPNG("Uglyflowerpicture.png")

par(new=TRUE)
Plot1<-ggplot(iris,(aes(x=Species, y=Sepal.Length,color=Species)))+
  geom_col(color='red')+
  geom_point(alpha=0.2, shape=13, color='cyan',size=40)+
  coord_polar(theta='y')+
  theme(panel.background=element_rect(fill="purple"), 
        panel.grid.major = element_line(color='tan4', size=40, linetype=2))+
  labs(title="iRIS..:)...sEpAl.lEnGtH_----_(sEPal.wiDTH)", face='bold')+
  theme(plot.title=element_text(color='orange', size=12, face='italic', angle=-4,hjust=1),
        axis.title.x=element_text(color='gray', size=14, face='bold', angle=75),
        axis.title.y=element_text(color='green', size=40, face='italic',angle=120),
        plot.background = element_rect(fill = "deeppink"))
print(Plot1)


Plot1+ geom_image(aes(x=2, y=3), image = "img")

Plot1 + theme(axis.text.y = element_text(angle = 100, hjust = 1))


plot3<-ggplot(iris,(aes(x=Species, y=Sepal.Length,color=Species)))+
  geom_col(color='blue')+
  geom_point(alpha=0.2, shape=14, color='limegreen', size=25)+
  scale_shape_manual(values=c(0,100,300))+
  coord_flip()+
  theme(panel.background=element_rect(fill="lavender"), 
        panel.grid.major = element_line(color='deeppink', size=40, linetype=3))+
  labs(title="iRIS..:)...sEpAl.lEnGtH_----_(sEPal.wiDTH)", face='bold')+
  theme(plot.title=element_text(color='green', size=16, face='italic'),
        axis.title.x=element_text(color='cyan', size=14, face='bold'),
        axis.title.y=element_text(color='maroon4', size=60, face='italic'),
        plot.background = element_rect(fill = "firebrick"))
print(plot3)





img <- readJPEG("./Assignments/Assignment_5/Uglyflowerpicture.jpg")
install.packages("jpeg")
install.packages("grid")
library(grid)
library(jpeg)
# Create a raster object for the image
img_raster <- rasterGrob(img, width = unit(1, "npc"), height = unit(1, "npc"), interpolate = TRUE)

install.packages("magick")
library('magick')
img_grob <- as.grob(img_raster)

library('ggplot2')

plot3 + annotation_custom(img_grob, 
                      xmin = 3, xmax = 5,  
                      ymin = 4, ymax = 6)






ggplot(iris,(aes(x=Species, y=Sepal.Length)))+
  geom_col(color='sandybrown')+
  geom_point(alpha=0.2, shape=14, color='magenta', size=25)+
  theme(panel.background=element_rect(fill="cornflowerblue"), panel.grid.major = element_line(color='khaki3', size=40, linetype=3))+
  labs(title="iRIS..:)...sEpAl.lEnGtH_----_(sEPal.wiDTH)", face='bold')+
  theme(plot.title=element_text(color='chartreuse3', size=16, face='italic'),
        axis.title.x=element_text(color='red', size=14, face='bold'),
        axis.title.y=element_text(color='navajowhite', size=60, face='italic'),
        plot.background = element_rect(fill = "green"))
