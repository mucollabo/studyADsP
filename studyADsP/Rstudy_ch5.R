library(rpart)
library(party)
install.packages("party")
library(ROCR)
install.packages("ROCR")
x <- kyphosis[sample(1:nrow(kyphosis), nrow(kyphosis), replace = F),]
x.train <- kyphosis[1:floor(nrow(x)*0.75),]
x.evaluate <- kyphosis[floor(nrow(x)*0.75):nrow(x),]
x.model <- cforest(Kyphosis~Age+Number+Start, data = x.train)
x.evaluate$prediction <- predict(x.model, newdata=x.evaluate)
x.evaluate$correct <- x.evaluate$prediction == x.evaluate$Kyphosis
print(paste("% of predicted classsification correct", mean(x.evaluate$correct)))
x.evaluate$probabilities <- 1 - unlist(treeresponse(x.model, newdata=x.evaluate), use.names = F)[seq(1, nrow(x.evaluate)*2, 2)]

# graph 1

pred <- prediction(x.evaluate$probabilities, x.evaluate$Kyphosis)
perf <- performance(pred, "tpr", "fpr")
plot(perf, main="ROC curve", colorize=T)

# graph 2

perf <- performance(pred, "lift", "rpp")
plot(perf, main="lift curve", colorize=T)

a <- iris[iris$Species=="setosa" | iris$Species=="versicolor",]
b <- glm(Species ~ Sepal.Length, data=a, family=binomial)
summary(b)

idx <- sample(2, nrow(iris), replace = TRUE, prob = c(0.7, 0.3))
train.data <- iris[idx==1,]
test.data <- iris[idx==2,]

# create model with train.data
iris.tree <- ctree(Species~., data=train.data)
plot(iris.tree)
plot(iris.tree, type="simple")

# compare predict data and real data
table(predict(iris.tree), train.data$Species)

# validation with test data
test.pre <- predict(iris.tree, newdata=test.data)
table(test.pre, test.data$Species)

# analysis with randomforest
idx <- sample(2, nrow(iris), replace = TRUE, prob = c(0.7, 0.3))
train.data <- iris[idx==2,]
test.data <- iris[idx==1,]
r.f <- randomForest(Species~., data=train.data, ntree=100, proximity=TRUE)
install.packages("randomForest")
library(randomForest)
table(predict(r.f), train.data$Species)
plot(r.f)

varImpPlot(r.f)
pre.rf <- predict(r.f, newdata = test.data)
table(pre.rf, test.data$Species)
plot(margin(r.f, test.data$Species))

# Hierarchical Clustering
idx <- sample(1:dim(iris)[1], 40)
iris.s <- iris[idx,]
iris.s$Species <- NULL
hc <- hclust(dist(iris.s), method="ave")
plot(hc, hang=1, labels=iris$Species[idx])

# K-means Clustering
data("iris")
newiris <- iris
newiris$Species <- NULL
kc <- kmeans(newiris, 3)

# compare with results
table(iris$Species, kc$cluster)

# clustering graph
plot(newiris[c("Sepal.Length", "Sepal.Width")], col=kc$cluster)

library(arulesViz)
data(Groceries)
install.packages("arules")
install.packages("https://cran.r-project.org/src/contrib/Archive/arules/arules_1.6-7.tar.gz", repos = NULL, type="source")
install.packages('arulesViz')

inspect(Groceries[1:3])
rules <- apriori(Groceries, parameter = list(support = 0.01, confidence = 0.3))
inspect(sort(rules, by=c("lift"), decreasing = TRUE)[1:20])
