## sudo apt-get install libcurl4-openssl-dev
install.packages(c("tidyverse", "dslabs"))
library(dslabs)
data(movielens)

## First
library(tidyverse)
library(dslabs)
data(murders)

murders %>%
  ggplot(aes(population, total, label=abb, color=region)) +
  geom_label()

## Second
#Code: solving the equation
# assigning values to variables
a <-1
b <-1
c <--1

### solving the quadratic equation
(-b + sqrt(b^2 - 4*a*c))/(2*a)
(-b - sqrt(b^2 - 4*a*c))/(2*a)


a

b

c

a+c

'''
Using variables 1
What is the sum of the first 
positive integers?
  
  We can use the formula 
to quickly compute this quantity.

Instructions
100 XP
Define n<-100
Then use R to compute the sum of 1 through 100 using the formula n(n+1)/2
. What is the sum?
  Make sure you do not erase or change the sample code on DataCamp exercises.
'''

# Here is how you compute the sum for the first 20 integers
20*(20+1)/2 

# However, we can define a variable to use the formula for other values of n
n <- 20
n*(n+1)/2

n <- 25
n*(n+1)/2

# Below, write code to calculate the sum of the first 100 integers
n <- 100
n*(n+1)/2

'''
Using variables 2
What is the sum of the first 1000 positive integers?
  
  We can use the formula (n+1)/2
to quickly compute this quantity.

Instructions
100 XP
Use the same formula as the last exercise but change the value of n. Make sure you use the variable name n to store the value 1000.
Instead of typing the result, use the formula and defined variable.
'''
# Below, write code to calculate the sum of the first 1000 integers 
n <- 1000

n * (n+1) / 2


'''
Functions
Run the following code in the R console:

n <- 1000
x <- seq(1,n)
sum(x)

Based on the result, what do you think the functions seq and sum do? You can use the help system.'''

n <- 1000
x <- seq(1,n)
sum(x)

help('seq')

help('sum')

'''
Instructions
50 XP
Possible answers

seq creates a sequence of numbers and sum adds them
'''

'''
Nested function calls 1
In math and programming we say we evaluate a function when we replace arguments with specific values. So if we type log2(16) we evaluate the log2 function to get the log base 2 of 16 which is 4.

In R it is often useful to evaluate a function inside another function. For example, sqrt(log2(16)) will calculate the log to the base 2 of 16 and then compute the square root of that value. So the first evaluation gives a 4 and this gets evaluated by sqrt to give the final answer of 2.

Instructions
100 XP
Use one line of code to compute the log, to the base 10, of the square root of 100.
Make sure your code includes the log10 and sqrt functions.'''

# log to the base 2 
log2(16)

# sqrt of the log to the base 2 of 16:
sqrt(log2(16))

# Compute log to the base 10 (log10) of the sqrt of 100. Do not use variables.
log10(sqrt(100))

'''Nested functions call 2
Which of the following will always return the numeric value stored in x? You can try out examples and use the help system in the R console.'''
x<-50
log(exp(x))



