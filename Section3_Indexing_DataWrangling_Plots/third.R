library(dslabs)

data(murders)

# defining murder rate as before
murder_rate <- murders$total / murders$population * 100000
# creating a logical vector that specifies if the murder rate in that state is less than or equal to 0.71
index <- murder_rate <= 0.71
# determining which states have murder rates less than or equal to 0.71
murders$state[index]
# calculating how many states have a murder rate less than or equal to 0.71
sum(index)

# creating the two logical vectors representing our conditions
west <- murders$region == "West"
safe <- murder_rate <= 1
# defining an index and identifying states with both conditions true
index <- safe & west
murders$state[index]

ind <- c("Alabama","Bolbol" )
ind

ind %in% murders$state


!ind %in% murders$state

ind !%in% murders$state

!match(ind, murders$state)

match(!ind, murders$state)

murders$state


which(murders$state == "massachusetts") # True

match(c("Massachusetts"), murders$state) #X

c("massachusetts") %in% murders$state # True

which(murders$state = "massachusetts") #X


# Store the murder rate per 100,000 for each state, in `murder_rate`
murder_rate <- murders$total / murders$population * 100000

# Store the `murder_rate < 1` in `low` 
low <- murder_rate <1 

# Get the indices of entries that are below 1
which(low, murder_rate)

# Names of states with murder rates lower than 1
murders$state[low]


'''
Now we will extend the code from the previous exercises to report the states in the Northeast with a murder rate lower than 1.

Define low as before.
Use the & operator to create a new object ind that is true when low is true and the state is in the Northeast
Use the brackets [ and ind to show the state names that satisfy this condition
'''

# Store the murder rate per 100,000 for each state, in `murder_rate`
murder_rate <- murders$total/murders$population*100000

# Store the `murder_rate < 1` in `low` 
low <- murder_rate < 1

# Create a vector ind for states in the Northeast and with murder rates lower than 1. 
northeast <- murders$region == "Northeast"

ind <- low & northeast

# Names of states in `ind` 
murders$state[ind]

'''
In a previous exercise we computed the murder rate for each state and the average of these numbers.

How many states are below the average?
'''


# Compute the average murder rate using `mean` and store it in object named `avg`
avg <- mean(murder_rate)

# How many states have murder rates below avg ? Check using sum 
sum(murder_rate < avg)


'''
Match
In this exercise we use the match function to identify the states with abbreviations AK, MI, and IA.
'''

# Store the 3 abbreviations in a vector called `abbs` (remember that they are character vectors and need quotes)
abbs <- c("AK", "MI", "IA")

# Match the abbs to the murders$abb and store in ind
#ind <- murders$abb %in% abbs
ind <- match(abbs, murders$abb)

# Print state names from ind
murders$state[ind]

'''
Which of the following are actual abbreviations: MA, ME, MI, MO, MU?

Define a character vector with the abbreviations MA, ME, MI, MO, MU.
Use the %in% operator to create a logical vector that is TRUE when the abbreviation is in murders$abb.
'''

# Store the 5 abbreviations in `abbs`. (remember that they are character vectors)
abbs <- c("MA", "ME", "MI","MO", "MU")

# Use the %in% command to check if the entries of abbs are abbreviations in the the murders data frame
abbs %in% murders$abb

'''
We are again working with the characters abbs <- c("MA", "ME", "MI", "MO", "MU")

In a previous exercise we computed the index abbs%in%murders$abb. 
Based on that, and using the which function and the ! operator, get the index of the entries of abbs that are not abbreviations.
Show the entries of abbs that are not actual abbreviations.
'''


# Store the 5 abbreviations in abbs. (remember that they are character vectors)
abbs <- c("MA", "ME", "MI", "MO", "MU") 

# Use the `which` command and `!` operator to find out which index abbreviations are not actually part of the dataset and store in `ind`
ind <- which(!abbs %in% murders$abb)

# Names of abbreviations in `ind`
abbs[ind]


