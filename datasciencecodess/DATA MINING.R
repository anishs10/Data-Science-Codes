#data mining



#install.packages("tm")
#install.packages("wordcloud")



library(tm)
library(wordcloud)

getwd()
setwd("C:\\Users\\10ani\\Desktop\\DS_classes")

comments=read.csv("comments.csv")

myCorpus=Corpus(VectorSource(comments$Comments))

class(myCorpus)

myCorpus[[1]][1]  #convert to lower case
myCorpus[[1]][2]

strwrap(myCorpus)


myCorpus=tm_map(myCorpus,content_transformer(tolower))

myCorpus=tm_map(myCorpus,removeNumbers)   #remove numbers


myCorpus=tm_map(myCorpus,removeWords,stopwords("english"))       #remove stopwords


myCorpus=tm_map(myCorpus,removePunctuation)   #remove punctuations



myCorpus=tm_map(myCorpus,stemDocument)    #carry out steming


myCorpus=tm_map(myCorpus,removeWords,c("get","took","gave"))      #remove selected stopwords


myCorpus=tm_map(myCorpus,stripWhitespace)      #remove white spaces


head(myCorpus,13)   #it is not a dataframe


tdm=TermDocumentMatrix(myCorpus)

mat=as.matrix(tdm)


v=sort(rowSums(mat),decreasing = TRUE)

d=data.frame(word=names(v),freq=v)


wordcloud(d$word,d$freq)

#skip random order

wordcloud(d$word,d$freq,random.order = FALSE,rot.per = 0.3)

#control location

wordcloud(d$word,d$freq,random.order = FALSE,rot.per = 0.3,scale=c(4,0.5),max.words = 20,colors = brewer.pal(8,"Dark2"))


title (main="WORD CLOUD")

