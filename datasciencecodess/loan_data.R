setwd("C:\\Users\\ANISH SINGH\\Desktop\\DS_classes\\DATASET")
read.csv("loan.csv")
df=read.csv("loan.csv")
str(df)
library(rpart)
##install.packages("e1071")
library(e1071)
##install.packages('caret')
##install.packages("randomForest")
library(caret)
library(randomForest)
##install.packages("data.table")
library(data.table)
##install.packages("h2o")
library(h2o)
##install.packages("plotly")
library(plotly)
dim(df)
str(df)
ln_data=fread("loan.csv",select=c("sub_grade","emp_length","recoveries","dti","total_paymnt","funded_amnt_inv","funded_amnt","installment",
                                  "last_pymnt_amnt","addr_state","total_pymnt_inv","out_prncp_inv","int_rate","loan_amnt","term","out_prncp","annual_inc","loan_status"))
ln_data=ln_data[complete.cases[(ln_data),]
ln_data$loan_status[ln_data$loan_status == 'Fully Paid'] <- '0'
ln_data$loan_status[ln_data$loan_status == 'Issued'] <- '0'
ln_data$loan_status[ln_data$loan_status == 'Charged Off'] <- '1'
ln_data$loan_status[ln_data$loan_status == "Doesn't meet the credit policy"] <- '1'
ln_data$loan_status[ln_data$loan_status == 'In Grace Period'] <- '1'
ln_data$loan_status[ln_data$loan_status == 'Late (16-30 days)'] <- '1'
ln_data$loan_status[ln_data$loan_status == 'Late (31-120 days)'] <- '1'
ln_data$term<-as.factor(ln_data$term)
ln_data$sub_grade<-as.factor(ln_data$sub_grade)
ln_data$addr_state<-as.factor(ln_data$addr_state)
ln_data$emp_length<-as.factor(ln_data$emp_length)
ln_data$loan_status<-as.factor(ln_data$loan_status)
sample <- floor(0.65*nrow(ln_data))
set.seed(777)
ind <- sort(sample(seq_len(nrow(ln_data)),size=sample))
train <- ln_data[ind,]
test <- ln_data[-ind,]
localH2O <- h2o.init(nthreads = -1)
h2o.init()
train.h2o <- as.h2o(train)
test.h2o <- as.h2o(test)
y.dep <- 17
x.indep = c(1:16)
set.seed(123)
system.time(rforest.model <- h2o.randomForest(y=y.dep,x=x.indep,training_frame = train.h2o,ntrees = 1000,max_depth = 4,seed = 123))
h2o.performance(rforest.model)
h2o.varimp(rforest.model)
Predict.rforest = as.data.frame(h2o.predict(rforest.model,test.h2o))
