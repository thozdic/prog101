# Create vectors with the c() (short for combine)
barnacle_density_m2 <- c(2.1, 1.9, 3.0, 4.2)
site <- c("Point Arena", "Point Conception", "San Clemente", "Catalina")
region <- c("NorCal", "CenCal", "SoCal", "SoCal")

# Use square brackets to index (i.e., pull values out)
barnacle_density_m2[1]
barnacle_density_m2[4]

# Pull out slices using the : operator
# first two
barnacle_density_m2[1:2]
str(barnacle_density_m2[1:2])
site[3:4]

# Pull out non-contiguous indices with c()
barnacle_density_m2[c(1,3)]

# Output vector sizes

# n -> n (element-wise transformations)
sqrt(barnacle_density_m2)
toupper(site)

# n -> 1 (summaries or aggregations)
length(barnacle_density_m2)
max(barnacle_density_m2)
min(barnacle_density_m2)

# n -> m (other)
unique(region)
