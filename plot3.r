library(data.table)
library(dplyr)
library(lubridate)
library(lattice)
workdirectory<-"D:/workspace/R/ExData_Plotting1/exdata_data_household_power_consumption"
setwd(workdirectory)
filetoread<-"household_power_consumption.txt"
housepower<-fread(filetoread)
workdirectory<-"D:/workspace/R/ExData_Plotting1"
setwd(workdirectory)

workdata1<-housepower[complete.cases(housepower),]

workdata2<-mutate(workdata1,DateTime=dmy_hms(paste(Date,Time)))

workdata3<-subset(workdata2,(DateTime>=ymd_hms("2007-02-01 00:00:00"))&(DateTime<=ymd_hms("2007-02-02 23:59:59")))

workdata4<-select(workdata3,-Date,-Time)


#Plot 3

with(workdata4,plot(as.numeric(Sub_metering_1)~DateTime,ylab="Energy sub metering",type="l"))
with(workdata4,lines(as.numeric(Sub_metering_2)~DateTime,type="l",col="Red"))
with(workdata4,lines(as.numeric(Sub_metering_3)~DateTime,type="l",col="Blue"))
legend("topright", pch = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file = "plot3.png")
dev.off()

