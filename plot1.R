#Firts source the code for downloading and processing data (needs libcurl)
source("https://raw.githubusercontent.com/axrt/ExData_Plotting1/master/get.data.R")
#Now - (download),read and filter the data
get.data()

#Create histogram
with(data, hist(Global_active_power, col="red",
                xlab = "Global Active Power (kilowatts)",
                main="Global Active Power"))
#grDevices should be there, but just in case..
if(!require("grDevices")){
  install.packages("grDevices")
}
library(grDevices)

#copy the histogram to a file
dev.copy(png, file="plot1.png")
#off the device
dev.off()

