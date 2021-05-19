
v1 <- c(10, 20, 30); 
names(v1) <- c("Moe", "Larry", "Curly")

v1["Larry"]

v2 <- c(10, 20, 30);
names(v2) <- c("Charles", "Ahn", "Kim")

v3 <- c(10, 20, 30);

data.frame(v1, v2, v3)

new <- data.frame(a=1, b=2, c=3, d="a")

new1 <- data.frame(a=1, b=2, c=3, d="a")

rbind(new, new1)
newRdata <- rbind(new, new1)

cbind(new, new1)
newcol = 1:150
cbind(newRdata, newcol)

newRdata[newRdata$c==3]

subset(newRdata, select = b, subset = b>=2)

newRdata[[2]]
newRdata[2]
newRdata[2,]
newRdata[, 2]
newRdata[["Charles"]]

v1
v2
v3

newDF <- data.frame(v1, v2)

newDF

newDF[["Charles"]]
newDF[["Larry"]]
newDF["Charles"]
newDF[,"Larry"]
newDF[[v1]]
newDF$Charles
newDF$Larry
newDF$v1
newDF[v1]

colnames(newDF)
rownames(newDF)
colnames(newDF) <- "first"

newDF
colnames(newDF.NA) <- "second"

subset(newDF, select=-first)
newDF

as.vector(newDF)
as.list(newDF)
as.matrix(newDF)

a<-1
sapply(a, log)

newRdata

write.csv(newRdata, "newRdata.csv")

save(newRdata, file = "newRdata.Rdata")

read.csv("newRdata.csv")
load("newRdata.R")
load("newRdata.Rdata")

rm(newDF)

data()
data(AirPassengers)
data(BOD)

summary(AirPassengers)
summary(BOD)

head(AirPassengers)
head(BOD)

library(MASS)
MASS
sp<-split(Cars93$MPG.city, Cars93$Origin)
median(sp[[1]])

nchar("charles")
length("charles")
length(a)
nchar(a)
nchar(v1)
length(v1)

paste("charles", "dev", sep = "-")
paste("the pi is approximately", pi)
name <- c("Charles", "Ahn")
paste(name, "loves me", collapse = ", and ")
substr("statistics", 1, 4)
strsplit("the pi is approximately", " ")

sentance <- "the pi is approximately"
sentance <- sub(sentance, "pi", "log")
sentance

today <- Sys.Date()
as.Date(today)

format(Sys.Date(), '%a')
format(Sys.Date(), '%b')
format(Sys.Date(), '%B')
format(Sys.Date(), '%d')
format(Sys.Date(), '%m')
format(Sys.Date(), '%y')
format(Sys.Date(), '%Y')

d <- as.Date("2014-12-25")
d
p <- as.POSIXlt(d)
p
p$yday
start <- as.Date("2014-12-01")
end <- as.Date("2014-12-25")
seq(from=start, to=end, by=1)

