#LINEAR REGRESSION


getwd()
setwd("C:\\Users\\10ani\\Downloads\\fwdshadatascienceproject")
#install.packages("calibrate")
library(calibrate)
cancer_data=read.csv("CANCER_DATA.csv")
cancer_data=cancer_data[complete.cases(cancer_data),]
cancer_data
plot(cancer_data$povertyPercent,cancer_data$TARGET_deathRate,col='blue')

library(plotly)
boxplot(cancer_data$TARGET_deathRate,col='bisque',main='boxplot')
plot_ly(data = cancer_data, x = ~povertyPercent , y = ~TARGET_deathRate,type = 'scatter',mode = 'markers')
plot_ly(data=cancer_data,x=cancer_data$AvgHouseholdSize,type ='histogram',mode='markers')

install.packages("plotly")
library(plotly)
plot_ly

qqnorm(cancer_data$avgDeathsPerYear)
qqline(cancer_data$avgDeathsPerYear,col='red')






#p value is high,confidence level is lower
#0.05 p value means  95% confidence level

