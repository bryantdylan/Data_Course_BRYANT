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

