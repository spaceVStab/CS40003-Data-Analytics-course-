library(readxl)
flower <- read_excel("IRIS.xlsx")
View(flower)

#FOR POPULATION
sl_mean <- mean(flower$SepalLengthCm)
sl_var <- var(flower$SepalLengthCm)
sw_mean <- mean(flower$SepalWidthCm)
sw_var <- var(flower$SepalWidthCm)
pl_mean <- mean(flower$PetalLengthCm)
pl_var <-var(flower$PetalLengthCm)
pw_mean <- mean(flower$PetalWidthCm)
pw_var <- var(flower$PetalWidthCm)

#choosing Random SAMPLE
sample_flower <- flower[sample(nrow(flower), 50), ]
View(sample_flower)

# Sample Data
sl_smean <- mean(sample_flower$SepalLengthCm)
sl_svar <- var(sample_flower$SepalLengthCm)
sw_smean <- mean(sample_flower$SepalWidthCm)
sw_svar <- var(sample_flower$SepalWidthCm)
pl_smean <- mean(sample_flower$PetalLengthCm)
pl_svar <-var(sample_flower$PetalLengthCm)
pw_smean <- mean(sample_flower$PetalWidthCm)
pw_svar <- var(sample_flower$PetalWidthCm)













