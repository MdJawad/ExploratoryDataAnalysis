###Creating plot3
df<-read.table("household_power_consumption.txt", sep=";",na.strings="?",header=TRUE) 

## Convert the first column of the dataframe to Date
df$Date <- as.Date(df$Date, format="%d/%m/%Y")  

## Subset the dataframe for the required duration
df2<-subset(df,(df$Date >= as.Date("2007/02/01")) &(df$Date <= as.Date("2007/02/02")))

## Combine the Date and Time values so that the time series plots can be made
datetime <- paste(as.Date(df2$Date), df2$Time)

## Convert the pasted Date time to posix format
df2$Datetime <- as.POSIXct(datetime)

## Plotting the chart
with(df2, {plot(Sub_metering_1~Datetime, type="l", xlab="",ylab="Energy sub metering")
           lines(Sub_metering_2~Datetime, col="red")
           lines(Sub_metering_3~Datetime, col="blue") })

## Adding legends to the top right corner of the chart
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1) ,col=c("black","red","blue"))

## Write the image to the file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

