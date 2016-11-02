#setwd("/Users/emilysessa/Dropbox/Research/01 Computation/01 all r files/fern genome skimming")
#list.files(getwd())

library(ggplot2)
library(wesanderson)
library(gridExtra)

############## FOR STACKED BAR GRAPHS ###################
## read in data
data <- read.csv("repeat2.csv", header=TRUE)

## set color scheme
ordered = c("#C6CDF7", "#675599", "#956D34", "#D6CABF", "#D69FA0", "#308BC4", "#75CAE5", "#00A08A", "#77A63B", "#E5DC21", "#F2AD00", "#F98400")

## Make a variable to set the order of the facets, in this case by species. If you don't want to do this, in the ggplot code do ( ! species) insted of species_f. Can use this to order them in any way you want.
data$species_f = factor(data$species, levels=c('Ceratopteris', 'Cystopteris', 'Dipteris', 'Plagiogyria', 'Polypodium', 'Pteridium', 'Amborella', 'Vitis', 'Zea', 'Gnetum','Pinus','Taxus'))

## In this one they're ordered by genome size, ferns then seed plants (same as phylogeny in scatterplot)
#data$species_f = factor(data$species, levels=c('Polypodium', 'Cystopteris', 'Ceratopteris', 'Pteridium', 'Plagiogyria', 'Dipteris', 'Amborella','Vitis', 'Zea', 'Gnetum','Pinus','Taxus'))

## barplot1 - One possible ordering of classes within the bar graph
#data$class = factor(data$class, levels=c('Non-repetitive', 'Satellite', 'RC', 'Simple_repeat', 'rRNA', 'LTR_Other','LTR_Gypsy', 'LTR_Copia', 'Low complexity', 'LINE', 'DNA', 'Unknown_repeat'))

## barplot2 - Another order, this ends up looking better:
data$class = factor(data$class, levels=c('Non repetitive', 'LINE', 'LTR (Other)','LTR (Gypsy)', 'LTR (Copia)', 'rRNA', 'Satellite', 'Simple repeat', 'Low complexity','Rolling Circle', 'DNA transposons', 'Unknown repeat'))

## ggplot code to make the actual figure
#pdf(file="Paul_play.pdf", paper="USr")
ggplot() +
   geom_bar(data=data, aes(y = proportion, x = run, fill = class, order=-as.numeric(class)), stat="identity", position='stack') +
   theme_bw() + 
   theme(strip.text.x=element_text(size=8, face="italic")) +
   facet_grid( ~ species_f) + scale_fill_manual(values= ordered) +
   labs(x="Sample number", y="% of genome")


dev.off()







############## FOR SCATTER PLOTS ###################
## read in data
scatter <- read.csv("scatter.csv", header=TRUE)

## set color scheme
mix5 = c("#F21A00", "#E1AF00", "#EBCC2A", "#ABDDDE", "#78B7C5", "#3B9AB2",    "#E6A0C4", "#C6CDF7", "#FFA58C", "#FBCBB6", "#7294D4", "#FD6467")

## order the species names as you want them to appear in the legend
scatter$Species = factor(scatter$Species, levels=c('Polypodium', 'Cystopteris', 'Ceratopteris', 'Pteridium', 'Plagiogyria',   'Dipteris', 'Amborella', 'Vitis', 'Zea', 'Gnetum','Pinus','Taxus'))

## choose points for the scatter plot, in an order that corresponds with the species ordering in the previous line
points=c(15, 16, 17, 15, 16, 17, 21, 22, 23, 21, 22, 23)


## Make individual plots for the various repeat classes; at the bottom this will be turned into one big figure

#Error bars for protein2   
ymin=scatter$ymin
ymax=scatter$ymax

protein1 <- ggplot(scatter, aes(x = Genome.size, y = Protein1, group=Species, color=Species, shape=Species)) + 
  geom_point(size = 2) +  
  labs(x="", y="% of genome", title="Protein Content (1)") +
  scale_shape_manual(values=points) +
  scale_color_manual(values = mix5) +
  theme(plot.margin=unit(c(0,0,-0.5,-0.3), "cm"), axis.title=element_text(size=9), plot.title=element_text(size=9), axis.text=element_text(size=7))

protein2 <- ggplot(scatter, aes(x = Genome.size, y = Protein2, group=Species, color=Species, shape=Species)) + 
  geom_point(size = 2) +  
  labs(x="", y="", title="Protein Content (2)") +
  scale_shape_manual(values=points) +
  scale_color_manual(values = mix5) +
  geom_errorbar(data=scatter, mapping=aes(x=Genome.size, ymin=ymin, ymax=ymax), width=0.2, size=0.5) +
  theme(plot.margin=unit(c(0,0,-0.5,-0.3), "cm"),  axis.title=element_text(size=9), plot.title=element_text(size=9), axis.text=element_text(size=7))





