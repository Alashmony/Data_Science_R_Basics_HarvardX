library(dslabs)

# R is also a programming language

# an example showing the general structure of an if-else statement
# a <- 0
a <- 2
if (a != 0) {
    print(1 / a)
} else {
    print("No reciprocal for 0.")
}

# The ifelse() is useful to apply the condition on a column / variable

a <- c(0, 1, -3, 5)
b <- ifelse(a > 0, a, NA)
b

# ifelse() to replace NAs
data(na_example)
sum(is.na(na_example)) # 145

# replace with the mean
avg_na <- mean(na_example, na.rm = TRUE)
avg_na
no_nas <- ifelse(is.na(na_example), avg_na, na_example)
sum(is.na(no_nas))

# any()
all_trues <- c(TRUE, TRUE, TRUE)
all_falses <- c(FALSE, FALSE, FALSE)
any_tfs <- c(TRUE, FALSE, TRUE)

any(all_trues) # TRUE
any(all_falses) # FALSE
any(any_tfs) # TRUE

# all()
all(all_trues) # TRUE
all(all_falses) # FALSE
all(any_tfs) # FALSE

x <- 25
s <- 5

test <- function(x) {
    s <- 1 / x
}

test
x
s

# for Loop
# create a function that sums the values from 1 to x
cmp_total <- function(x) {
    sum(1:x)
}
cmp_total(5)

# create another function that uses the (n * (n+1)) / 2
my_func <- function(x) {
    (x * (x + 1)) / 2
}
my_func(5)

iter_till <- 25

# create list with values from both functions
with_total <- vector(length = iter_till)
for (i in 1:iter_till) {
    with_total[i] <- cmp_total(i)
}
with_total

# create another list with the second function
with_func <- vector(length = iter_till)
for (i in 1:iter_till) {
    with_func[i] <- my_func(i)
}
with_func

# plot both
plot(1:iter_till, with_total)
lines(1:iter_till, with_func)


test <- vector(length = 5)
for (i in 1:5) {
    test[i] <- i^2
}
test
i

x <- c(1, 2, -3, 4)
if (all(x > 0)) {
    print("All Positives")
} else {
    print("Not All Positives")
}

"
Conditional continued
Which of the following expressions is always FALSE when at least one entry of a logical vector x is TRUE? You can try examples in the R console.

Possible answers

all(x)
any(x)
any(!x)
**all(!x)**
"

"ifelse
The function nchar tells you how many characters long a character vector is. For example:

char_len <- nchar(murders$state)
head(char_len)
The function ifelse is useful because you convert a vector of logicals into something else. For example, some datasets use the number -999 to denote NA. A bad practice! You can convert the -999 in a vector to NA using the following ifelse call:

x <- c(2, 3, -999, 1, 4, 5, -999, 3, 2, 9)
ifelse(x == -999, NA, x)
If the entry is -999 it returns NA, otherwise it returns the entry.

Instructions
100 XP
We will combine a number of functions for this exercise.

Use the ifelse function to write one line of code that assigns to the object new_names the state abbreviation when the state name is longer than 8 characters and assigns the state name when the name is not longer than 8 characters.
For example, where the original vector has Massachusetts (13 characters), the new vector should have MA. But where the original vector has New York (8 characters), the new vector should have New York as well."

data(murders)
# Assign the state abbreviation when the state name is longer than 8 characters
new_names <- ifelse(nchar(murders$state) > 8, murders$abb, murders$state)
new_names

"Defining functions
You will encounter situations in which the function you need does not already exist. R permits you to write your own. Let's practice one such situation, in which you first need to define the function to be used. The functions you define can have multiple arguments as well as default values.

To define functions we use function. For example the following function adds 1 to the number it receives as an argument:

my_func <- function(x){
    y <- x + 1
    y
}
The last value in the function, in this case that stored in y, gets returned.

If you run the code above R does not show anything. This means you defined the function. You can test it out like this:

my_func(5)
Instructions
100 XP
We will define a function sum_n for this exercise.

Create a function sum_n that for any given value, say n, creates the vector 1:n, and then computes the sum of the integers from 1 to n.
Use the function you just defined to determine the sum of integers from 1 to 5,000."

# Create function called `sum_n`
sum_n <- function(x) {
    sum(1:x)
}
# Use the function to determine the sum of integers from 1 to 5000
sum_n(5000)

"Defining functions continued...
We will make another function for this exercise. We will define a function altman_plot that takes two arguments x and y and plots the difference y-x in the y-axis against the sum x+y in the x-axis.

You can define functions with as many variables as you want. For example, here we need at least two, x and y. The following function plots log transformed values:

log_plot <- function(x, y){
    plot(log10(x), log10(y))
}
This function does not return anything. It just makes a plot.

