# read the dataset and create a subset

dataDF <- read.table("C:/Users/Tumisang/Desktop/data/household_power_consumption.txt", sep = ";", header = TRUE)
head(dataDF)
dim(dataDF)
DateData <- subset(dataDF , dataDF$Date == "1/2/2007" | dataDF$Date == "2/2/2007")
head(DateData)
dim(DateData)

#create histogram
hist(as.numeric(as.character(DateData$Global_active_power)),
     col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")