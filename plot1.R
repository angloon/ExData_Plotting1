
data=read.csv(file ='R/git/plotdata/household_power_consumption.txt', sep=";")


paste_datetime=paste(data$Date,data$Time)
data$Date=strptime(paste_datetime,format="%d/%m/%Y %H:%M:%S")

start_time=strptime("2007-02-01 00:00:00",format="%Y-%m-%d %H:%M:%S")
end_time=strptime("2007-02-03 00:00:00",format="%Y-%m-%d %H:%M:%S")
dataset=data[ data$Date>=start_time & data$Date<end_time, ]

png(file="R/git/ExData_Plotting1/plot1.png",width=480,height=480,bg='transparent')

hist(as.numeric(levels(dataset$Global_active_power))[dataset$Global_active_power],col='RED', xlab='Global Active Power (kilowatts)',main='Global Active Power')
dev.off()