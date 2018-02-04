library(readr)
cars <- read_csv("CARS.csv")
View(cars)
speed_am <- mean(cars$speed)
AM_dist <- mean(cars$dist)
GM_speed <- exp(mean(log(cars$speed)))
GM_dist <- exp(mean(log(cars$dist)))
HM_speed <- 1/mean(1/cars$speed)
HM_dist <- 1/mean(1/cars$dist)
median_speed <- median(cars$speed)
median_dist <- median(cars$dist)

mode_func <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

mode_speed <- mode_func(cars$speed)
mode_dist <- mode_func(cars$dist)

boxplot(cars$speed)
boxplot(cars$dist)
