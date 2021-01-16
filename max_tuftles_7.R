#china CO2 emissions in millions of tones

emissions_by_year<-read.csv("china_emissions.csv")

x_axis<-emissions_by_year$year
y_axis<-emissions_by_year$emissions/1000000
y_axis<-round(y_axis,0)



plot(y_axis ~ x_axis, axes=F, xlab="", ylab="", pch=1, type="p")
axis(1, at=x_axis, label=x_axis, tick=F, family="serif")
axis(2, at=c(3200,"","","","","",5126,"","","","",7759,"","","","","","","",9900),label=y_axis, tick=F, las=1, family="serif")
title("China CO2 emissions in millions of tons")


