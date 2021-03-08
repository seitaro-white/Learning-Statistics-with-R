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
# As a general assumption...=
# 68% of data within +-1sd, 95% within +-2sd, and 99.7% within +-3 sd

# Median Absolute Deviation - Same as earlier with Median...
median( abs(afl.margins - median(afl.margins)) )
mad( x = afl.margins, constant = 1 )
# For some reason Mathmatical constant is by default 1.4826 for reasons
mad( x = afl.margins)

# Mean and Median Absolute Deviation aren't really used much

# SKEW AND KURTOSIS
# SKEW - Measure of asymmetry, distributions with a tail etc etc.
# If data has lots of extreme small vals -> Negative Skew
# If data has lots of extreme large vals -> Positive Skew
library( psych )
skew( x = afl.margins )

# KURTOSIS - Measure of 'pointiness' of dataset distribution
# Platykurtic -> Too Flat -> Negative Kurtosis
# Mesokurtic -> Normal - > 0 Kurtosis
# Leptokurtic -> Too Pointy -> Positive Kurtosis
# A normal curve has 0 kurtosis

kurtosi( x = afl.margins )

# Summary of Variable
summary(object = afl.margins)

# On logical vector
blowouts <-  afl.margins > 50
blowouts
summary( object = blowouts )

# On Factor
summary( object = afl.finalists )

# Doesn't work on character vector (this is why we use factors)
f2 <- as.character( afl.finalists )
summary( object = f2 )

# Summarising Dataframe
load( "./data/clinicaltrial.Rdata" )
who(TRUE)

summary( clin.trial )

# Describe Dataframe - Note most of this is probably better covered by tidyverse
by( data=clin.trial, INDICES=clin.trial$therapy, FUN=describe )
by( data=clin.trial, INDICES=clin.trial$therapy, FUN=summary )

# What about all possible combinations of drug and therapy
aggregate( formula = mood.gain ~ drug + therapy,  # mood.gain by drug/therapy combination
           data = clin.trial,                     # data is in the clin.trial data frame
           FUN = mean                            # print out group means
)

# THAT's what formula is for!
aggregate( formula = mood.gain ~ drug,  # mood.gain by drug/therapy combination
           data = clin.trial,                     # data is in the clin.trial data frame
           FUN = mean                            # print out group means
)

aggregate( formula = mood.gain ~ drug,  # mood.gain by drug/therapy combination
           data = clin.trial,                     # data is in the clin.trial data frame
           FUN = sd                            # print out group means
)

# Standardisation
# Standard score (z-score) -> defined as number of sd's above mean that observation lies
# Standard score = (raw score - mean) / standard deviation
pnorm( 3.6 ) # = Percentage of extremity for observation 3.6 sd's from mean

# Possible to compare standardised scores accross different variables
# Beach each standardised score is a statement about where observation falls relative to own population

# CORRELATIONS
load( "./data/parenthood.Rdata" )
head(parenthood, 10)


summary(parenthood)
# There's a correlation between sleep and grumpiness
# We can describe correlations with a correlation coefficient (Pearsons's)
# Denoted by r
# r=1 -> Perfect positive relation and r=-1 -> Perfect negative

# Correlation is based on covariance - mathematical way of describing
# Covariance captures basic direction of correlation but in units that make little sense to humans
# Pearson's correlation coefficient fixed by standardising covariance
# Same mechanism as z-score -> dividing by standard deviation (both for 2 variables)


cor( x = parenthood$dan.sleep, y = parenthood$dan.grump ) # Single correlation
cor( x = parenthood ) # Correlation Matrix

# Interpreting Correlation
# Really depends on the context
# You should really always look at a scatter plot though
# For example with Anscombes Quartet - 4 datasets with same correlation/mean/std
# But all very different...

# Spearman's Rank
# Pearson's CC measures a linear relationship -> what if relationship not linear?

load( "./data/effort.Rdata" )
effort
cor( effort$hours, effort$grade ) # Correlation is strong
# But doesn't show that more hours always = better grades -> Relationship is perfectly ordinal
# So let's treat it as an ordinal scale!
hours.rank <- rank( effort$hours )
grade.rank <- rank( effort$grade )
cor( hours.rank, grade.rank ) # Spearman's rank order correlation -> defined as p

cor( effort$hours, effort$grade, method = "spearman") # Easier to just do this

load( "./data/work.Rdata" )
head(work) # Some of this data is non-numeric
cor(work) # So this fails
# Some lsr function here (but again, probably better covered in tidyverse)

# Missing Data
partial <- c(10, 20, NA, 30)
mean( x = partial ) # Not very helpful...

mean( x = partial, na.rm = TRUE ) # Ignores - means vector is n-1 length

load( "./data/parenthood2.Rdata" )
head(parenthood2, 10)
cor( parenthood2 ) # Again, full of NAs

cor(parenthood2, use = "complete.obs") # Ignores ANY rows with missing data

cor(parenthood2, use = "pairwise.complete.obs") # ignores obs only when variable specifically missing
