## Install data.table  lubridate
## Read household_power_consumption.txt
datos <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
datos_feb <- datos[datos$Date=='1/2/2007' | datos$Date=='2/2/2007',]

datos_feb$DateTime <- dmy(datos_feb$Date)+hms(datos_feb$Time)
datos_feb$DateTime<-as.POSIXlt(datos_feb$DateTime)

## open device
png(filename="plot4.png", width=480, height=480, units="px")

par(mfrow=c(2,2))

## plot 1
plot(datos_feb$DateTime, datos_feb$Global_active_power, xlab = "", ylab="Global Active Power (kilowatts)", type="l")

## plot 2
plot(datos_feb$DateTime, datos_feb$Voltage, xlab = "datetime", ylab="Voltage", type="l")

## plot 3
plot(datos_feb$DateTime, datos_feb$Sub_metering_1, xlab = "", ylab="Energy sub metering", col = "black", type="l")
lines(datos_feb$DateTime, datos_feb$Sub_metering_2, col = "red")
lines(datos_feb$DateTime, datos_feb$Sub_metering_3, col = "blue")

## Add legend
legend("topright",legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col = c('black','red','blue'),bty='n')

## plot 4
plot(datos_feb$DateTime, datos_feb$Global_reactive_power, xlab = "datetime", ylab="Global_reactive_power", type="l")


## Turn off device
x<-dev.off()