Non.repetitive <- ggplot(scatter, aes(x = Genome.size, y = Non.repetitive, group=Species, color=Species, shape=Species)) + 
  geom_point(size = 2) +  
  labs(x="", y="% of genome", title="Non repetitive") +
  scale_shape_manual(values=points) +
  scale_color_manual(values = mix5) +
  theme(plot.margin=unit(c(0,0,-0.3,0), "cm"),  axis.title=element_text(size=9), plot.title=element_text(size=9), axis.text=element_text(size=7))

proteinBoth <- ggplot(scatter, aes(x = Genome.size, y = ProteinBoth, group=Species, color=Species, shape=Species)) + 
  geom_point(size = 2) +  
  labs(x="", y="", title="Protein Content") +
  scale_shape_manual(values=points) +
  scale_color_manual(values = mix5) +
  geom_hline(yintercept=c(2.4), linetype="dotted") +
  #annotate("text", x=1.5, y=2.6, label="Method 2", size=1) +
  #annotate("text", x=1.5, y=2.2, label="Method 1", size=1 +
  geom_errorbar(data=scatter, mapping=aes(x=Genome.size, ymin=ymin, ymax=ymax), width=0.2, size=0.5) +
  theme(plot.margin=unit(c(0,0,-0.3,-0.3), "cm"),  axis.title=element_text(size=9), plot.title=element_text(size=9), axis.text=element_text(size=7))

LINE <- ggplot(scatter, aes(x = Genome.size, y = LINE, group=Species, color=Species, shape=Species)) + 
  geom_point(size = 2) +  
  labs(x="", y="", title="LINE") +
  scale_shape_manual(values=points) +
  scale_color_manual(values = mix5) +
  theme(plot.margin=unit(c(0,0,-0.3,-0.3), "cm"),  axis.title=element_text(size=9), plot.title=element_text(size=9), axis.text=element_text(size=7))
 
LTR_Gypsy <- ggplot(scatter, aes(x = Genome.size, y = LTR_Gypsy, group=Species, color=Species, shape=Species)) + 
  geom_point(size = 2) +  
  labs(x="", y="", title="LTR (Gypsy)") +
  scale_shape_manual(values=points) +
  scale_color_manual(values = mix5) +
  theme(plot.margin=unit(c(0,0,-0.3,-0.3), "cm"),  axis.title=element_text(size=9), plot.title=element_text(size=9), axis.text=element_text(size=7))

LTR_Copia <- ggplot(scatter, aes(x = Genome.size, y = LTR_Copia, group=Species, color=Species, shape=Species)) + 
  geom_point(size = 2) +  
  labs(x="", y="", title="LTR (Copia)") +
  scale_shape_manual(values=points) +
  scale_color_manual(values = mix5) +
  theme(plot.margin=unit(c(0,0.5,-0.3,-0.3), "cm"),  axis.title=element_text(size=9), plot.title=element_text(size=9), axis.text=element_text(size=7))



LTR_Other <- ggplot(scatter, aes(x = Genome.size, y = LTR_Other, group=Species, color=Species, shape=Species)) + 
  geom_point(size = 2) +  
  labs(x="", y="% of genome", title="LTR (Other)") +
  scale_shape_manual(values=points) +
  scale_color_manual(values = mix5) +
  theme(plot.margin=unit(c(0,0,-0.3,0), "cm"),  axis.title=element_text(size=9), plot.title=element_text(size=9), axis.text=element_text(size=7))

rRNA <- ggplot(scatter, aes(x = Genome.size, y = rRNA, group=Species, color=Species, shape=Species)) + 
  geom_point(size = 2) +  
  labs(x="", y="", title="rRNA") +
  scale_shape_manual(values=points) +
  scale_color_manual(values = mix5) +
  theme(plot.margin=unit(c(0,0,-0.3,-0.3), "cm"),  axis.title=element_text(size=9), plot.title=element_text(size=9), axis.text=element_text(size=7))

Satellite <- ggplot(scatter, aes(x = Genome.size, y = Satellite, group=Species, color=Species, shape=Species)) + 
  geom_point(size = 2) +  
  labs(x="", y="", title="Satellite") +
  scale_shape_manual(values=points) +
  scale_color_manual(values = mix5) +
  theme(plot.margin=unit(c(0,0,-0.3,-0.3), "cm"),  axis.title=element_text(size=9), plot.title=element_text(size=9), axis.text=element_text(size=7))

Simple_repeat <- ggplot(scatter, aes(x = Genome.size, y = Simple_repeat, group=Species, color=Species, shape=Species)) + 
  geom_point(size = 2) +  
  labs(x="Genome size (Gbp)", y="", title="Simple repeat") +
  scale_shape_manual(values=points) +
  scale_color_manual(values = mix5) +
  theme(plot.margin=unit(c(0,0,-0.3,-0.3), "cm"),  axis.title=element_text(size=9), plot.title=element_text(size=9), axis.text=element_text(size=7))

