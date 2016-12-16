plot4 <- function() {
  par(mfrow=c(2,2))
  plot2(sub_power$Global_active_power, "", "Global Active Power")
  plot2(sub_power$Voltage, "datetime", "Voltage")
  plot3("small")
  plot2(sub_power$Global_reactive_power, "datetime", "Global_reactive_power")
}

png("plot4.png", width=504, height=504)   
plot4()
dev.off()