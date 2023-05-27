install.packages("Matrix")## if not already installed
install.packages("arules") ## if not already installed
#install.packages("arulesViz") ## if not already installed; necessary for visualization purpose

library("Matrix")
library("arules")
#library("arulesViz")
mydata<-read.csv("F:/AMPBA MATERIALS/UNML 2/IMB575-XLS-ENG.csv",header=TRUE, sep=",")
mydata

rules <- apriori(mydata, parameter = list(supp = 0.001, conf = 0.8))
rules

### select and inspect five rules with highest lift
rules_high_lift <- head(sort(rules, by="lift"), 5)
inspect(rules_high_lift)

