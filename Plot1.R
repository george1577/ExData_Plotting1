# Reading full dataset
dat <- read.table('household_power_consumption.txt', header = TRUE, sep = ';'
                  , stringsAsFactors = FALSE, check.names = FALSE,
                  comment.char = '')

# Subsetting data
dat$Date <- as.Date(dat$Date, format = '%d/%m/%Y')
dat_interest <- dat[dat$Date >= '2007-02-01' & dat$Date <= '2007-02-02',]
hist(as.numeric(dat_interest$Global_active_power), col = 'red'
     ,main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)'
     )

# Save png file
dev.copy(png, file="./Plot1.png", height=480, width=480)
dev.off()

