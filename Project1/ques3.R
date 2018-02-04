#ques 3
salary <- read_excel("C:/Users/Dev/Desktop/manish/SALARY.xlsx")
salary$BasePay = as.numeric(salary$BasePay)
salary$OtherPay = as.numeric(salary$OtherPay)
salary$OvertimePay = as.numeric(salary$OvertimePay)
salary$Benefits = as.numeric(salary$Benefits)
salary$Benefits[is.na(salary$Benefits)] <- 0
salary = salary[!is.na(salary$BasePay),]
salary = salary[salary$Year == 2014,]
model1 = lm(BasePay ~ OtherPay, data=salary)
summary(model1)
model2 = lm(BasePay ~ OvertimePay, data=salary)
summary(model2)
model3 = lm(BasePay ~ Benefits, data=salary)
summary(model3)
model4 = lm(BasePay ~ OvertimePay + OtherPay + Benefits, data=salary)
summary(model4)
cor(salary$BasePay,salary$OtherPay)
cor(salary$BasePay,salary$OvertimePay)
cor(salary$BasePay,salary$Benefits)




