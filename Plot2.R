# Reading full dataset
dat <- read.table('household_power_consumption.txt', header = TRUE, sep = ';'
                  , stringsAsFactors = FALSE, check.names = FALSE,
                  comment.char = '')
# Time format convert
dat$Date <- as.Date(dat$Date, format = '%d/%m/%Y')

# Subsetting data
dat_interest <- dat[dat$Date >= '2007-02-01' & dat$Date <= '2007-02-02',]
time_convert <- paste(as.Date(dat_interest$Date), dat_interest$Time)
dat_interest$Convert_date <- as.POSIXct(time_convert)

plot(as.numeric(dat_interest$Global_active_power) ~ dat_interest$Convert_date, type = 'l',
     ylab = 'Global Active Power (kilowatts)', xlab = '')

# Save png file
dev.copy(png, file="./Plot2.png", height=480, width=480)
dev.off()

