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
par(mfrow = c(2, 2), mar = c(4,5,2,0.5), oma = c(0.5,0,0,1))
with(dat_interest, {
  plot(Global_active_power ~ Convert_date, type = 'l', ylab = 'Global Active Power'
       , xlab = '')
  plot(Voltage ~ Convert_date, type = 'l', ylab = 'Voltage'
       , xlab = 'datetime')
  plot(Sub_metering_1 ~ Convert_date, type = 'l', ylab = 'Energy sub metering'
       , xlab = '')
  lines(Sub_metering_2 ~ Convert_date, col = 'red')
  lines(Sub_metering_3 ~ Convert_date, col = 'blue')
  legend('topright', col = c('black', 'red', 'blue'), lty = 1, lwd = 1, cex = 0.8, bty = 'n'
         ,legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
  plot(Global_reactive_power ~ Convert_date, type = 'l', ylab = 'Global_reactive_power'
       , xlab = 'datetime')

})

# Save png file
dev.copy(png, file="./Plot4.png", height=480, width=480)
dev.off()