r=read.csv('seals.csv')
library(ggplot2)
ggplot(r, aes(x=wavelength,y=a1,color=seal)) + 
geom_point() + 
geom_line() + 
labs(main="Comparison of various plate seals", x="Wavelength (nm)", y="Optical density") + 
facet_grid(~seal) + 
theme_bw() + 
ggsave('seals.png', width=20, height=3) 
