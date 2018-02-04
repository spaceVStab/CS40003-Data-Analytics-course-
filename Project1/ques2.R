#ques2
NUTRITION <- read_excel("C:/Users/Dev/Desktop/manish/NUTRITION.xlsx")
View(NUTRITION)
NUTRITION = NUTRITION[-1,]
nu = NUTRITION
cor(as.integer(nu$sugars), as.integer(nu$rating))
nu$rating = as.integer(nu$rating)
nu$sugars = as.integer(nu$sugars)
model1=lm(rating ~ poly(sugars,1), data=nu)
summary(model1)
model2=lm(rating ~ poly(sugars,2), data=nu)
summary(model2)
model3=lm(rating ~ poly(sugars,3), data=nu)
summary(model3)




