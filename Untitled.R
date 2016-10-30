# get_abundance_matrix <-function(filepath = "species_list.csv", number_of_sites){
#   species_data <- read.csv("species_list.csv", header = TRUE, as.is = TRUE )
#   return(species_data)
# }
# print(species_data)


Desert.Walk.Sim <- function(num.its, TI){
  Time <- trunc(seq((0), to=(num.its*TI), by=((num.its*TI)/(num.its))))     #this works 0 to 500-->if you need to ajust to 5:500 5=TI
  xcor <- round(rnorm(num.its), digits = 2)                                 #generates 100 random numbers along a normal distribution
  xcor <- c(0, xcor)                                                        #added a zero here to make an origin
  ycor <- round(rnorm(num.its), digits = 2)                                 #generates 100 random numbers along a normal distribution
  ycor <- c(0, ycor)                                                        #again origin
  coor.bytime <<- cbind(Time,xcor,ycor)                                     #generate a matrix HINT the <<- instead of <- saves it to the global environment 
  sum.xcor <- cumsum(xcor)
  sum.ycor <- cumsum(ycor)
  for (i in Time) {
    Last.sumxcor <- lastnumber<-tail((sum.xcor), n=1)
    Last.sumycor <- lastnumber<-tail((sum.ycor), n=1)
    DistancePlot <- plot(sum.xcor,sum.ycor, type = "l", lty=2, 
                         xlab = "Longitude Coordinate",
                         ylab = "Latitude Coordinate",
                         main = "Similated Path for Lost Collegue")
    points(0,0, col="darkorchid1", pch=15, cex=1.25)                      #points is awesome...it adds them after the fact.
    points(Last.sumxcor, Last.sumycor, col="blue", pch=17, cex=1.25)
  }
} 


Desert.Walk.Sim(100,5)
