install.packages("RColorBrewer")
install.packages("rworldmap")
install.packages("readxl")
install.packages('rworldmap',dependencies=TRUE) 
install.packages(heat)
library(RColorBrewer)
library(rworldmap)
library(readxl)

My_Map_Data <- read.csv("CO_data.csv", sep=",")

#aggregation by country 
My_Map_Data<- aggregate(My_Map_Data$CO2_emission/1000, by=list(Country=My_Map_Data$Country,code=My_Map_Data$code),FUN=sum)

colnames(My_Map_Data)[colnames(My_Map_Data)=="x"]<- "Co2 emissions 2017"

My_World_Map<-joinCountryData2Map( My_Map_Data,
                                   
                                   nameJoinColumn = "code",
                                   joinCode = "ISO3")


mapDevice('x11') #create a map shaped device
numCats <- 50 #set number of categories to use
my_color <- colorRampPalette(c("lightgreen","orange","red","black"))
color<-my_color(50)
Map_parameters<-mapCountryData(My_World_Map, 
               nameColumnToPlot="Co2 emissions 2017", 
               catMethod="pretty", 
               numCats=numCats, 
               colourPalette=color,
               addLegend= FALSE,
               mapTitle = "CO2 Emissions by country, 2017 in M of tons"
               
               
)

do.call( addMapLegend, c( Map_parameters,
                           legendLabels="all",
                           labelFontSize=0.7,
                           legendWidth=0.5,
                           legendShrink=0.7
                          
                            ))


