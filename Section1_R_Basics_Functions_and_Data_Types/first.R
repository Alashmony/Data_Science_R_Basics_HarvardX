#install.packages("dslabs","tidyverse")
#installed.packages()

#library(dslabs)

#my_first_code 
'''
library(tidyverse)
library(dslabs)
data(murders)

murders %>%
  ggplot(aes(population, total, label=abb, color=region)) +
  geom_label()
'''
#Objects
'''
a <- 1
a
b = 2
b
ls()
'''
#Functions
'''
ls
help(ls)
help("ls")
args(ls)
?ls
?sqrt
help("+")
?"+"
data()
Co2
'''
#Data Types
class(ls)
class(CO2)
class(1)

data("murders")
str(murders)
head(murders)
murders$population
names(murders)
pop <- murders$population
length(pop)
length(murders$population)

a <- murders$abb
length(a)

b <- murders[["abb"]]
identical(a,b)

# We can see the class of the region variable using class
class(murders$region)

# Determine the number of regions included in this variable 
length(levels(murders$region))

'''Tables
The function table takes a vector as input and returns the frequency of each unique element in the vector.
We will use the table function to answer this question.
Use the table function in one line of code to create a table showing the number of states per region.
'''
# Write one line of code to show the number of states per region
table(murders[["region"]])

a <- 2
b <- -1
c <- -4

solution1 <- (-1 *b + sqrt(b^2 - (4*a*c))/2*a
solution2 <- (-1 *b - sqrt(b^2 - (4*a*c))/2*a

                    
              