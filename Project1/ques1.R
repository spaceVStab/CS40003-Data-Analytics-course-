library(readxl)
movie_train <- read_excel("C:/Users/Dev/Desktop/manish/MOVIE.xlsx")
View(movie_train)
colnames(movie_train)=movie_train[1,]
movie_train=movie_train[-1,]
library("dplyr", lib.loc="~/R/win-library/3.4")

#part 1
x = movie_train[movie_train$title_year<2016,]
x$imdb_score=as.integer(x$imdb_score)
mean(x$imdb_score, na.rm = T)
 
#part2
y = movie_train[movie_train$title_year == 2016,]
y=y[!is.na(y$color),]

#part3
pop_mean=6.417995
pop_sd=1.113503
sam_mean=6.399057
sam_size=106
Z=(sam_mean-pop_mean)/(pop_sd/sqrt(sam_size))
p <- 2 * pnorm(-abs(Z),0,1)
p
# if p>0.05, we accept the hypothesis.
