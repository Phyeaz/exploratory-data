# plot 2

install.packages("dplyr")
library(dplyr)

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "cc.zip")
hpc <- read.csv(unzip("cc.zip"), na.strings="?", header=T, sep=';', stringsAsFactors=F)
data1 <- hpc %>% filter(Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")


datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)


with(data1, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)",xlab="" )
})


dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

