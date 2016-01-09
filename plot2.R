## Install data.table  lubridate
## Read household_power_consumption.txt
datos <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
datos_feb <- datos[datos$Date=='1/2/2007' | datos$Date=='2/2/2007',]

datos_feb$DateTime <- dmy(datos_feb$Date)+hms(datos_feb$Time)
datos_feb$DateTime<-as.POSIXlt(datos_feb$DateTime)

## open device
png(filename="plot3.png", width=480, height=480, units="px")

## plot data
plot(datos_feb$DateTime, datos_feb$Global_active_power, xlab = "", ylab="Global Active Power (kilowatts)", type="l")

## Turn off device
x<-dev.off()