library(readxl)
eq <- read_excel("EARTHQUAKE.xlsx")
view(eq)

#for magnitude
#Five Point Summary
fivenum(eq$Magnitude)
#To remove outliers in boxplot
result <- boxplot(eq$Magnitude, outline=FALSE)
result
#mean excluding outliers
mean(eq$Magnitude[!eq$Magnitude %in% result$out])
result$stats

#for depth/KM
#Five Point Summary
fivenum(eq$`Depth/Km`)
result_depth <- boxplot(eq$`Depth/Km`, outline=FALSE)
result_depth
#mean excluding outliers
mean(eq$`Depth/Km`[!eq$`Depth/Km` %in% result_depth$out])
result_depth$stats
