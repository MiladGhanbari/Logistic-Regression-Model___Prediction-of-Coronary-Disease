# Logistic Regression Model for Prediction of Coronary Disease
# Milad Ghanbari

# Working directory which contains data file (please change accordingly)
dir = "F:/RProjects/LRM"
setwd(dir)

# Read the data
CPdata <- read.csv("acath2.csv")

# Run a logistic regression
CPfit <- glm(sigdz~cholest, data = CPdata, family = "binomial")

# The odds ratio
exp(CPfit$coefficients[2])

# 95% confidence interval
exp(confint(CPfit)[2,])

CPfit$coefficients

# rename the sex predictor label
CPdata$sex <- factor(CPdata$sex, labels=c("Male", "Female"))

# Run a logistic regression
CPfit2 <- glm(sigdz~sex + age + cholest, data = CPdata, family = "binomial")

# The odds ratio
exp(CPfit2$coefficients[2])

# 95% confidence interval
exp(confint(CPfit2))


library(pROC)

# calculate the prediction values for the model
CPfit <- glm(sigdz~cholest, data = CPdata, family = "binomial")
PredValues <- predict(CPfit, type ="response")

# draw the ROC curve
auc(CPdata$sigdz, PredValues, plot=TRUE, print.thres="best",
    auc.polygon=TRUE, auc.polygon.col="lightblue", asp=FALSE,
    print.auc=TRUE, print.auc.cex=2)

# rename the sex predictor label
CPdata$sex <- factor(CPdata$sex, labels=c("Male", "Female"))

# Run a logistic regression
CPfit2 <- glm(sigdz~sex + age + cholest, data = CPdata, family = "binomial")

# calculate the prediction values for the model
PredValues2 <- predict(CPfit2, type ="response")

# draw the ROC curve
auc(CPdata$sigdz, PredValues2, plot=TRUE, print.thres="best",
    auc.polygon=TRUE, auc.polygon.col="lightblue", asp=FALSE,
    print.auc=TRUE, print.auc.cex=2)

# calculate the residual for the first model
Res <- resid(CPfit, type="pearson")
stat <- sum(Res^2)

# p-value for the first model
PVal1 <- 1-pchisq(stat, df=CPfit$df.residual)
print(PVal1)


# calculate the residual for the second model
Res2 <- resid(CPfit2, type="pearson")
stat2 <- sum(Res2^2)

# p-value for the second model
PVal2 <- 1-pchisq(stat2, df=CPfit2$df.residual)
print(PVal2)

