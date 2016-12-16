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


png("plot3.png", width=504, height=504)  
plot3()
dev.off()