plot1<- function(){
  hist(sub_power$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
}

png("plot1.png", width=504, height=504)
plot1()
dev.off()

