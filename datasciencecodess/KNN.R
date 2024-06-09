#KNN



getwd()
setwd("C:\\Users\\10ani\\Desktop\\DS_classes")
prostate_cancer=read.csv("Prostate_Cancer.csv")
prostate_cancer$id=NULL
str(prostate_cancer)
table(prostate_cancer$diagnosis_result)

normalize=function(x){
  return((x-min(x))/(max(x)-min(x)))}

lapply(prostate_cancer[,c(2:9)],normalize)

pros_cac=data.frame(lapply(prostate_cancer[,c(2:9)],normalize))



prostate_cac=cbind(prostate_cancer$diagnosis_result,pros_cac)

colnames(prostate_cac)

colnames(prostate_cac)[1]=c("diag")

ind=sort(sample(nrow(prostate_cac),nrow(prostate_cac)*0.8))        #sampling

train=prostate_cac[ind,]
test=prostate_cac[-ind,]

#install.packages("class")

library(class)

prc_pred=knn(train = train[,-1], test[,-1], cl=train$diag, k=5)    

View(prc_pred)

prc_pred

tbl=table(test$diag,prc_prd)

sum(diag(tbl))/sum(tbl)



