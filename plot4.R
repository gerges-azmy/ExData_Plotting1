dataset<-read.table(file = "household_power_consumption.txt",sep = ";",header = TRUE,na.strings = c("?"),stringsAsFactors = FALSE)
dataset$Time<-strptime(paste(dataset$Date,dataset$Time),format="%d/%m/%Y %H:%M:%S")
dataset$Date<-as.Date(dataset$Date,format="%d/%m/%Y")
dataset.target<-dataset[dataset$Date==as.Date("2007-02-01")|dataset$Date==as.Date("2007-02-02"),]

png(filename ="plot4.png",width = 480, height = 480)

par(mfrow = c(2,2))

with(dataset.target,plot(Time,Global_active_power,type = "l",xlab= "", ylab ="Global Active Power(kilowatts)"))

with(dataset.target,plot(Time,Voltage,type = "l",xlab= "datetime", ylab ="Voltage"))

with(dataset.target,plot(Time,Sub_metering_1,type = "l",xlab= "", ylab ="Energy sub metering"))
with(dataset.target,points(Time,Sub_metering_2,type = "l",col=c("red")))
with(dataset.target,points(Time,Sub_metering_3,type = "l",col=c("blue")))
legend("topright",lty =c(1,1,1),bty = "n", col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(dataset.target,plot(Time,Global_reactive_power,type = "l",xlab= "datetime"))

dev.off()
