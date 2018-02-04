#ques 5
games <- read_excel("C:/Users/Dev/Desktop/manish/GAMES.xlsx")
View(games)
y = games[games$Rating == "T", ]
y=y[!is.na(y$Name),]
table(y$Genre)







