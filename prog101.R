##########################################################################
## Driver: (Name) (GitHub Handle)                                       ##
## Navigator: (Name) (GitHub Handle)                                    ##
## Date: (YYYY-MM-DD)                                                   ##
##########################################################################

library(marinecs100b)

# Guiding questions -------------------------------------------------------

# What does KEFJ stand for?
# Kenai Fjords

# How was temperature monitored?
# HOBO V2 temperature loggers at each rocky site recording temperature every
# 20, 30, or 60 min.

#What's the difference between absolute temperature and temperature anomaly?
#"Absolute temperature" refers to the actual measured temperature on a scale
#like Kelvin, while a "temperature anomaly" represents the deviation of a
#measured temperature from a reference baseline, usually a long-term average

# Begin exploring ---------------------------------------------------------

# How many kefj_* vectors are there?
?kefj
# 6 vectors

# How long are they?
# 2187966

# What do they represent?
# Temperature readings from five sites in Kenai Fjords 2007-2024.

# Link to sketch
?table()
kefj_site

kefj_datetime <- kefj_datetime[kefj_site == "Aialik"]
most_common_interval <- kefj_datetime[2:length(kefj_datetime)] - kefj_datetime[1:length(kefj_datetime)-1]
table(most_common_interval)
# most common interval is 30


# Problem decomposition ---------------------------------------------------

# When and where did the hottest and coldest air temperature readings happen?
which.max(kefj_temperature)
kefj_temperature[158962]
kefj_site[158962]
#36.092, Aialik
which.min(kefj_temperature)
kefj_temperature[63809]
kefj_site[63809]
#-11.613, Aialik

# Link to sketch

# Plot the hottest day
hottest_idx <- which.max(kefj_temperature)
hottest_time <- kefj_datetime[hottest_idx]
hottest_site <- kefj_site[hottest_idx]
hotday_start <- as.POSIXct("2018-07-03 00:00", tz = "Etc/GMT+8")
hotday_end <- as.POSIXct("2018-07-03 23:59", tz = "Etc/GMT+8")
hotday_idx <- which(kefj_site == hottest_site &
  kefj_datetime >= hotday_start &
  kefj_datetime <= hotday_end)
hotday_datetime <- kefj_datetime[hotday_idx]
hotday_temperature <- kefj_temperature[hotday_idx]
hotday_exposure <- kefj_exposure[hotday_idx]
plot_kefj(hotday_datetime, hotday_temperature, hotday_exposure)
http://127.0.0.1:43697/graphics/3680fe23-2902-49a8-9b02-399f304dfec6.png

# Repeat for the coldest day
coldest_idx <- which.min(kefj_temperature)
coldest_time <- kefj_datetime[coldest_idx]
coldest_site <- kefj_site[coldest_idx]
coldday_start <- as.POSIXct("2013-01-27 00:00", tz = "Etc/GMT+8")
coldday_end <- as.POSIXct("2013-01-27 23:59", tz = "Etc/GMT+8")
coldday_idx <- which(kefj_site == coldest_site &
                      kefj_datetime >= coldday_start &
                      kefj_datetime <= coldday_end)
coldday_datetime <- kefj_datetime[coldday_idx]
coldday_temperature <- kefj_temperature[coldday_idx]
coldday_exposure <- kefj_exposure[coldday_idx]
plot_kefj(coldday_datetime, coldday_temperature, coldday_exposure)
http://127.0.0.1:43697/graphics/ead93626-2dee-406a-b63c-811b0a844454.png

# What patterns do you notice in time, temperature, and exposure? Do those
# patterns match your intuition, or do they differ?

# How did Traiger et al. define extreme temperature exposure?

# Translate their written description to code and calculate the extreme heat
# exposure for the hottest day.
hotday_exposure

# Compare your answer to the visualization you made. Does it look right to you?

# Repeat this process for extreme cold exposure on the coldest day.
coldday_exposure


# Putting it together -----------------------------------------------------

# Link to sketch

# Pick one site and one season. What were the extreme heat and cold exposure at
# that site in that season?

# Repeat for a different site and a different season.

# Optional extension: Traiger et al. (2022) also calculated water temperature
# anomalies. Consider how you could do that. Make a sketch showing which vectors
# you would need and how you would use them. Write code to get the temperature
# anomalies for one site in one season in one year.
