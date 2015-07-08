#First, source the code for downloading and processing data (needs libcurl)
source("https://raw.githubusercontent.com/axrt/ExData_Plotting1/master/get.data.R")
#Now - (download),read and filter the data
get.data()

par(mfrow=c(1,1)) #to check in case par has been changed
#Generate plot
with(data, plot(x=DateTime,y=Global_active_power, type="l",
                xlab="", ylab="Global Active Power (kilowatts)",cex.lab=0.7))
#grDevices just in case..
if(!require("grDevices")){
  install.packages("grDevices")
}
library(grDevices)
#copy the histogram to a file
dev.copy(png, file="plot2.png", width=480, height=480)
#off the device
dev.off()