library(dslabs)
data(murders)
library(dplyr)

murders <- mutate(murders, rate = total/population*100000)
head(murders)

filter(murders, rate <= .71)

new_table <- select(murders, state, region, rate)
filter(new_table, rate <= .71)

# All steps in one line using %>%
data(murders)
murders %>% mutate(rate = total/population*100000) %>% select(state,region, rate) %>% filter(rate < .71)


murders %>% filter(region == "Northeast")

filter(murders, region == "Northeast")

murders %>% select(region == "Northeast")

murders %>% filter(murders, region == "Northeast")

select(murders, region == "Northeast")

# Loading data
library(dslabs)
data(murders)

# Loading dplyr
library(dplyr)

# Redefine murders so that it includes a column named rate with the per 100,000 murder rates
murders <- mutate(murders, rate = total/population*100000)

# Redefine murders to include a column named rank
# with the ranks of rate from highest to lowest
murders <- mutate(murders, rank = rank(-rate))


# Use select to only show state names and abbreviations from murders
select(murders, state, abb)


# Filter to show the top 5 states with the highest murder rates
filter(murders, rank <=5)

# Use filter to create a new data frame no_south
no_south <- filter(murders, region != "South")
# Use nrow() to calculate the number of rows
nrow(no_south)


# Create a new data frame called murders_nw with only the states from the northeast and the west
murders_nw <- filter(murders, region %in% c("Northeast", "West"))
# Number of states (rows) in this category 
nrow(murders_nw)

# add the rate column
murders <- mutate(murders, rate =  total / population * 100000, rank = rank(-rate))

# Create a table, call it my_states, that satisfies both the conditions: that satisfies both the conditions: 
#it is in the Northeast or West and the murder rate is less than 1.
my_states <- filter(murders, region %in% c("Northeast", "West") & rate <1)
# Use select to show only the state name, the murder rate and the rank
select(my_states, state, rate, rank)

# Load library
library(dplyr)

## Define the rate column
murders <- mutate(murders, rate =  total / population * 100000, rank = rank(-rate))

# show the result and only include the state, rate, and rank columns, all in one line, in that order
murders %>% filter(region %in% c("Northeast", "West"), rate < 1) %>% select(state, rate, rank)


'''
mutate, filter and select
Now we will reset murders to the original table by using data(murders).
Use one line of code to create a new data frame, called my_states, that has murder rate and rank columns (with the rank ordered from highest to lowest), considers only states in the Northeast or West which have a murder rate lower than 1, and contain only the state, rate, and rank columns. The line should have four components separated by three %>% operators:

The original dataset murders
A call to mutate to add the murder rate and the rank.
A call to filter to keep only the states from the Northeast or West and that have a murder rate below 1.
A call to select that keeps only the columns with the state name, the murder rate, and the rank.
The line should look something like this my_states <- murders %>% mutate something %>% filter something %>% select something. Columns in the final data frame MUST be in the order: state, rate, rank.
'''

# Loading the libraries
library(dplyr)
data(murders)

# Create new data frame called my_states (with specifications in the instructions)
my_states <- murders %>% mutate(rate = total/population*100000,rank = rank(-rate)) %>% filter(region %in% c("Northeast" , "West") & rate < 1) %>% select(state, rate, rank)

library(dplyr)
library(dslabs)
data("murders")

# a simple scatterplot of total murders versus population
x <- murders$population /10^6
y <- murders$total
plot(x, y)

# a histogram of murder rates
murders <- mutate(murders, rate = total / population * 100000)
hist(murders$rate)

# boxplots of murder rates by region
boxplot(rate~region, data = murders)


# Load the datasets and define some variables
library(dslabs)
data(murders)

population_in_millions <- murders$population/10^6
total_gun_murders <- murders$total

plot(population_in_millions, total_gun_murders)

