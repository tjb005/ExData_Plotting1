# Exploratory Data Analysis - Course Project 1 - Plot 1
# Tim B

## Confirm ExData_Plotting1 data is in working directory
if(dir.exists("./ExData_Plotting1")){
  
  ## Install Missing Packages
  list.of.packages <- c("dplyr", "tidyr", "lubridate")
  new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
  if(length(new.packages)) install.packages(new.packages)
  
  ## Call Libraries
  library("dplyr")
  library("tidyr")
  library("lubridate")
  
  # Read data
  hpc<-as.data.frame(read.table("./ExData_Plotting1/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?"))
  
  # Filter data
  hpc<-tbl_df(hpc)
  hpc<-mutate(hpc, DateTime=paste(Date, Time))
  hpc<-mutate(hpc, DateTime=dmy_hms(DateTime))
  hpc_feb<-filter(hpc, date(DateTime) == "2007-02-01" | date(DateTime) == "2007-02-02")
  hpc_feb<-as.data.frame(hpc_feb)
  
  # Plot on PNG file. File to be saved in working directory
  png(file="plot3.png")
  with(hpc_feb, plot(DateTime, Sub_metering_1, pch = ".", xlab = "", ylab="Energy sub metering"))
  with(hpc_feb, lines(DateTime, Sub_metering_1))
  with(hpc_feb, points(DateTime, Sub_metering_2, col="red", pch="."))
  with(hpc_feb, lines(DateTime, Sub_metering_2, col="red"))
  with(hpc_feb, points(DateTime, Sub_metering_3, col="blue", pch="."))
  with(hpc_feb, lines(DateTime, Sub_metering_3, col="blue"))
  legend("topright", lty=c("solid","solid","solid"),col=c("black","red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.off()
  
} else {
  print("Please keep 'ExData_Plotting1' folder in working directory")
}