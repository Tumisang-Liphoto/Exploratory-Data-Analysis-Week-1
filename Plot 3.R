# read the dataset and create a subset

dataDF <- read.table("C:/Users/Tumisang/Desktop/data/household_power_consumption.txt", sep = ";", header = TRUE)
head(dataDF)
dim(dataDF)
DateData <- subset(dataDF , dataDF$Date == "1/2/2007" | dataDF$Date == "2/2/2007")
head(DateData)
dim(DateData)

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
DateData$Date <- as.Date(DateData$Date, format="%d/%m/%Y")
DateData$Time <- strptime(DateData$Time, format="%H:%M:%S")
DateData[1:1440,"Time"] <- format(DateData[1:1440,"Time"],"2007-02-01 %H:%M:%S")
DateData[1441:2880,"Time"] <- format(DateData[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png(file="Plot 3.png")
# calling the basic plot functions
plot(DateData$Time,DateData$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(DateData,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(DateData,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(DateData,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"), main = "Energy sub-metering",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
