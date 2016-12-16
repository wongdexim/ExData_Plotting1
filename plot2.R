#plot 2
plot2<-function(independent_variable, xaxis, yaxis){
  with(sub_power, plot(timestamp, independent_variable, type="l", xlab=xaxis, ylab=yaxis))
}

png("plot2.png", width=504, height=504)  
plot2(sub_power$Global_active_power, "", "Global Active Power (kilowatts)")
dev.off()