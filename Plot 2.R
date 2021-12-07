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

png(file="Plot 2.png")
# calling the basic plot function
plot(DateData$Time,as.numeric(as.character(DateData$Global_active_power)),
     type="l",xlab="",main = "Global Active Power VS Time",
     ylab="Global Active Power (kilowatts)") 

dev.off()