# Transform population (not population in millions) using the log10 transformation and save to object log10_population
log10_population <- log10(murders$population)
# Transform total gun murders using log10 transformation and save to object log10_total_gun_murders
log10_total_gun_murders <- log10(murders$total)
# Create a scatterplot with the log scale transformed population and murders 
plot(log10_population, log10_total_gun_murders)

# Store the population in millions and save to population_in_millions 
population_in_millions <- murders$population/10^6


# Create a histogram of this variable
hist(population_in_millions)

# Create a boxplot of state populations by region for the murders dataset
boxplot(population~region, data = murders)

library(tidyverse)
library(dslabs)
library(dplyr)
data(murders)

murders <- mutate(murders, rate = total / population * 10^5)
# minimum, median, and maximum murder rate for the states in the West region
?summarize
s <- murders %>% 
  filter(region =="West") %>% 
  summarize(minimum = min(rate),
            median = median(rate),
            maximum = max(rate))
s

# accessing the components with the accessor $
s$maximum
s$median

# average rate unadjusted by population size
mean(murders$rate)

# average rate adjusted by population size
us_murder_rate <- murders %>% 
  summarize(rate = sum(total) / sum(population) * 10^5)
us_murder_rate

# minimum, median, and maximum murder rate for the states in the West region using quantile
# note that this returns a vector
s_2 <- murders %>% filter(region == "West") %>% summarise(range = quantile(rate, c(0,0.5,1)))
s_2

# returning minimum, median, and maximum as a data frame
my_quantile <- function(x){
  r <- quantile(x, c(0,0.5,1))
  data.frame(min = r[1], med = r[2], max = r[3])
}

s_3 <- murders %>% filter(region == "West") %>% summarize(my_quantile(rate))

library(tidyverse)
library(dplyr)
library(dslabs)
data(murders)

us_murder_rate <- murders %>% summarize(rate = sum(total) / sum(population) * 10^5) %>% pull(rate)
us_murder_rate


# The difference is that 
# average rate adjusted by population size
us_murder_rate <- murders %>% 
  summarize(rate = sum(total) / sum(population) * 10^5)
us_murder_rate

# us_murder_rate is stored as a data frame
class(us_murder_rate)

# the pull function can return it as a numeric value
us_murder_rate %>% pull(rate)

# using pull to save the number directly
us_murder_rate <- murders %>% 
  summarize(rate = sum(total) / sum(population) * 10^5) %>%
  pull(rate)
us_murder_rate

# us_murder_rate is now stored as a number
class(us_murder_rate)




# Using the dot "." placeholder to access the data in the pipe "%>%"
murder_rate_us <- murders %>% summarize(rate = sum(total) / sum(population) *10^5) %>% .$rate
murder_rate_us
class(murder_rate_us)



# Group by 
grouped_murders <- murders %>% group_by(region)
grouped_murders
# note the line "# Groups:   region [4]"

# Pivot table
murders_per_region <- murders %>% group_by(region) %>% summarize(rate = sum(total) / sum(population) * 10^5)
murders_per_region
# note that we have 4 rows, one for each region

# I need to check the behavior with quantile
quantiles_per_region <- murders %>% mutate(rate = total/population * 10^5) %>% group_by(region) %>%  summarize(rate = quantile(rate, c(0, .5, 1)))
quantiles_per_region
# warnings appeared and data seems messy, another column is needed to define which is which.


# arrange data 
murders_rate_sorted <- murders %>% mutate(rate = total / population * 10^5) %>% arrange(rate)
murders_rate_sorted %>% head()

# Desc arrange
murders_inverted <- murders %>% mutate(rate = total / population * 10^5) %>% arrange(desc(rate))
murders_inverted %>% head()

# Arrange by two columns
murders %>% arrange(desc(region), population) %>% head()

# choosing top values
head(murders_inverted)

murders_rate_sorted %>% top_n(10, population)
# here data is unsorted in the population, but we get the top 10, we can sort them if needed

