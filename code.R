library(fGarch)
library(portes)
library(forecast)
data = read.table('d-gmsp9908.txt',header=T)
data[,-1] = log(1+data[,-1])
data$at_gm = data$gm - mean(data$gm)
Box.test(data$at_gm,lag=10,type='Ljung')

Box-Ljung test

data:  data$at_gm
X-squared = 28.399, df = 10, p-value = 0.001558
gvtest(data$at_gm,lags= 10,SquaredQ=T)
Lags Statistic       df pvalue
10  802.2256 7.857143      0
m1 = garchFit(~garch(1,0),data=data$gm,trace=F)
summary(m1)

Title:
      GARCH Modelling 

Call:
      garchFit(formula = ~garch(1, 0), data = data$gm, trace = F) 

Mean and Variance Equation:
      data ~ garch(1, 0)
<environment: 0x10aad51b8>
      [data = data$gm]

Conditional Distribution:
      norm 

Coefficient(s):
      mu        omega       alpha1  
-0.00042442   0.00059385   0.49704540  

Std. Errors:
      based on Hessian 

Error Analysis:
      Estimate  Std. Error  t value Pr(>|t|)    
mu     -4.244e-04   5.176e-04    -0.82    0.412    
omega   5.939e-04   2.353e-05    25.24   <2e-16 ***
      alpha1  4.970e-01   4.927e-02    10.09   <2e-16 ***
      ---
      Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Log Likelihood:
      5337.872    normalized:  2.122414 

Description:
      Thu Mar 24 15:24:43 2016 by user:  
      
      
      Standardised Residuals Tests:
      Statistic p-Value   
Jarque-Bera Test   R    Chi^2  29360.39  0         
Shapiro-Wilk Test  R    W      0.8857967 0         
Ljung-Box Test     R    Q(10)  17.71809  0.05990947
Ljung-Box Test     R    Q(15)  19.04495  0.2117042 
Ljung-Box Test     R    Q(20)  27.06047  0.1335713 
Ljung-Box Test     R^2  Q(10)  414.2818  0         
Ljung-Box Test     R^2  Q(15)  486.6827  0         
Ljung-Box Test     R^2  Q(20)  541.4198  0         
LM Arch Test       R    TR^2   294.6027  0         

Information Criterion Statistics:
      AIC       BIC       SIC      HQIC 
-4.242443 -4.235489 -4.242446 -4.239919 
m2 = garchFit(~garch(1,1),trace=F)
summary(m2)

Title:
      GARCH Modelling 

Call:
      garchFit(formula = ~garch(1, 1), trace = F) 

Mean and Variance Equation:
      data ~ garch(1, 1)
<environment: 0x11656ba78>
      [data = dem2gbp]

Conditional Distribution:
      norm 

Coefficient(s):
      mu       omega      alpha1       beta1  
-0.0061903   0.0107614   0.1531341   0.8059737  

Std. Errors:
      based on Hessian 

Error Analysis:
      Estimate  Std. Error  t value Pr(>|t|)    
mu     -0.006190    0.008462   -0.732 0.464448    
omega   0.010761    0.002838    3.793 0.000149 ***
      alpha1  0.153134    0.026422    5.796  6.8e-09 ***
      beta1   0.805974    0.033381   24.144  < 2e-16 ***
      ---
      Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Log Likelihood:
      -1106.608    normalized:  -0.5605916 

Description:
      Thu Mar 24 15:26:22 2016 by user:  
      
      
      Standardised Residuals Tests:
      Statistic p-Value  
Jarque-Bera Test   R    Chi^2  1059.851  0        
Shapiro-Wilk Test  R    W      0.9622848 0        
Ljung-Box Test     R    Q(10)  10.12141  0.4299066
Ljung-Box Test     R    Q(15)  17.04349  0.3162711
Ljung-Box Test     R    Q(20)  19.29764  0.5025619
Ljung-Box Test     R^2  Q(10)  9.062556  0.5261773
Ljung-Box Test     R^2  Q(15)  16.07769  0.3769072
Ljung-Box Test     R^2  Q(20)  17.50715  0.6198388
LM Arch Test       R    TR^2   9.771217  0.6360237

Information Criterion Statistics:
      AIC      BIC      SIC     HQIC 
1.125236 1.136559 1.125228 1.129396 
