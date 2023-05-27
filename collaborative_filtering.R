install.packages("recommenderlab") ## if not already installed
install.packages("reshape2") ## if not already installed

library(recommenderlab)
library(reshape2)

####### Big basket customer data #####
order_list <-read.csv("F:/AMPBA MATERIALS/UNML 2/IMB575-XLS-ENG.csv",header=TRUE)
colnames(order_list) <- c("Member","Order","SKU","Created On","Description")
head(order_list)
order_list <- order_list[,1:5] 
head(order_list)
dim(order_list)

## covert to matrix format
?acast
order_matrix <- as.matrix(acast(order_list, Member~Description, value.var="Order", fun.aggregate = mean))
dim(order_matrix)

## recommendarlab realRatingMatrix format
R <- as(order_matrix, "realRatingMatrix")

?Recommender
rec1 = Recommender(R, method="UBCF") ## User-based collaborative filtering
rec2 = Recommender(R, method="IBCF") ## Item-based collaborative filtering
rec3 = Recommender(R, method="SVD")
rec4 = Recommender(R, method="POPULAR")
rec5 = Recommender(binarize(R,minRating=2), method="UBCF") ## binarize all 2+ orders to 1

## create n recommendations for a user
uid = "M09736" ##we can add any member id
item <- subset(order_list, order_list$Member==uid)
print("You have ordered:")
item
print("recommendations for you:")
prediction <- predict(rec1, R[uid], n=2) 
as(prediction, "list")
prediction <- predict(rec2, R[uid], n=2) 
as(prediction, "list")
prediction <- predict(rec3, R[uid], n=2) 
as(prediction, "list")
prediction <- predict(rec4, R[uid], n=2) 
as(prediction, "list")
prediction <- predict(rec5, R[uid], n=2) 
as(prediction, "list")

