# At first, set the appropriate directory that contains the data

data = read.table('./household_power_consumption.txt', header =TRUE, sep = ';', colClasses = c('factor', 'factor', rep('numeric', 7)), na.strings = '?')

data$Date = as.Date(data$Date, '%d/%m/%Y')
data = data[data$Date >= '2007-02-01' & data$Date <= '2007-02-02',]
data$Time = strptime(paste(as.character(data$Date), as.character(data$Time)), '%Y-%m-%d %H:%M:%S')

png('plot3.png')

#plot 3
plot(data$Sub_metering_1, type = 'l', col = 'black', xaxt = 'n', xlab = '', ylab = 'Energy sub metering')
lines(data$Sub_metering_2, type = 'l', col = 'red')
lines(data$Sub_metering_3, type = 'l', col = 'blue')
axis(1, at = c(1,l/2,l), labels = c('Thu', 'Fri', 'Sat'))
legend('topright', legend = c('Sub-metering1', 'Sub-metering2', 'Sub-metering3'), col = c('black', 'red', 'blue'), lty = c(1,1,1))

dev.off()