library(readr)
library(dplyr)
library(quantmod)
#get VIX from csv, Bloomberg
my_vix<-read.csv("VIX2.csv")



#get SP500 from quantmod
starting_date <-"2019-11-18"
ending_date   <-"2020-11-19"
sp_500<- getSymbols("^GSPC", from= starting_date, to=ending_date)
my_sp500_data<- ( GSPC$GSPC.Adjusted)


#convert in date format
my_vix$Dates <- as.Date(my_vix$Dates,
                               format = "%m/%d/%y")
#my data frame final
df<-cbind.data.frame(my_vix,my_sp500_data)
colnames(df)[3] <- "SP500"

ggplot(data = df, aes(x = Dates, y = VIX)) +
  geom_line(aes(y=VIX,color="VIX")) +
  geom_line(aes(y=SP500/50,color="SP500"))+
  scale_y_continuous(sec.axis = sec_axis(~.*50))+
  
  labs(title = "S&P 500 Index and VIX", 
       subtitle = "from 11/18/2019 to 11/18/2020",
       x = "Dates", y = "VIX (left) S&P 500 (right)") +
  
   theme(axis.title = element_text(family = "serif"),
        plot.title = element_text(hjust = 0.5, family = "serif",
                                  face = "bold"),
        legend.position = c(0.1, 0.85),                                 
        legend.title = element_blank(),
        legend.background = element_rect(fill=alpha("grey", 0), 
                                         color = "grey", size = 0.4, 
                                         linetype="solid"),
        legend.text = element_text(family = "serif", face = "bold"),
        legend.key = element_rect(color = "transparent")) +
  theme(legend.key.size = unit(0.3, "cm"))

  
  
  
 

