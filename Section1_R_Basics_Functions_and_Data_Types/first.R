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