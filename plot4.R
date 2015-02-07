data=read.csv(file ='R/git/plotdata/household_power_consumption.txt', sep=";")

paste_datetime=paste(data$Date,data$Time)
data$Date=strptime(paste_datetime,format="%d/%m/%Y %H:%M:%S")

start_time=strptime("2007-02-01 00:00:00",format="%Y-%m-%d %H:%M:%S")
end_time=strptime("2007-02-03 00:00:00",format="%Y-%m-%d %H:%M:%S")
dataset=data[ data$Date>=start_time & data$Date<end_time, ]

png(file="R/git/ExData_Plotting1/plot4.png",width=480,height=480,bg='transparent')

datasetn=dataset

datasetn$Sub_metering_1=as.numeric(levels(dataset$Sub_metering_1))[dataset$Sub_metering_1]
datasetn$Sub_metering_2=as.numeric(levels(dataset$Sub_metering_2))[dataset$Sub_metering_2]

par(mfcol=c(2,2))

#Plot1
yaxis=as.numeric(levels(dataset$Global_active_power))[dataset$Global_active_power]
plot(dataset$Date,yaxis,type='l',ylab='Global active power',xlab='')

#plot2
with(datasetn, plot(Date,Sub_metering_1,xlab="",ylab="Energy sub metering",type='l'))
with(datasetn, points(Date,Sub_metering_2,col="red",type='l'))
with(datasetn, points(Date,Sub_metering_3,col="blue",type='l'))
legend("topright", lwd=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty='n')

#plot3
datasetn$Voltage=as.numeric(levels(dataset$Voltage))[dataset$Voltage]
with(datasetn, plot(Date,Voltage,xlab="datetime",type='l'))

#plot4
datasetn$Global_reactive_power=as.numeric(levels(dataset$Global_reactive_power))[dataset$Global_reactive_power]
with(datasetn, plot(Date,Global_reactive_power,xlab="datetime",type='l'))

dev.off()