Instructions
100 XP
We will make another function for this exercise.

Create a function altman_plot that takes two arguments x and y and plots y-x (on the y-axis) against x+y (on the x-axis).
Note: don't use parentheses around the arguments in the plot function because you will confuse R."

# Create `altman_plot`
altman_plot <- function(x, y) {
    plot(x + y, y - x)
}


"Lexical scope
Lexical scoping is a convention used by many languages that determine when an object is available by its name. When you run the code below you will see which x is available at different points in the code.

x <- 8
my_func <- function(y){
    x <- 9
    print(x)
    y + x
}
my_func(x)
print(x)
Note that when we define x as 9, this is inside the function, but it is 8 after you run the function. The x changed inside the function but not outside.

Instructions
100 XP
After running the code below, what is the value of x?

x <- 3
my_func <- function(y){
    x <- 5
    y
    print(x)
}
my_func(x)"

# Run this code
x <- 3
my_func <- function(y) {
    x <- 5
    y + 5
}

# Print the value of x
print(x)

"For loops
In the next exercise we are going to write a for-loop. In that for-loop we are going to call a function. We define that function here.

Instructions
100 XP
Write a function compute_s_n that for any given
 computes the sum
.
Report the value of the sum when n=10."
# Here is an example of a function that adds numbers from 1 to n
example_func <- function(n) {
    x <- 1:n
    sum(x)
}

# Here is the sum of the first 100 numbers
example_func(100)

# Write a function compute_s_n with argument n that for any given n computes the sum of 1 + 2^2 + ...+ n^2
compute_s_n <- function(x) {
    range <- 1:x
    ve <- vector(length = x)
    for (i in 1:x) {
        ve[i] <- i^2
    }
    sum(ve)
}

# Report the value of the sum when n=10
compute_s_n(10)

'For loops continued...
Now we are going to compute the sum of the squares for several values of
. We will use a for-loop for this. Here is an example of a for-loop:

results <- vector("numeric", 10)
n <- 10
for(i in 1:n){
    x <- 1:i
    results[i] <- sum(x)
}
Note that we start with a call to vector which constructs an empty vector that we will fill while the loop runs.

Instructions
100 XP
Define an empty numeric vector s_n of size 25 using s_n <- vector("numeric", 25).
Compute the the sum when n is equal to each integer from 1 to 25 using the function we defined in the previous exercise: compute_s_n
Save the results in s_n'
# Define a function and store it in `compute_s_n`
compute_s_n <- function(n) {
    x <- 1:n
    sum(x^2)
}

# Create a vector for storing results
s_n <- vector("numeric", 25)

# write a for-loop to store the results in s_n
for (i in 1:25) {
    s_n[i] <- compute_s_n(i)
}

'Checking our math
If we do the math, we can show that
S_n = 1^2 + 2^2 + 3^2 + \dots + n^2 =  n(n+1)(2n+1)/6 

We have already computed the values of
 from 1 to 25 using a for loop.

If the formula is correct then a plot of
 versus
 should look cubic.

Let\'s make this plot.

Instructions
100 XP
Define n <- 1:25. Note that with this we can use for(i in n)
Use a for loop to save the sums into a vector s_n <- vector("numeric", 25)
Plot s_n (on the y-axis) against n (on the x-axis).'
# Define the function
compute_s_n <- function(n){
  x <- 1:n
  sum(x^2)
}

# Define the vector of n
n <- 1:25

# Define the vector to store data
s_n <- vector("numeric", 25)
for(i in n){
  s_n[i] <- compute_s_n(i)
}

#  Create the plot 
plot(n, s_n)

'Checking our math continued
Now let\'s actually check if we get the exact same answer.

Instructions
100 XP
Confirm that s_n and 
 are the same using the identical command.'


 # Define the function
compute_s_n <- function(n){
  x <- 1:n
  sum(x^2)
}

# Define the vector of n
n <- 1:25

# Define the vector to store data
s_n <- vector("numeric", 25)
for(i in n){
  s_n[i] <- compute_s_n(i)
}

# Check that s_n is identical to the formula given in the instructions.
identical(s_n, (n*(n+1)*(2*n+1))/6)
 ###############


 library(dslabs)
data(heights)

fems <- ifelse(heights$sex == "Female", 1,2)
sum(fems)

above_72 <- ifelse(heights$height > 72, heights$height, 0)
mean(above_72)

inches_to_ft <- function(x){
    x/12
}

inches_to_ft(144)
less_5ft <- ifelse(inches_to_ft(heights$height) < 5, 1,0)
sum(less_5ft)


# define a vector of length m
m <- 10
f_n <- vector(length = m)

# make a vector of factorials
for(n in 1:m){
f_n[n] <- factorial(n)
}

# inspect f_n
f_n
