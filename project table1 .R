install.packages("compareGroups")
library(compareGroups)

clean_data_0423 <- readRDS("/Users/cynthiaxinyiqian/Desktop/EPI204/clean_data_0423.rds")
data <- clean_data_0423

str(data)
##transfer to factor variable 
for(i in c(2,7:11,13,15,18,21,25,27)){
  data[,i] <- as.factor(data[,i])
}

data <- data[,-1]
str(data)
sex1 <- data[data$SEX==1,]
sex2 <- data[data$SEX==2,]

str(data)
table <- descrTable( BOOZE_q~ ., data = data)
table1 <- descrTable( BOOZE_q~ ., data = sex1)
table2 <- descrTable( BOOZE_q~ ., data = sex2)

export2csv(table, file='booze.csv')
export2csv(table1, file='booze1.csv')
export2csv(table2, file='booze2.csv')
