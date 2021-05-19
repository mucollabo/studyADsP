head(airquality)
data(airquality)
airquality

install.packages("reshape")
library(reshape)

aqm <- melt(airquality, id=c("Month", "Day"), na.rm=T)
cast(aqm, Day ~ Month ~ variable)

install.packages("sqldf")
library(sqldf)

sqldf("select * from [airquality]")
sqldf("select * from [airquality] limit 10")
sqldf("select * from [airquality] where [Month] = 5")

sqldf("select * from iris")
sqldf("select * from airquality")
sqldf("select * from Orange")

test.data

data(package = .packages(all.available = TRUE))

library(boot)
boot
library(boot.acme)

install.packages("data.table")
library(data.table)
DF <- data.frame(x = runif(2.6e+07), y = rep(LETTERS, each = 10000))
df <- data.frame(x = runif(2.6e+07), y = rep(letters, each = 10000))
system.time(x <- DF[DF$y == "C", ])
DT <- as.data.table(DF)
setkey(DT, y)
system.time(x <- DT[J("C"), ])

require(ggplot2)
data(diamonds)
dia.data <- diamonds
head(dia.data)
summary(dia.data)

install.packages("plineplot")
library(plineplot)
iris2 <- iris[,c(1,3,5)]
plineplot(Species ~., data=iris2, method="lda", x=iris[,4], xlab="Petal.Width")

# 3절
summary(dia.data)

x <- c(1,2,3,NA)
mean(x)
mean(x, na.rm=T)

complete.cases(dia.data)
is.na(dia.data)

data(mtcars)
a <- mtcars$mpg
b <- mtcars$hp
cor(a,b)
cov(a,b)
cor.test(a, b, method = "pearson")

x <- c(19,23,26,29,30,38,39,46,49)
y <- c(33,51,40,49,50,69,70,64,89)
lm(y~x)

summary(lm(y~x))

library(MASS)
head(Cars93, 10)
attach(Cars93)
lm(Price~EngineSize+RPM+Weight, data = Cars93)
summary(lm(Price~EngineSize+RPM+Weight, data = Cars93))
Cars93

library(boot)
data(nodal)
boot
nodal
a <- c(2,4,6,7)
data <- nodal[,a]
glmModel <- glm(r~., data = data, family = "binomial")
summary(glmModel)

# create dataframe
x1 <- c(7, 1, 11, 11, 7, 11, 3, 1, 2, 21, 1, 11, 10)
x2 <- c(26, 29, 56, 31, 52, 55, 71, 31, 54, 47, 40, 66, 68)
x3 <- c(6, 15, 8, 8, 6, 9, 17, 22, 18, 4, 24, 9, 8)
x4 <- c(60, 52, 20, 47, 33, 22, 6, 44, 22, 26, 34, 12, 12)
y <- c(78.5, 74.3, 104.3, 87.6, 95.9, 109.2, 102.7, 72.5, 93.1, 115.9, 83.8, 113.3, 109.4)
df <- data.frame(x1, x2, x3, x4, y)
head(df)

# create regression
a <- lm(y ~ x1 + x2 + x3 + x4, data = df)
summary(a)

head(df, 13)
a

# without x4 and create regression

b <- lm(y ~ x1 + x2 + x3, data = df)
summary(b)

# without x3 and create regression

c <- lm(y ~ x1 + x2, data = df)
summary(c)

# apply forward selection with step method
step(lm(y~1, data = df), scope = list(lower=~1, upper=~x1+x2+x3+x4), direction = "forward")

# apply backward elimination
library(ElemStatLearn)
library()
data()

install.packages("ElemStatLearn")

library(tseries)
install.packages("tseries")
library(forecast)
install.packages("forecast")
library(TTR)
king <- scan("http://robjhyndman.com/tsdldata/misc/kings.dat", skip = 3)
king.ts <- ts(king)
plot.ts(king.ts)

king.sma3 <- SMA(king.ts, n=3)
plot.ts(king.sma3)

king.sma8 <- SMA(king.ts, n=8)
plot.ts(king.sma8)

king.ff1 <- diff(king.ts, differences = 1)
plot.ts(king.ff1)

acf(king.ff1, lag.max = 20)
acf(king.ff1, lag.max = 20, plot = FALSE)

pacf(king.ff1, lag.max = 20)
pacf(king.ff1, lag.max = 20, plot = FALSE)

auto.arima(king)

king.arima <- arima(king, order = c(0, 1, 1))
king.forecasts <- forecast(king.arima, h=5)
rm(king.forecats)
king.forecasts

library(MASS)
loc <- cmdscale(eurodist)
x <- loc[, 1]
y <- -loc[, 2]
eurodist
plot(x, y, type = "n", asp = 1, main = "Metric MDS")
text(x, y, rownames(loc), cex=0.7)
abline(v=0, h=0, lty=2, lwd=0.5)

data(swiss)
swiss.x <- as.matrix(swiss[, -1])
swiss.dist <- dist(swiss.x)
swiss.mds <- isoMDS(swiss.dist)
plot(swiss.mds$points, type = "n")
text(swiss.mds$points, labels = as.character(1:nrow(swiss.x)))
abline(v=0, h=0, lty=2, lwd=0.5)

swiss.x <- as.matrix(swiss[, -1])
swiss.sammon <- sammon(dist(swiss.x))
plot(swiss.sammon$points, type = "n")
text(swiss.sammon$points, labels = as.character(1:nrow(swiss.x)))
abline(v=0, h=0, lty=2, lwd=0.5)

library(datasets)
data(USArrests)
pairs(USArrests, panel = panel.smooth, main = "USArrests data")

US.prin <- princomp(USArrests, cor = TRUE)
summary(US.prin)

loadings(US.prin)

US.prin$scores

arrests.pca <- prcomp(USArrests, center = TRUE, scale. = TRUE)
biplot(arrests.pca, scale = 0)
