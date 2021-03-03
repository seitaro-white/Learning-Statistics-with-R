library(lsr) # Load Libraries
load(file = "./data/booksales.Rdata") # Load Files

books <- read.csv(file = "./data/booksales.csv") # Load CSV

save.image("myfirstrdatafile.Rdata") # Save Rdata
save(books, file = "justbooks.Rdata") # Save Variables

print(1 / 0) # Infinity
print(0 / 0) # NaN - Not a Number
print(NA) # Not Available - Missing Data
print(NULL) # No Value

profit <- c(200, 300, 350, 250)
names(profit) <- c("Q1", "Q2", "Q3", "Q4") # Assign labels to vector elements
print(profit)
print(profit["Q1"])

# Variable Classes
x <- 5
print(class(x))
x <- TRUE
print(class(x))
x <- "Foo"
print(class(x))

# Factors - Representing Nominal Scale Variables

group <- c(1, 1, 1, 2, 2, 2, 3, 3, 3)
group <- as.factor(group)
group + 2

levels(group) <- c("group_1", "group_2", "group_3", "new_group")
print(group)

# DataFrames
first_names <- c("Tony", "Carmela", "Phil", "Silvio")
last_names <- c("Soprano", "Soprano", "Leotardo", "Dante")
gender <- c("M", "F", "M", "M")
location <- c("New Jersey", "New Jersey", "New York", "New Jersey")

sopranos <- data.frame(first_names, last_names, gender, location)
print(sopranos)
print(sopranos$location)

print(names(sopranos))

# Lists
joe <- list(age = 25,
            nerd = TRUE,
            parents = c("Ikuko", "Terry"))
print(joe)

joe$job <- "Data Scientist"
# Lists can contain other lists
