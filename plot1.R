## Read household_power_consumption.txt
datos <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
datos_feb <- datos[datos$Date=='1/2/2007' | datos$Date=='2/2/2007',]

## open device
png(filename="plot1.png", width=480, height=480, units="px")

## plot data
hist(datos_feb$Global_active_power, main="Global Active Power", xlab ="Global Active Power (kilowatts)", col="red")

## Turn off device
x<-dev.off()