'''
Practice Exercise. National Center for Health Statistics
To practice our dplyr skills we will be working with data from the survey collected by the United States National Center for Health Statistics (NCHS). This center has conducted a series of health and nutrition surveys since the 1960’s.

Starting in 1999, about 5,000 individuals of all ages have been interviewed every year and then they complete the health examination component of the survey. Part of this dataset is made available via the NHANES package which can be loaded this way:
  
  library(NHANES)
data(NHANES)
The NHANES data has many missing values. Remember that the main summarization function in R will return NA if any of the entries of the input vector is an NA. Here is an example:
  
  library(dslabs)
data(na_example)
mean(na_example)
sd(na_example)
To ignore the NAs, we can use the na.rm argument:
  
  mean(na_example, na.rm = TRUE)
sd(na_example, na.rm = TRUE)
'''

install.packages("NHANES")

library(NHANES)
data(NHANES)

'''
Exercise 1. Blood pressure 1
Let\'s explore the NHANES data. We will be exploring blood pressure in this dataset.

First let\'s select a group to set the standard. We will use 20-29 year old females. Note that the category is coded with 20-29, with a space in front of the 20! The AgeDecade is a categorical variable with these ages.

To know if someone is female, you can look at the Gender variable.

Instructions
100 XP
Filter the NHANES dataset so that only 20-29 year old females are included and assign this new data frame to the object tab.
Use the pipe to apply the function filter, with the appropriate logicals, to NHANES.
Remember that this age group is coded with 20-29, which includes a space. You can use head to explore the NHANES table to construct the correct call to filter.
'''

library(NHANES)
data(NHANES)
NHANES

tab <- NHANES %>% filter(Age > 20, Age <= 29, Gender == "female")
head(tab)

## fill in what is needed
tab <- NHANES %>% filter(AgeDecade == " 20-29", Gender == "female")
head(tab)

'''
Exercise 2. Blood pressure 2
Now we will compute the average and standard deviation for the subgroup we defined in the previous exercise (20-29 year old females), which we will use reference for what is typical.

You will determine the average and standard deviation of systolic blood pressure, which are stored in the BPSysAve variable in the NHANES dataset.

Instructions
100 XP
Complete the line of code to save the average and standard deviation of systolic blood pressure as average and standard_deviation to a variable called ref.
Use the summarize function after filtering for 20-29 year old females and connect the results using the pipe %>%. When doing this remember there are NAs in the data!
'''


ref <- NHANES %>% filter(AgeDecade == " 20-29" & Gender == "female") %>% summarize(average = mean(BPSysAve, na.rm = TRUE), standard_deviation = sd(BPSysAve, na.rm = TRUE))
ref

'''
Exercise 3. Summarizing averages
Now we will repeat the exercise and generate only the average blood pressure for 20-29 year old females. For this exercise, you should review how to use the place holder . in dplyr or the pull function.

Instructions
100 XP
Modify the line of sample code to assign the average to a numeric variable called ref_avg using the . or pull.
'''

library(dplyr)
library(NHANES)
data(NHANES)
## modify the code we wrote for previous exercise.
ref_avg <- NHANES %>%
  filter(AgeDecade == " 20-29" & Gender == "female") %>%
  summarize(average = mean(BPSysAve, na.rm = TRUE), 
            standard_deviation = sd(BPSysAve, na.rm=TRUE)) %>%
  pull(average)

ref_avg

## modify the code we wrote for previous exercise.
ref_avg <- NHANES %>%
  filter(AgeDecade == " 20-29" & Gender == "female") %>%
  summarize(average = mean(BPSysAve, na.rm = TRUE), 
            standard_deviation = sd(BPSysAve, na.rm=TRUE)) %>%
  .$average
ref_avg

'''
Exercise 4. Min and max
Let\'s continue practicing by calculating two other data summaries: the minimum and the maximum.

Again we will do it for the BPSysAve variable and the group of 20-29 year old females.

Instructions
100 XP
Report the min and max values for the same group as in the previous exercises.
Use filter and summarize connected by the pipe %>% again. The functions min and max can be used to get the values you want.
Within summarize, save the min and max of systolic blood pressure as minbp and maxbp.
'''