Low_complexity <- ggplot(scatter, aes(x = Genome.size, y = Low_complexity, group=Species, color=Species, shape=Species)) + 
  geom_point(size = 2) +  
  labs(x="Genome size (Gbp)", y="", title="Low complexity") +
  scale_shape_manual(values=points) +
  scale_color_manual(values = mix5) +
  theme(plot.margin=unit(c(0,0.5,-0.3,-0.3), "cm"),  axis.title=element_text(size=9), plot.title=element_text(size=9), axis.text=element_text(size=7))



RC <- ggplot(scatter, aes(x = Genome.size, y = RC, group=Species, color=Species, shape=Species)) + 
  geom_point(size = 2) +  
  labs(x="Genome size (Gbp)", y="% of genome", title="Rolling Circle") +
  scale_shape_manual(values=points) +
  scale_color_manual(values = mix5) +
  theme(plot.margin=unit(c(0,0,0,0), "cm"),  axis.title=element_text(size=9), plot.title=element_text(size=9), axis.text=element_text(size=7))

DNA <- ggplot(scatter, aes(x = Genome.size, y = DNA, group=Species, color=Species, shape=Species)) + 
  geom_point(size = 2) +  
  labs(x="Genome size (Gbp)", y="", title="DNA") +
  scale_shape_manual(values=points) +
  scale_color_manual(values = mix5) +
  theme(plot.margin=unit(c(0,0,0,-0.3), "cm"),  axis.title=element_text(size=9), plot.title=element_text(size=9), axis.text=element_text(size=7))

 Unkown_repeat <- ggplot(scatter, aes(x = Genome.size, y = Unkown_repeat, group=Species, color=Species, shape=Species)) + 
  geom_point(size = 2) +  
  labs(x="Genome size (Gbp)", y="", title="Unknown repeat") +
  scale_shape_manual(values=points) +
  scale_color_manual(values = mix5) +
  theme(plot.margin=unit(c(0,0,0,-0.3), "cm"),  axis.title=element_text(size=9), plot.title=element_text(size=9), axis.text=element_text(size=7))


## This is one way to plot them all, but it's messy because each has a legend. Better to do the code below...
# grid.arrange(protein1, protein2, DNA, LINE_L1, LINE_Other, Low_complexity, LTR_Copia, LTR_Gypsy, LTR_Other, Non.repetitive, RC, rRNA, Satellite, Simple_repeat, Unkown_repeat, ncol=3) 


## To plot everything nicely, with only one legend (or none at all):

## Function to grab the legend out of one of the plots above
g_legend<-function(a.gplot){
  tmp <- ggplot_gtable(ggplot_build(a.gplot))
  leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
  legend <- tmp$grobs[[leg]]
  return(legend)}

mylegend<-g_legend(Non.repetitive)


## Plot all the ggplots together, with one legend (or not, see bottom of code). Turn pdf and dev.off lines on to save directly.

#pdf(file="scatter_final.pdf", height=10, width=10)
full <- grid.arrange(arrangeGrob(
						 Non.repetitive + theme(legend.position="none"),
                         	 proteinBoth + theme(legend.position="none"),
						 LINE + theme(legend.position="none"),
						 LTR_Gypsy + theme(legend.position="none"),
						 LTR_Copia + theme(legend.position="none"),
						 LTR_Other + theme(legend.position="none"),
						 rRNA + theme(legend.position="none"),
						 Satellite + theme(legend.position="none"),
						 Simple_repeat + theme(legend.position="none"),
						 Low_complexity + theme(legend.position="none"),
						 RC + theme(legend.position="none"),
                         	 DNA + theme(legend.position="none"),
						# protein1 + theme(legend.position="none"),
                        		# protein2 + theme(legend.position="none"),
						 Unkown_repeat + theme(legend.position="none"),
                         nrow=3),
            nrow=1, heights=c(5, 1))
#dev.off()

# Replace the last line with this if you want to print the legend (but it messes up all the formatting... white space issue that I can't figure out):  
            mylegend, nrow=1, heights=c(5, 1))









  
## EXAMPLES, NOT WHAT I ULTIMATELY USED!!!! ##
  
  ggplot(scatter, aes(x = Genome.size, y = DNA, group=Species, color=Species, shape=Species)) + 
  geom_point(size = 3) +  
  scale_shape_manual(values=1:nlevels(scatter$Species)) +
  scale_color_manual(values = mix4) +
  theme_gray()
  
## qplot scales by size... ggplot doesn't.
qplot(Sepal.Length,
      Petal.Length,
      data = iris,
      color = Species,
      size = Petal.Width)+
  theme_bw()+
  scale_color_manual(values = wes_palette("GrandBudapest"))
  
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + 
  geom_point(size = 3) + 
  scale_color_manual(values = wes_palette("GrandBudapest")) + 
  theme_gray()  
  
  
##stacked bar example
## This uses example data with the wrong headings
test <- read.csv("test.csv", header=TRUE)
cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
ggplot() +
   geom_bar(data= test, aes(y = value, x = cat, fill = cond), stat="identity", position='stack') +
   theme_bw() + 
   facet_grid( ~ year) + scale_fill_manual(values=wes_palette("Moonrise3"))

  
  
  
  
  