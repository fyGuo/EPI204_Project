library(readxl) 
NHANES2 <- read.csv("Desktop/EPI204/NHANES2.csv") #read data from a .csv file.
head(NHANES2) # preview the = dataset
str(NHANES2) #  check the structure of the data frame to see what kind of data we have.

### create a new dataset"data" with  the variables related to  research interest
data <- NHANES2[, c('ROWNAMES','SEX','ICD9_MT','AGEDIE','SIZE','URBAN','RACE','MARRY','DEATH','AGEYRS','BEDROOMS','DIETVITC','PERSONS','RECEX','SATFAT','SMSA','ROOMPERS','LANGUAGE','GRADES','SCHOOL','AVGSMK')]
head(data) # preview the new dataset
str(data) #  check the structure of the data frame to see what kind of data we have in the new dataset

### delete the objects which have any missing data 
data%>% summary()
# from the output, we can know there is  missing data in URBAN, DEATH,LANGUAGE,SCHOOL
# we ignore NA in ICD9_MT and AGEDIE, since NA does not represent missing data here.
data$URBAN %>% table()
data$DEATH %>% table()
data$LANGUAGE %>% table()
data$SCHOOL %>% table()

dta <- data[complete.cases(data[, c('URBAN','DEATH','LANGUAGE','SCHOOL')]), ] #delete the objects which have any missing data in URBAN, DEATH,LANGUAGE,SCHOOL

#EDA



