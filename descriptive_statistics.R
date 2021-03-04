load("./data/aflsmall.Rdata")
library(lsr)
who()

print(afl.margins)
print(afl.finalists)

length(afl.margins)
length(afl.finalists)

mean(afl.margins)
mean(afl.margins[1:5])

# Trimmed Mean
dataset <- c(-15, 2, 3, 4, 5, 6, 7, 8, 9, 12)
mean(dataset)
mean(x = dataset, trim = 0.1) # Trim 0.1 = Discard <&> 10%, mean middle 80%

# Mode
head(afl.finalists, 25)
table(afl.finalists)
modeOf(x = afl.finalists)

min(afl.margins)
max(afl.margins)
range(afl.margins)

# Quartiles
quantile(x = afl.margins, probs = .5) # Median
quantile(x = afl.margins, probs =  c(.25, .75)) # Inter-quartiles
IQR(x = afl.margins) == 50.50 - 12.75

# Absolute Mean Deviation
# Mean deviation is value of x1 from mean x.
# Therefore AMD is just mean of all mean deviations
X <- c(56, 31, 56, 8 , 32)   # enter the data
X.bar <- mean(X)       # step 1. the mean of the data
AD <- abs(X - X.bar)   # step 2. the absolute deviations from the mean
AAD <- mean(AD)        # step 3. the mean absolute deviations
print(AAD)             # print the results

# Variance - Squared deviations rather than Absolute deviations
# Better for various mathematical reasons
mean( (X - mean(X) )^2) # Variance
var(X) # ALso Variance
var(X) == mean( (X - mean(X) )^2) # But these are different... why?

# R var() uses n-1 rather than just n
# Why? Because n just describes a sample
# While n-1 is about guessing population parameter based on sample!
sum( (X-mean(X))^2 ) / 4 == var(X)

# Standard Deviation - Sqrt of Var
sd( afl.margins ) # Again, uses n-1
# As a general assumption...
# 68% of data within +-1sd, 95% within +-2sd, and 99.7% within +-3 sd

