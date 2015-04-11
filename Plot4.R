###Creating plot4
df<-read.table("household_power_consumption.txt", sep=";",na.strings="?",header=TRUE) 

## Convert the first column of the dataframe to Date
df$Date <- as.Date(df$Date, format="%d/%m/%Y")  

## Subset the dataframe for the required duration
df2<-subset(df,(df$Date >= as.Date("2007/02/01")) &(df$Date <= as.Date("2007/02/02")))

## Combine the Date and Time values so that the time series plots can be made
datetime <- paste(as.Date(df2$Date), df2$Time)

## Convert the pasted Date time to posix format
df2$Datetime <- as.POSIXct(datetime)

## 1. Create each plots individually and then patch them up so that multimap will be created
par (mfrow= c(2,2))
## First subplot 
plot(df2$Global_active_power~df2$Datetime, type="l", xlab="",ylab="Global Active Power")

## Second sub plot
plot(df2$Voltage~df2$Datetime, type="l", xlab="datetime",ylab="Voltage")


## Third subplot
with(df2, {plot(Sub_metering_1~Datetime, type="l", xlab="",ylab="Energy sub metering")
           lines(Sub_metering_2~Datetime, col="red")
           lines(Sub_metering_3~Datetime, col="blue") })
## Setup the legends for the chart
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1) ,col=c("black","red","blue"))

## 4th sub plot
plot(df2$Global_reactive_power~df2$Datetime, type="l", xlab="datetime",ylab="Global_reactive_power")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

