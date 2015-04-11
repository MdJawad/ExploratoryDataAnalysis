###Creating plot1
df<-read.table("household_power_consumption.txt", sep=";",na.strings="?",header=TRUE) 

## Convert the first column of the dataframe to Date
df$Date <- as.Date(df$Date, format="%d/%m/%Y")  

## Subset the dataframe for the required duration
df2<-subset(df,(df$Date >= as.Date("2007/02/01")) &(df$Date <= as.Date("2007/02/02")))

##Plot the histogram
hist(as.numeric(as.character(df2$Global_active_power)), col="red", main="Global active power")

##Copy the histogram to the disk as png image
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
