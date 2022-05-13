library(tidyverse)
library(survival)

orig <0 

dta <- readRDS("clean_data_0425.rds")
dim(dta)
dta$fu_time <- ifelse(!is.na(dta$DIE_YR),  dta$DIE_YR - dta$EXAM_YR,
                      dta$LAST_YR-dta$EXAM_YR)

dta$BOOZE_ord <- dta$BOOZE_q %>% as.numeric()

dta <- dta %>% filter(fu_time > 0)
# number
table(dta$BOOZE_q)
table(dta$BOOZE_q) %>% prop.table()

# sex
table(dta$SEX, dta$BOOZE_q)
table(dta$SEX, dta$BOOZE_q) %>% prop.table(margin = 2)
table(dta$SEX, dta$BOOZE_q) %>% chisq.test()

# age
options(pillar.sigfig = 7)
dta %>% group_by(BOOZE_q) %>%
    summarise(mean = mean(AGEYRS),
              SD = sd(AGEYRS))

aov(AGEYRS~BOOZE_q, data = dta)%>% summary()

# race
table(dta$RACE, dta$BOOZE_q)
table(dta$RACE, dta$BOOZE_q) %>% prop.table(margin = 2)
table(dta$RACE, dta$BOOZE_q) %>% chisq.test()

# year of schooling
dta %>% group_by(BOOZE_q) %>%
    summarise(mean = mean(GRADES),
              SD = sd(GRADES))
aov(GRADES~BOOZE_q, data = dta)%>% summary()

# maritsal status
table(dta$MARRY, dta$BOOZE_q)
table(dta$MARRY, dta$BOOZE_q) %>% prop.table(margin = 2)
table(dta$MARRY, dta$BOOZE_q) %>% chisq.test()

# smoking
dta %>% group_by(BOOZE_q) %>%
    summarise(mean = mean(AVGSMK),
              SD = sd(AVGSMK))
aov(GRADES~BOOZE_q, data = dta)%>% summary()

# hypertension
table(dta$HTN_REP, dta$BOOZE_q)
table(dta$HTN_REP, dta$BOOZE_q) %>% prop.table(margin = 2)
table(dta$HTN_REP, dta$BOOZE_q) %>% chisq.test()

# RBC
dta %>% group_by(BOOZE_q) %>%
    summarise(mean = mean(RBC),
              SD = sd(RBC))
aov(RBC~BOOZE_q, data =dta)

# DRMI
table(dta$DRMI, dta$BOOZE_q)
table(dta$DRMI, dta$BOOZE_q) %>% prop.table(margin = 2)
table(dta$DRMI, dta$BOOZE_q) %>% chisq.test()

# Diabetes
table(dta$DIAB, dta$BOOZE_q)
table(dta$DIAB, dta$BOOZE_q) %>% prop.table(margin = 2)
table(dta$DIAB, dta$BOOZE_q) %>% chisq.test()

#Size of place
table(dta$SIZE, dta$BOOZE_q)
table(dta$SIZE, dta$BOOZE_q) %>% prop.table(margin = 2)
table(dta$SIZE, dta$BOOZE_q) %>% chisq.test()

# SMSA
table(dta$SMSA, dta$BOOZE_q)
table(dta$SMSA, dta$BOOZE_q) %>% prop.table(margin = 2)
table(dta$SMSA, dta$BOOZE_q) %>% chisq.test()

# urban
table(dta$URBAN, dta$BOOZE_q)
table(dta$URBAN, dta$BOOZE_q) %>% prop.table(margin = 2)
table(dta$URBAN, dta$BOOZE_q) %>% chisq.test()