## complete the line
NHANES %>%
  filter(AgeDecade == " 20-29"  & Gender == "female") %>%
  summarize(minbp = min(BPSysAve, na.rm = TRUE),
            maxbp = max(BPSysAve, na.rm = TRUE))

'
Exercise 5. group_by
Now let\'s practice using the group_by function.

What we are about to do is a very common operation in data science: you will split a data table into groups and then compute summary statistics for each group.

We will compute the average and standard deviation of systolic blood pressure for females for each age group separately. Remember that the age groups are contained in AgeDecade.

Instructions
100 XP
Use the functions filter, group_by, summarize, and the pipe %>% to compute the average and standard deviation of systolic blood pressure for females for each age group separately.
Within summarize, save the average and standard deviation of systolic blood pressure (BPSysAve) as average and standard_deviation.
Note: ignore warnings about implicit NAs. This warning will not prevent your code from running or being graded correctly.
'

##complete the line with group_by and summarize
NHANES %>%
  filter(Gender == "female") %>%
  group_by(AgeDecade) %>%
  summarize(average = mean(BPSysAve, na.rm = TRUE),
            standard_deviation = sd(BPSysAve, na.rm = TRUE) )

            
'
Exercise 6. group_by example 2
Now let\'s practice using group_by some more. We are going to repeat the previous exercise of calculating the average and standard deviation of systolic blood pressure, but for males instead of females.

This time we will not provide much sample code. You are on your own!
  
  Instructions
100 XP
Calculate the average and standard deviation of systolic blood pressure for males for each age group separately using the same methods as in the previous exercise.

Note: ignore warnings about implicit NAs. This warning will not prevent your code from running or being graded correctly.
'

NHANES %>% filter(Gender == "male") %>% group_by(AgeDecade) %>%
  summarize(average = mean(BPSysAve, na.rm = TRUE),
            standard_deviation = sd(BPSysAve , na.rm = TRUE))
'
Exercise 7. group_by example 3
We can actually combine both of these summaries into a single line of code. This is because group_by permits us to group by more than one variable.

We can use group_by(AgeDecade, Gender) to group by both age decades and gender.

Instructions
100 XP
Create a single summary table for the average and standard deviation of systolic blood pressure using group_by(AgeDecade, Gender).
Note that we no longer have to filter!
  Your code within summarize should remain the same as in the previous exercises.
Note: ignore warnings about implicit NAs. This warning will not prevent your code from running or being graded correctly.
'

NHANES %>% group_by(AgeDecade, Gender) %>% 
  summarize(average = mean(BPSysAve, na.rm = TRUE),
            standard_deviation = sd(BPSysAve, na.rm = TRUE))

'
Exercise 8. Arrange
Now we are going to explore differences in systolic blood pressure across races, as reported in the Race1 variable.

We will learn to use the arrange function to order the outcome acording to one variable.

Note that this function can be used to order any table by a given outcome. Here is an example that arranges by systolic blood pressure.

NHANES %>% arrange(BPSysAve)
If we want it in descending order we can use the desc function like this:

NHANES %>% arrange(desc(BPSysAve))
In this example, we will compare systolic blood pressure across values of the Race1 variable for males between the ages of 40-49.

Instructions
100 XP
Compute the average and standard deviation for each value of Race1 for males in the age decade 40-49.
Order the resulting table from lowest to highest average systolic blood pressure.
Use the functions filter, group_by, summarize, arrange, and the pipe %>% to do this in one line of code.
Within summarize, save the average and standard deviation of systolic blood pressure as average and standard_deviation.
'

NHANES %>% filter(AgeDecade == " 40-49", Gender == "male") %>%
  group_by(Race1) %>% summarize(
    average = mean(BPSysAve, na.rm = TRUE),
    standard_deviation = sd(BPSysAve, na.rm = TRUE)
  ) %>% arrange(average)

