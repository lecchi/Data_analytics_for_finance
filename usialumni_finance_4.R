library(ggplot2)

usi_finance <- data.frame( my_variables = c(rep("employed", 85),rep("other", 1),
                                            rep("studying",1), rep("unemployed",4)))
totals = c(85, 1, 1, 4)

student_status <- table(usi_finance$my_variables)

par(mar=c(2,2,2,2))
lb=paste0(round(prop.table(student_status)*100,2),"%")
p<-pie(student_status,labels = lb,col = rainbow(4))
legend(-2.1,0.4,legend=names(student_status),cex=0.7,yjust=0.2, xjust = -0.3,
       fill = rainbow(4), bty = "n")
title(main="USI Finance students status, class 2014-2020 ")
     

        
