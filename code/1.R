#Numerical illustration for Section 2.3 and Section 4.
#The numerical illustration for section 2.4 is found in 4.R
source("utility.R")

#1.
#The numerical illustrations in Section 2.3. The numerical
#example is the same as the numerical illustration in Nelson (2017),
#Theorem 3.2.3, p.71. The extremal copulas are illustrated on the same
#page, see his Figure 3.10. These will be illustrated in 2.R.

p00 <- 0.2
a <- 0.6
p01 <- a - p00
p01
#0.4
b <- 0.3
p10 <- b - p00
p10
#0.1
p11 <- 1 - (p00 + p01 + p10)
p <- matrix(c(p00,p01, p10, p11), byrow=T, ncol=2)
p
#     [,1] [,2]
#[1,]  0.2  0.4
#[2,]  0.1  0.3

#Proposition 1 with normal marginals:
round(tetrachoric(p),2) #-0.88  0.93 

#Proposition 2, Spearman's rho with unknown Z-distribution:
round(lspearman(p),2) #-0.82  0.88 

#For comparison, Pearson's tetrachoric correlation, assuming normality:
rhohat <- polycor::polychor(p)
round(rhohat,2) #0.15

#For comparison, Spearman's rho when assuming that the copula
#is normal:
res <- spearmanGaussCop(p)
round(res, 2) #[1] 0.14

