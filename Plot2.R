###Creating plot2
df<-read.table("household_power_consumption.txt", sep=";",na.strings="?",header=TRUE) 

## Convert the first column of the dataframe to Date
df$Date <- as.Date(df$Date, format="%d/%m/%Y")  

## Subset the dataframe for the required duration
df2<-subset(df,(df$Date >= as.Date("2007/02/01")) &(df$Date <= as.Date("2007/02/02")))

## Combine the Date and Time values so that the time series plots can be made
datetime <- paste(as.Date(df2$Date), df2$Time)

## Convert the pasted Date time to posix format
df2$Datetime <- as.POSIXct(datetime)

## Plot the time series chart
plot(df2$Global_active_power~df2$Datetime, type="l", xlab="",ylab="Global Active Power(Kilowatts)")

## Write the image to the file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

