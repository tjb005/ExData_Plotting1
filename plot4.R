# Exploratory Data Analysis - Course Project 1 - Plot 1
# Tim B

## Confirm ExData_Plotting1 data is in working directory
if(file.exists("./household_power_consumption.txt")){
  
  ## Install Missing Packages
  list.of.packages <- c("dplyr", "tidyr", "lubridate")
  new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
  if(length(new.packages)) install.packages(new.packages)
  
  ## Call Libraries
  library("dplyr")
  library("tidyr")
  library("lubridate")
  
  # Read data
  hpc<-as.data.frame(read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings="?"))
  
  # Filter data
  hpc<-tbl_df(hpc)
  hpc<-mutate(hpc, DateTime=paste(Date, Time))
  hpc<-mutate(hpc, DateTime=dmy_hms(DateTime))
  hpc_feb<-filter(hpc, date(DateTime) == "2007-02-01" | date(DateTime) == "2007-02-02")
  hpc_feb<-as.data.frame(hpc_feb)
  
  # Set paramaters for plot
  png(file="plot4.png")
  par(mfrow=c(2,2))
  
  #DateTime Vs Global_active_power
  with(hpc_feb, plot(DateTime, Global_active_power, pch = ".", xlab = "", ylab="Global Active Power (kilowatts)"))
  with(hpc_feb, lines(DateTime, Global_active_power))
  
  #DateTime Vs Voltage
  with(hpc_feb, plot(DateTime, Voltage, pch = ".", xlab = "datetime", ylab="Voltage"))
  with(hpc_feb, lines(DateTime, Voltage))
  
  #DateTime Vs Energy_sub_metering
  with(hpc_feb, plot(DateTime, Sub_metering_1, pch = ".", xlab = "", ylab="Energy sub metering"))
  with(hpc_feb, lines(DateTime, Sub_metering_1))
  with(hpc_feb, points(DateTime, Sub_metering_2, col="red", pch="."))
  with(hpc_feb, lines(DateTime, Sub_metering_2, col="red"))
  with(hpc_feb, points(DateTime, Sub_metering_3, col="blue", pch="."))
  with(hpc_feb, lines(DateTime, Sub_metering_3, col="blue"))
  legend("topright", lty=c("solid","solid","solid"),col=c("black","red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  #DateTime Vs Global_reactive_power
  with(hpc_feb, plot(DateTime, Global_reactive_power, pch = ".", xlab = "datetime", ylab="Global_reactive_power"))
  with(hpc_feb, lines(DateTime, Global_reactive_power))
  
  dev.off()
  
} else {
  print("Please keep 'ExData_Plotting1' folder in working directory")
}

