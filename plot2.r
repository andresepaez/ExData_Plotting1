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

#Plot 2

with(workdata4,plot(as.numeric(Global_active_power)~DateTime,ylab="Global Active Power (kilowatts)",type="l"))
dev.copy(png, file = "plot2.png")
dev.off()

