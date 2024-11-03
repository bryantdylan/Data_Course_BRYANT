diff_df<-read.csv("BIOL_TEST_DATA_ASSIGNMENT_4.csv")
ggplot(data=diff_df, aes(x=seconds,y=Diffusivity1))+
  geom_point()
diff_df %>%
  ggplot()+
  geom_point(aes(x=seconds,y=Diffusivity1), color='blue')+
  geom_point(aes(x=seconds,y=Diffusivity2), color='limegreen')+
  geom_point(aes(x=seconds,y=Diffusivity3), color='orange')+
  geom_point(aes(x=seconds,y=Diffusivity4), color='hotpink')+
  labs(title = "Titanium diffusivity in Quartz",
       x='Time',
       y='Diffusivity')
  
  
