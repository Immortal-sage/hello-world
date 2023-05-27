Book1 <- read.csv("F:/AMPBA MATERIALS/SA2/Wage2.csv" , header = T)
head(Book1 , 10)

#ans 5
plot(Book1$wage,Book1$iq,main = 'Scatterplot') #to plot scatterplot

#ans 6
cor(Book1$wage,Book1$iq)

#ans 8 
t.test(Book1$wage,mu=0)
m1<-lm(Book1$wage~Book1$iq)
summary(m1)


#ans 12
m4<-lm(Book1$wage~Book1$iq+Book1$educ)
summary(m4)

#ans 13
m2<-lm(Book1$educ~Book1$iq)
summary(m2)



