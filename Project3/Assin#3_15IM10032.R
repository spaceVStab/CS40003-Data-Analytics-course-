library(data.table)
library(dplyr)
library(ggplot2)
library(caret)
library(stringr)
library(reshape2)
library(e1071)
library(rpart)

churn = read.csv("Customer Churn Data (3).csv", header = TRUE, sep = ",")

#renaming true and false by 1 and 0
churn$churn=str_trim(churn$churn)
churn$international_plan=str_trim(churn$international_plan)
churn$voice_mail_plan=str_trim(churn$voice_mail_plan)
churn$international_plan=ifelse(churn$international_plan=="yes",1,0)
churn$voice_mail_plan=ifelse(churn$voice_mail_plan=="yes",1,0)
churn$churn=ifelse(churn$churn=="True", 1, 0)

#new variables
churn$total_minutes=churn$total_day_minutes+churn$total_eve_minutes+churn$total_night_minutes
churn$total_charge=churn$total_day_charge+churn$total_eve_charge+churn$total_night_charge
churn$day_rate=churn$total_day_charge/churn$total_day_minutes
churn$eve_rate=churn$total_eve_charge/churn$total_eve_minutes
churn$night_rate=churn$total_night_charge/churn$total_night_minutes
churn$init_rate=churn$total_intl_charge/churn$total_intl_minutes

#changing the NAs values
churn$day_rate[is.na(churn$day_rate)]=mean(churn$day_rate, na.rm = TRUE)
churn$night_rate[is.na(churn$night_rate)]=mean(churn$night_rate, na.rm = TRUE)
churn$eve_rate[is.na(churn$eve_rate)]=mean(churn$eve_rate, na.rm = TRUE)
churn$init_rate[is.na(churn$init_rate)]=mean(churn$init_rate, na.rm = TRUE)

#partitioning the datas
set.seed(123)
trainIndex <- createDataPartition(churn$churn, p = .8, list = FALSE)
churnTrain=churn[ trainIndex,]
churnTest=churn[-trainIndex,]

churn$churn <- factor(churn$churn)
churnTrain$churn <- factor(churnTrain$churn)
churnTest$churn <- factor(churnTest$churn)

churnTrain <- churnTrain[,-c(1,2,5)]
churnTest <- churnTest[,-c(1,2,5)]

#naive bayes
nb_model <- naiveBayes(churn~., data=churnTrain)
nb_test_predict <- predict(nb_model,churnTest)
#confusion matrix for Bayes
table(pred = nb_test_predict, true = churnTest$churn)

#accuracy
accuracy<- (table(pred = nb_test_predict, true = churnTest$churn)[1]+table(pred = nb_test_predict, true = churnTest$churn)[4])/nrow(churnTest)
accuracy

#decision trees IC3
trees_model <- rpart(churn~., data = churnTrain)
#plot(trees_model)
trees_predict <- predict(trees_model, churnTest)
trees_predict <- ifelse(trees_predict[,1]>=0.5,0,1)
table(predicted = trees_predict, true = churnTest$churn)
accuracy<- (table(pred = trees_predict, true = churnTest$churn)[1]+table(pred = trees_predict, true = churnTest$churn)[4])/nrow(churnTest)
accuracy

#svm
model_svm <- svm(churn ~., churnTrain)
svm_predict <- predict(model_svm, churnTest)
table(predicted = svm_predict, true = churnTest$churn)
accuracy<- (table(pred = svm_predict, true = churnTest$churn)[1]+table(pred = svm_predict, true = churnTest$churn)[4])/nrow(churnTest)
accuracy

confusionMatrix(nb_test_predict, churnTest$churn)
confusionMatrix(trees_predict, churnTest$churn)
confusionMatrix(svm_predict, churnTest$churn)









