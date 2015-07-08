#' Creates a "data" folder, downloads (if not exists yet), converts Date and Time
#' to a combined DateTime and selects only the part that belongs to [2007/2/1, 2007/2/2]
get.data<-function(){
  #Download the data
  subfolder<-"data"
  if(!file.exists(subfolder)){
    dir.create(subfolder)
  }
  data.zipped<-paste(subfolder,"electric.data.zip",sep="/")
  if(!file.exists(data.zipped)){
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                  method = "curl", destfile = data.zipped)
  }
  #Load the file
  #Prepare the Date wrapper
  data<-read.table(unz(data.zipped,"household_power_consumption.txt"),header = TRUE,sep = ";",
                   stringsAsFactors = FALSE,
                   colClasses = c("character","character",rep("numeric",7)),na.strings = "?")
  #Packages
  if(!require("plyr")){
    install.packages("plyr")
  }
  library(plyr)
  if(!require("dplyr")){
    install.packages("dplyr")
  }
  library(dplyr)

  data <- data %>% #push data into the pipe
    filter(grepl(x=Date,pattern = "\\b[1,2]/2/2007",fixed=FALSE)) %>% #select only those,
    #that are obviously from Feb 2007
    mutate(DateTime=paste(Date,Time)) %>%
    select(-c(Date,Time)) #Remove the redundant Date and Time columns, append the new DateTime column
  #Finally convert DateTime to date+time.. duh..
  data$DateTime<-strptime(data$DateTime, format="%d/%m/%Y %H:%M:%S")
  #Reoder columns in a more natural way
  data<<-data[,c(ncol(data),seq(1,ncol(data)-1,1))]
}

