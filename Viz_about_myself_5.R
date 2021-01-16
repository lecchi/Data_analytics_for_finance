library(maps)
library(geosphere)

# Dplyr for data wrangling and pipe function
library(dplyr)

# Destinations of my trip
Milan <- c(9.19, 45.46)
Rome <- c(12.49,41.9)
Johannesburg <- c(28.04,-26.20)
Durban <- c(31.02,-29.85)
Bangkok<-c(100.50,13.75)
Addis_Ababa<-c(38.75,8.98)

# Data frame
data <- rbind(Milan,Rome,Johannesburg,Durban,Bangkok,Addis_Ababa) %>% 
  as.data.frame()
colnames(data) <- c("long","lat")

# Show the cities on the map
map('world',
    col="wheat1", fill=TRUE, bg="white", lwd=0.05,
    mar=rep(0,4),border=0, ylim=c(-80,80) 
)

legend(-150, 0, legend=c("Starting/ending point", "Routes"),
       col=c("red", "peru"), pch=c(1,NA),lty =c(NA,2), cex=0.5,
       box.lty=4, title = "My best trip",title.col ="mediumblue")


#city points
points(x=data$long, y=data$lat, col="midnightblue", cex=0.6, pch=20) #cex size of dot
points(x=data$long[1], y=data$lat[1], col="red")
# Compute the connection between Milan and Rome
route1  <- gcIntermediate(Milan, Rome , n=50, addStartEnd=TRUE, breakAtDateLine=F)
route2 <- gcIntermediate(Rome, Johannesburg , n=50, addStartEnd=TRUE, breakAtDateLine=F)
route3 <- gcIntermediate(Johannesburg,Durban , n=50, addStartEnd=TRUE, breakAtDateLine=F)
route4 <- gcIntermediate(Durban,Bangkok , n=50, addStartEnd=TRUE, breakAtDateLine=F)
route5 <- gcIntermediate(Bangkok,Addis_Ababa, n=50, addStartEnd=TRUE, breakAtDateLine=F)
route6 <- gcIntermediate(Addis_Ababa,Milan, n=50, addStartEnd=TRUE, breakAtDateLine=F)
# Show this connection
lines(route1, col="peru",lty="dotted", lwd=0.4) #lwd=line thickness
lines(route2, col="peru",lty="dotted", lwd=0.4)
lines(route3, col="peru",lty="dotted", lwd=0.4)
lines(route4, col="peru",lty="dotted", lwd=0.4)
lines(route5, col="peru",lty="dotted", lwd=0.4)
lines(route6, col="peru",lty="dotted", lwd=0.4)


text(rownames(data), x=data$long, y=data$lat, adj = 1.2 ,  col="slateblue", cex=0.5)

