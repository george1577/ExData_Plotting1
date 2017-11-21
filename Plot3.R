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

# Plotting
plot(as.numeric(dat_interest$Sub_metering_1) ~ dat_interest$Convert_date, 
    type = 'l', ylab = 'Energy sub metering',xlab = '' )
lines(as.numeric(dat_interest$Sub_metering_2) ~ dat_interest$Convert_date, col = 'red')
lines(as.numeric(dat_interest$Sub_metering_3) ~ dat_interest$Convert_date, col = 'blue')

legend('topright', col = c('black', 'red', 'blue'), lty = 1, lwd = 1, 
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

# Save png file
dev.copy(png, file="./Plot3.png", height=480, width=480)
dev.off()