##########################

install.packages("data.table")

library(data.table)

murders_table <- setDT(murders)


# selecting in data.table - 2 methods
murders_table[, c("state", "region")] |> head()
murders_table[, .(state, region)] |> head()

# adding or changing a column in data.table
murders[, rate := total / population * 100000]
head(murders_table)
murders[, ":="(rate = total / population * 100000, rank = rank(population))]
head(murders_table)

# y is referring to x and := changes by reference
x <- data.table(a = 1)
y <- x

x[,a := 2]
y

y[,a := 1]
x

# use copy to make an actual copy
x <- data.table(a = 1)
y <- copy(x)
x[,a := 2]
y

# subsetting in dplyr
filter(murders, rate <= 0.7)

# subsetting in data.table
murders_table[rate <= 0.7]

# combining filter and select in data.table
murders_table[rate <= 0.7, .(state, rate)]

# combining filter and select in dplyr
murders %>% filter(rate <= 0.7) %>% select(state, rate)

data(heights)
heights <- setDT(heights)

# summarizing in dplyr
s <- heights %>% 
  summarize(average = mean(height), standard_deviation = sd(height))

# summarizing in data.table
s <- heights[, .(average = mean(height), standard_deviation = sd(height))]

# subsetting and then summarizing in dplyr
s <- heights %>% 
  filter(sex == "Female") %>%
  summarize(average = mean(height), standard_deviation = sd(height))

# subsetting and then summarizing in data.table
s <- heights[sex == "Female", .(average = mean(height), standard_deviation = sd(height))]

# previously defined function
median_min_max <- function(x){
  qs <- quantile(x, c(0.5, 0, 1))
  data.frame(median = qs[1], minimum = qs[2], maximum = qs[3])
}

# multiple summaries in data.table
heights[, .(median_min_max(height))]

# grouping then summarizing in data.table
heights[, .(average = mean(height), standard_deviation = sd(height)), by = sex]


data(murders)
murders <- setDT(murders)
murders[, rate := total / population * 100000]

# order by population
murders[order(population)] |> head()

# order by population in descending order
murders[order(population, decreasing = TRUE)] 

# order by region and then murder rate
murders[order(region, rate)]

# view the dataset
murders %>% group_by(region)

# see the class
murders %>% group_by(region) %>% class()

# compare the print output of a regular data frame to a tibble
gapminder
as_tibble(gapminder)

# compare subsetting a regular data frame and a tibble
class(murders[,1])
class(as_tibble(murders)[,1])

# access a column vector not as a tibble using $
class(as_tibble(murders)$state)

# compare what happens when accessing a column that doesn't exist in a regular data frame to in a tibble
murders$State
as_tibble(murders)$State

# create a tibble
tibble(id = c(1, 2, 3), func = c(mean, median, sd))


library(dslabs)
data(heights)
options(digits = 3) 

head(heights)

avg_height <- heights |> summarize(h = mean(height, na.rm = TRUE))
as.numeric(avg_height)

ind <- heights$height > as.numeric(avg_height)

sum(ind)

heights |> filter(sex == "Female") |> summarize(cnt = sum(height > as.numeric(avg_height)))

n <- count(heights)
females_prop <- sum(heights$sex == "Female") /n * 100
females_prop

the_min <- min(heights$heigh)

?match

min_loc <- match(the_min, heights$height)

heights$sex[min_loc]

the_max <- max(heights$heigh)

x <- 50:82
x

sum(!x %in% heights$height) 

heights2 <- heights |> mutate(ht_cm = height * 2.54)
heights2$ht_cm[18]

mean(heights2$ht_cm)

females <- filter(heights2, sex == "Female")
females
count(females)
mean(females$ht_cm)


library(dslabs)
data(olive)
head(olive)

# percent palmitic acid versus palmitoleic acid 
plot(olive$palmitic, olive$palmitoleic)

hist(olive$eicosenoic)

boxplot(palmitic~region, data = olive)
