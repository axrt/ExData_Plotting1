#First, source the code for downloading and processing data (needs libcurl)
source("https://raw.githubusercontent.com/axrt/ExData_Plotting1/master/get.data.R")
#Now - (download),read and filter the data
get.data()

#Generates a plot and gets called twice, once to plot on the screen, the other - to a png device.
gen.plot<-function(){
  #top left
  #!Code copypaste from plot2.R
  with(data, plot(x=DateTime,y=Global_active_power, type="l",
                  xlab="",
                  ylab="Global Active Power"))

  #top right
  with(data, plot(x=DateTime, y=Voltage, xlab="datetime", type="l"))

  #bottom left
  #!Code copypaste from plot3.R
  with(data, {
    plot(x=DateTime, y=Sub_metering_1, col="black", type="l",xlab="",ylab="Energy sub metering")
    lines(x=DateTime, y=Sub_metering_2,col="red", type="l")
    lines(x=DateTime, y=Sub_metering_3,col="blue", type="l")
    legend("topright",lty=c(1,1),col=c("black","red","blue"),
           legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n", cex=0.7) #bty = "n", cex=0.7 not copypasted
    #as the plot requires no border this time
  })

  #bottom right
  with(data, plot(x=DateTime, y=Global_reactive_power, xlab="datetime", type="l"))

}

par(mfrow=c(2,2))
gen.plot()

#Save the plot
#grDevices just in case..
if(!require("grDevices")){
  install.packages("grDevices")
}
library(grDevices)

png("plot4.png",width = 480,height = 480)
par(mfrow=c(2,2))
#write plot to png
gen.plot()
#off the device
dev.off()
