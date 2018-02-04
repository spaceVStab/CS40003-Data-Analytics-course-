#ques 4
#part 1
snacks <- read_excel("C:/Users/Dev/Desktop/manish/SNACKS.xls")
View(snacks)
cor(snacks, method="spearman")

#for coefficient of determination:
(cor(snacks, method="spearman")^2)*100

    

