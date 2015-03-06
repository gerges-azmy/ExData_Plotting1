
dataset<-read.table(file = "household_power_consumption.txt",sep = ";",header = TRUE,na.strings = c("?"),stringsAsFactors = FALSE)
dataset$Time<-strptime(paste(dataset$Date,dataset$Time),format="%d/%m/%Y %H:%M:%S")
dataset$Date<-as.Date(dataset$Date,format="%d/%m/%Y")
dataset.target<-dataset[dataset$Date==as.Date("2007-02-01")|dataset$Date==as.Date("2007-02-02"),]

png(filename ="plot2.png",width = 480, height = 480)

with(dataset.target,plot(Time,Global_active_power,type = "l",xlab= "", ylab ="Global Active Power(kilowatts)"))

dev.off()
