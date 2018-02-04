auto=read.table("AUTOMOBILES.csv",header=T,sep=',')

#utility function for calculating mode
mode_func <- function(v) {
  uniquev <- unique(v)
  uniquev[which.max(tabulate(match(v, uniquev)))]
}

# We chose "body-style" as nominal data and find the mode
body_mode=mode_func(auto$body.style)
body_mode

# we chose "num-of-cylinder" as ordinal data and find the mode 
mode_num_Of_Cylinder=mode_func(auto$num.of.cylinders)
mode_num_Of_Cylinder

# we chose "height" as interval data and calculate median 
median_height=median(auto$height)
median_height

# we are choosing "compression-ratio" as "Ratio data" and calculate mean
mean_compression_ratio=mean(auto$compression.ratio)
mean_compression_ratio
