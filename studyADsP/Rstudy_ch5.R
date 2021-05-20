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
