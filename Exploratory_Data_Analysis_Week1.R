##List of useful commands I run to start 
##rm(list=ls())
##setwd("C://Users//WongD//Documents//R//R-3.3.1//r programming")


##Read file
  power<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

#data cleansing
#Keeping only date range 2/1/2007-2/2/2007
  #sapply(power)
  power$Date<-as.Date(power$Date, format="%d/%m/%Y")
  date1<-as.Date("01/02/2007",format="%d/%m/%Y")
  date2<-as.Date("02/02/2007",format="%d/%m/%Y")
  sub_power<-power[(power$Date>=date1 & power$Date <= date2),]

  #add timestamp variable to data by combining date and time
  sub_power <- transform(sub_power, timestamp=as.POSIXct(paste(Date, Time)))

#transform all power measure variables to numeric value
  #convert line by line
  #sub_power$Global_active_power <- as.numeric(as.character(sub_power$Global_active_power))
  #sub_power$Global_reactive_power <- as.numeric(as.character(sub_power$Global_reactive_power))
  #sub_power$Voltage <- as.numeric(as.character(sub_power$Voltage))
  #sub_power$Sub_metering_1 <- as.numeric(as.character(sub_power$Sub_metering_1))
  #sub_power$Sub_metering_2 <- as.numeric(as.character(sub_power$Sub_metering_2))
  #sub_power$Sub_metering_3 <- as.numeric(as.character(susubb_power$Sub_metering_3))
  
  #convert all via transform in 1 line
  sub_power<-transform(sub_power,Global_active_power=as.numeric(as.character(Global_active_power)),Global_reactive_power=as.numeric(as.character(Global_reactive_power)), Voltage=as.numeric(as.character(Voltage)), Sub_metering_1=as.numeric(as.character(Sub_metering_1)), Sub_metering_2=as.numeric(as.character(Sub_metering_2)), Sub_metering_3=as.numeric(as.character(Sub_metering_3)) )
  #sapply(sub_power1, class)

#plots
  
  #plot 1
  plot1<- function(){
    hist(sub_power$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
  }
 
  #plot 2
  plot2<-function(independent_variable, xaxis, yaxis){
    with(sub_power, plot(timestamp, independent_variable, type="l", xlab=xaxis, ylab=yaxis))
  }
  
  #plot 3
  plot3<-function(x="large"){
         with(sub_power, plot(timestamp, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
         lines(sub_power$timestamp, sub_power$Sub_metering_2, type="l", col="red")
         lines(sub_power$timestamp, sub_power$Sub_metering_3, type="l", col="blue")
         if(x=="small"){
             legend("topleft", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), bty="n", pt.cex=1, cex=1) 
           }
         else {
               legend("topleft", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), lwd=c(1,1), cex=1)
           }      
     }
  
  #plot 4
  plot4 <- function() {
    par(mfrow=c(2,2))
    plot2(sub_power$Global_active_power, "", "Global Active Power")
    plot2(sub_power$Voltage, "datetime", "Voltage")
    plot3("small")
    plot2(sub_power$Global_reactive_power, "datetime", "Global_reactive_power")
  }
  
  #output plots
  #output_plot <- function(x) {
  #  dev.copy(png, file=paste(x, ".png"), width=504, height=504)
  #  dev.off()
  #}
  
  png("plot1.png", width=504, height=504)
  plot1()
  dev.off()
  #output_plot("plot1")
  
  png("plot2.png", width=504, height=504)  
  plot2(sub_power$Global_active_power, "", "Global Active Power (kilowatts)")
  dev.off()
  #output_plot("plot2")
  
  png("plot3.png", width=504, height=504)  
  plot3()
  dev.off()
  #output_plot("plot3")

  png("plot4.png", width=504, height=504)   
  plot4()
  dev.off()
  #output_plot("plot4")
  
  
  