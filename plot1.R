# At first, set the appropriate directory that contains the data

data = read.table('./household_power_consumption.txt', header =TRUE, sep = ';', colClasses = c('factor', 'factor', rep('numeric', 7)), na.strings = '?')

data$Date = as.Date(data$Date, '%d/%m/%Y')
data = data[data$Date >= '2007-02-01' & data$Date <= '2007-02-02',]
data$Time = strptime(paste(as.character(data$Date), as.character(data$Time)), '%Y-%m-%d %H:%M:%S')

png('plot1.png')

# plot 1
hist(data$Global_active_power, col = 'red', main = 'Global Active Power', xlab = 'Global active power(kilowatts)')

dev.off()