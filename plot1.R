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
  
  # Read Data
  hpc<-as.data.frame(read.table("./ExData_Plotting1/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?"))
  
  # Filter Data
  hpc<-tbl_df(hpc)
  hpc<-mutate(hpc, Date=dmy(Date))
  hpc_feb<-filter(hpc, Date == "2007-02-01" | Date == "2007-02-02")
  hpc_feb<-as.data.frame(hpc_feb)
  
  # Plot on PNG file. File to be saved in working directory
  png(file="plot1.png")
  hist(hpc_feb$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main ="Global Active Power")
  dev.off()
  
} else {
  print("Please keep 'ExData_Plotting1' folder in working directory")
}