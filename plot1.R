#First, source the code for downloading and processing data (needs libcurl)
source("https://raw.githubusercontent.com/axrt/ExData_Plotting1/master/get.data.R")
#Now - (download),read and filter the data
get.data()

#Create histogram
par(mfrow=c(1,1),mar=c(5,5,2,2))
with(data, hist(Global_active_power, col="red",
                xlab = "Global Active Power (kilowatts)",
                main="Global Active Power",cex.lab=0.7))
#grDevices should be there, but just in case..
if(!require("grDevices")){
  install.packages("grDevices")
}
library(grDevices)

#copy the histogram to a file
dev.copy(png, file="plot1.png", width=480, height=480)
#off the device
dev.off()

