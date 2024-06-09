#ASSOCIATION MINING RULE


  
getwd()
setwd("C:\\Users\\10ani\\Desktop\\DS_classes")
load("titanic.raw.rdata")

write.csv(titanic.raw,"titanic.csv")

table(titanic.raw$Survived)

table(titanic.raw$Class)

table(titanic.raw$Age)

table(titanic.raw$Age,titanic.raw$Survived)

table(titanic.raw$Class,titanic.raw$Survived)

table(titanic.raw$Survived,titanic.raw$Sex,titanic.raw$Class)

#install.packages("arules")
library(arules)

rules=apriori(titanic.raw)

class(rules)

r=inspect(rules)

write.csv(r,"titanic.raw.csv")

rule2=apriori(titanic.raw,parameter = list(minlen=2,supp=.005,conf=0.8),
              appearance = list(rhs=c("Survived=No","Survived=Yes"),default="lhs"))

r2=inspect(rule2) 

write.csv(r2,"rule2.csv")


rule3=apriori(titanic.raw,parameter = list(supp=.00001,conf=0.00001))


#install.packages("arulesViz")

library(arulesViz)

plot(rule2,jitter=0)      # {if we r plotting rule2,show invalid}

