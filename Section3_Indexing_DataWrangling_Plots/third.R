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

