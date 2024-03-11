# Numeric Vector - 
codes <- c(350, 124, 818)


# Character vectors
country <- c("Italy", "Canada", "Egypt")

# Naming elements
codes <- c(italy = 380, Canada = 124, Egypt = 818)
codes
#It's still a numeric vector even after naming the elements
class(codes)

# Naming with strings
codes <- c("italy" = 380, "Canada" = 124, "Egypt" = 818)
codes

#Naming with name() function
codes <- c(380, 124,818)
country <- c("Italy", "Canada", "Egypt")
names(codes) <- country
codes

#creating array of elements 
#both boundaries are inclusive 
seq(1,10)

#change the default increment size
seq(1,10,2)

#Same can be done with the colon
1:10

#Sub-sit with []
codes[3]

#sub-sit with an array
codes[c(1,3)]

#Sub-sit can be also with sequence
codes[1:2]

#access with names
codes["Egypt"]

#access multiple names
codes[c("Egypt", "Canada")]

# Vector Coercion (Guessing the data type)
x <- c(1, "Canada", 2)
x

#the type of all is now Char
class(x)

# Casting data types
x <- c(1,2,3)
x

y <- as.character(x)
y
class(y)

z <- as.integer(y)
z
class(z)

# Failure to cast data type of an element will make an NA element
x <- c("1", "b", "5")
x
#note the warning and the vector elements
z <- as.numeric(x)
z

# Store the sequence in the object a
a <- seq(1, 10, length.out = 100)

# Determine the class of a
class(a)


class(seq(1, 10, 0.5))

#integers occupy less space in the computer memory than numbers

# Store the sequence in the object a
a <- seq(1, 10)

# Determine the class of a
class(a)

# Check the class of 1, assigned to the object a
class(1)

# Confirm the class of 1L is integer
class(1L)


#Sort the dataset by the column total 
library(dslabs)
data(murders)
sort(murders$total)

x <- c(1, 5, 3, 4, 2)
x

#sort with sort()
sort(x)

# get the order to be sorted with order
order(x)

#sort with order
index <- order(x)
x[index]
#OR
x[order(x)]

# To get the most dangros states, we can get the order of $total and sort the state
index <- order(murders$total)
murders$state[index]

# max() and which.max
max(murders$total)
max_order <- which.max(murders$total)
max_order
murders$state[max_order]

#same applies with min() and which.min()

#rank() returns the rank of each element in this position
order(x)
rank(x)

x <- c(31, 4, 15, 92, 65)
order(x)
rank(x)


args(rank)

?order


# Define a variable states to be the state names from the murders data frame
states <- murders$state

# Define a variable ranks to determine the population size ranks 
ranks <- rank(murders$population)

# Define a variable ind to store the indexes needed to order the population values
ind <- order(murders$population)

# Create a data frame my_df with the state name and its rank and ordered from least populous to most 
my_df <- data.frame(states = states[ind], ranks = ranks[ind])


# Using new dataset 
library(dslabs)
data(na_example)

# Checking the structure 
str(na_example)

# Find out the mean of the entire dataset 
mean(na_example)

# Use is.na to create a logical index ind that tells which entries are NA
ind <- is.na(na_example)

# Determine how many NA ind has using the sum function
sum(ind)


# Note what we can do with the ! operator
x <- c(1, 2, 3)
ind <- c(FALSE, TRUE, FALSE)
x[!ind]

# Create the ind vector
library(dslabs)
data(na_example)
ind <- is.na(na_example)

# We saw that this gives an NA
mean(na_example)

# Compute the average, for entries of na_example that are not NA 
mean(na_example[!ind])

# The name of the state with the maximum population is found by doing the following
murders$state[which.max(murders$population)]

# how to obtain the murder rate
murder_rate <- murders$total / murders$population * 100000

# ordering the states by murder rate, in decreasing order
murders$state[order(murder_rate, decreasing=TRUE)]

# Assign city names to `city` 
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")

# Store temperature values in `temp`
temp <- c(35, 88, 42, 84, 81, 30)

# Convert temperature into Celsius and overwrite the original values of 'temp' with these Celsius values
temp <- (temp-32) * 5/9
# Create a data frame `city_temps` 
city_temps <- data.frame(city = city, temp = temp)


#What is the sum of the following equation: 1 + 1/2^2 + 1/3^2 + ... + 1/100^2? Thanks to Euler we know it should be close to 


#Define an object x that contains the numbers 1 through 100
#Compute the sum 1 + 1/2^2 + 1/3^2 + ... + 1/100^2.


# Define an object `x` with the numbers 1 through 100
x <- 1:100
# Compute the sum 
sum(1 / x^2)


# Load the data
library(dslabs)
data(murders)

# Store the per 100,000 murder rate for each state in murder_rate
murder_rate <- murders$total / murders$population * 100000
# Calculate the average murder rate in the US 
mean(murder_rate)


name <- c("Mandi", "Amy", "Nicole", "Olivia")
distance <- c(0.8, 3.1, 2.8, 4.0)
time <- c(10, 30, 40, 50)

time <- time / 60
time

speed <- distance / time
speed

names(speed) <- name
speed["Olivia"]
speed
max(speed)
names(time) <- name
time["Olivia"]
