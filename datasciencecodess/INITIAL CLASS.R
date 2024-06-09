x=1
x
#x
xy=1:20
y
x+y
rbind(x+y)
rbind(x,y)
cbind(x,y)
rbind(x+y,y/2)
rbind(exp(x),y/2)
a=rbind(exp(x),y/2)
class(a)

a=e^x
exp^2
log(2)
(exp(x)

exp(1)
exp(x)
d=200
area=pi*((d/2)^2)
area
getwd()
a=2+3i
a
b=3+2i
b
a+b
a=c(1:3)
a
class(a)
a=c("ANISH")
class(a)
a=c(TRUE,FALSE)
class(a)
a=c("a:z")
a
a=c(1,2,3,4,0)
as.character(a)
as.logical(a)
as.complex(a)
a=c("a","b")
as.numeric(a)
saumo=list(1,"a",TRUE,1+9i)
saumo
m=1:6
dim(m)=c(2,3)
m
# m1=matrix(1:100,nrow=10,ncol=10,byrow=TRUE)
m1
m2=matrix(1:100,nrow=10,ncol=10,byrow=TRUE)
m2
mi=matrix(c(9+2i, 10+4i, 9.8, 3+2i),nrow=2,ncol=2)
mi
m2=matrix(c(2+2i,5+4i),nrow=2,ncol=2)
m2
mi+m2
mi*m2
mi**m2
add = mi*m2












setwd("C:\\Users\\10ani\\Desktop\\DS_classes")
test_data=read.csv("TEST_DATA.csv")
test_data
test_data_wt_wo=test_data[, -4]
test_data_wt_wo
test_data2=test_data[,c(1,2)]
test_data2


# class(test_data)

dim(test_data)
test_data[2,2]
nrow(test_data)
nrow
test_data[3,]
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
test3=test_data[test_data$AGE<28 ,]
test3
test_data$GRADE=c("A","B","C","D")
test_data
test_d=cbind(test_data$WEIGHT,test_data_wt_wo)




-------------------------------------------------------
  subject_name=c("RAM","SAM","MOHAN")
temperature=c(99.0,98.7,101.2)
flu_status=c(TRUE,FALSE,TRUE)
temperature[2]
subject_name[3]
name=factor(c("GENDER"))
name
gender=factor(c("MALE","FEMALE"))
gender
names=list(c("ANISH",25,2+3i,0.92))
names
subject_names=data.frame(c(subject_name,temperature,flu_status))
subject_names
x=data.frame(foo=1:4,bar=c(T,T,F,F))
x
subject_names=data.frame(asr=1:7,ansh=c(23,34,45,66,54,33,23))
subject_names
100*pi
  
  
