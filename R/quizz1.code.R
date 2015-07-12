library(datasets)
data(airquality)
library(ggplot2)
qplot(Wind, Ozone, data = airquality)
qplot(Wind, Ozone, data = airquality, facets = . ~ factor(Month))
qplot(Wind, Ozone, data = airquality, geom = "smooth")
airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)

qplot(votes, rating, data = movies, panel = panel.loess)
qplot(votes, rating, data = movies) + geom_smooth()
qplot(votes, rating, data = movies, smooth = "loess")
qplot(votes, rating, data = movies) + stats_smooth("loess")

ibrary(lattice)
library(datasets)
data(airquality)
p <- xyplot(Ozone ~ Wind | factor(Month), data = airquality)
p
