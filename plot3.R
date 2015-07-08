#First, source the code for downloading and processing data (needs libcurl)
source("https://raw.githubusercontent.com/axrt/ExData_Plotting1/master/get.data.R")
#Now - (download),read and filter the data
get.data()

#Generate plots; Had to do as a function to avoid code copypaste; could not dev.copy()
#this time because legend gets truncated, see forum
#https://class.coursera.org/exdata-030/forum/thread?thread_id=15
gen.plot<-function(){
  with(data, {
    plot(x=DateTime, y=Sub_metering_1, col="black", type="l",xlab="",ylab="Energy sub metering")
    lines(x=DateTime, y=Sub_metering_2,col="red", type="l")
    lines(x=DateTime, y=Sub_metering_3,col="blue", type="l")
    legend("topright",lty=c(1,1),col=c("black","red","blue"),
           legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  })
}

#Plot to screen
par(mfrow=c(1,1),mar=c(5,5,2,2))
gen.plot()
#Save the plot
#grDevices just in case..
if(!require("grDevices")){
  install.packages("grDevices")
}
library(grDevices)
png("plot3.png",width = 480,height = 480)
par(mfrow=c(1,1))
#write plot to png
gen.plot()
#off the device
dev.off()
