#LOGISTIC REGRESSION

getwd()
setwd("C:\\Users\\10ani\\Desktop\\DS_classes")
df= read.csv("HR_Data.csv")

str(df)
df1=df[,-c(21,22,23,24,25,26,27,28,29,30,31,32,33,34,35)]bLevel= as.factor(df$JobLevel)
df$JobSatisfaction= as.factor(df$JobSatisfaction)
df$PerformanceRating = as.factor(df$PerformanceRating)

df$Attrition_txt= NULL

library(plotly)

plot_ly(data=df,x=~df$Age,type ='histogram')
plot_ly(data=df,x=~df$MonthlyIncome,type ='histogram')

mean_sal = aggregate(df$MonthlyIncome, list(JobLevel = df$JobLevel), mean)
df_mean = merge(df, mean_sal)

names(df_mean)[20] = c("mean_sal")
df_mean$sal_diff = df_mean$MonthlyIncome-df_mean$mean_sal
df_mean$comp_ratio = df_mean$MonthlyIncome / df_mean$mean_sal

help("table")
cont = table(df_mean$PerformanceRating, df_mean$Attrition)
cont
write.csv(df_mean, "hello.csv")
str(df_mean)

corr = cor(df_mean[ ,-c(4,5,6,7,8,12)])
write.csv(corr, "hr_correlation.csv")

df_mean$YearsAtCompany = NULL

set.seed(345)
ind = sort(sample(nrow(df_mean), nrow(df_mean)*0.8))

train = df_mean[ind, ]
test = df_mean[-ind, ]

glm.fit = glm(Attrition~., train, family = binomial)

pred = predict(glm.fit, test,type="response") 

glm.new = step(glm.fit)

 
summary(glm.fit)
summary(glm.new)

conf_mat = table(test$Attrition, pred>0.5)
accuracy = sum(diag(conf_mat))/sum(conf_mat)
accuracy
i=0
for(i in seq(from=0.1, to=.7, by=0.05))
{
  conf_mat = table(test$Attrition, pred>i)
  accuracy = sum(diag(conf_mat))/sum(conf_mat)
  print(c(i,accuracy))
}

library("pscl")

pR2(glm.new)

# try to improve the McFadden value to 70
library(lmtest)
lrtest(glm.fit,glm.new)
# has less confidence.

library(pROC)

trainpred = glm.fit$fitted.values
trainROC = roc(response = train$Attrition, predictor = trainpred, plot = TRUE, auc = TRUE)
trainROC$auc


library(caret)
varImp(glm.fit)

table1 = table(df$JobSatisfaction, df$Attrition)

