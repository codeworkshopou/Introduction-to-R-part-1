#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Title: Introduction to R - Computer Science in Modern Biology Workshop
# Purpose: Introduce R for beginning coders
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Welcome to Intro to R1! #

### NOTE: Were you unable to download R or R Studio properly? Are you working 
  # from someone else's computer?
# Have no fear! Try RStudio Cloud (https://rstudio.cloud/)
  # A web interface that has the same functionality as RStudio on your desktop!

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 1.a: Creating an R project ---------------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Steps:
# 1. Create file folder - somewhere easy to find, like your desktop!
# 2. Open R studio
# 3. Select cube icon with green plus / File > New Project... > New Directory 
  # > New Project > select your folder
# 4. A new screen will pop up! 
# 5. Open file folder
# 6. Create new folders:
  # a. Data
  # b. Code
  # c. Data Processed
  # d. Results

# this isn't necessary to do for R to work, but will help you to stay organized moving forward!
# now move our data from the flash drive into the Data folder, so you know
  # where it is!

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 1.b: Basics in R--------------------------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# comment your code with the #!
  # when you try to run lines with a # in front R will skip them
  # allows you to take notes along your coding journey!

### R is a calculator ###

3 + 5

4 + 9

123453 / 2947593

# difference between script (top left) and console (bottom left)
# highlight history tab from environment panel (top right)

### Saving objects in R and viewing object data ###

# Environment Pane; how to name "best" - 
  # must begin with letter, caps or lowercase accepted

a <- 5 + 4

a

# naming tips! 
  # easy to remember, not too long
  # clear and concise!
  # cannot start with a number
  # avoid: "." / "if" / "else" / "for"

1a <- 3 + 9
a1 <- 3 + 9

# shortcuts for arrows!
  # PC: Alt and - 
  # Mac: Option and -

a * 45

a / a1

### Saving a script (file naming...) ###

# do this now!
# Scripts can be shared, edited, resaved, copy/pasted, etc. (much like a text editor)

# Style tips for writing code:
# 1) R is case sensitive ("A" does not equal "a")
# 2) Best practice is to put spaces between object, values, commas, etc. 
  # (though R does not require this) - readability / style!

x <- 134 + 4387
y<-134+4387

# 3) Missing parentheses, commas, or quotation marks cause a vast majority of 
  # errors - R will tell you!
# 4) Your collaborators and future self will appreciate detailed comments
# 5) Make sure the console (bottom left) has a blue ">" before running 
# (if it has a "+" then it DID NOT FINISH the previous code for some reason)

### Errors and warning messages ###

# Errors BREAK the code
# Warnings run it (often not an issue, but keep an eye out that R is doing what you want)

A
c <- b - 3) * 2
cbind(c(1, 2, 3), c(1, 2, 3, 4))

# note that R tries to tell you if something is wrong! see the red x at line 104?
  # and the red squiggles like you misspelled a word? R tries to tell you if 
  # your code won't work

### Basic functions and help files ###

sqrt(a)
# square root

round(3.14159)

vector <- c(1, 2, 5, 6, 8)
# c() is "concatonate" (or "combine") - tells R to take all the things within 
  # parentheses together

vector

?mean
# ? will open the help file (bottom right) for you to see how the function works!
  # scroll all the way to the bottom for examples of functions used in code!

# multiple ways to get the same result!
mean(x = vector)

mean(vector)


### Types of data in R ###

# numeric/integer, character/strings, logical, factor (others are less common)

# character: "a", "swc"
# numeric: 2, 15.5
# integer: 2L (the L tells R to store this as an integer) - acts like numeric
# logical: TRUE, FALSE
# factor (limited number of unique values): "Female", "Male"


# Types of data structures in R:
# 1) vector - 1D, holds only 1 type of data
# 2) matrix - 2D, holds only 1 type of data
# 3) data frame - 2D, each column can be different type of data
# data frame is very common and useful; other types are generally less common (e.g., lists)

df1 <- data.frame("Column1" = c("A", "B", "C", "D", "E"), 
                  "Column2" = vector,
                  "Column3" = c("hi", "my", "name", "is", "Rachel"))
# quotations needed! otherwise R will look in stored values, like a or a1

df1 # will appear in console
View(df1) # will open a new window in your source
# can also click df1 from your environment


# functions to help explore data frames!
length(df1) # how many columns?
View(df1) # open a new window
class(df1) # what type of object is it?
str(df1) # what kinds of variables do we have? 

# $ allows you to pick specific columns by name!
df1$Column2
mean(df1$Column2) # mean of Column 2
max(df1$Column2) # maximum value in Column 2
min(df1$Column2) # minimum value in Column 2

# QUESTION - what happens if you try to take the mean of Column1?
  # know the types of data you are working with

summary(df1)
# breaks down min, median, mean, max and other information


### take a break! ###

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 1.c: Working with data in R --------------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### setting up your workspace! ###

# 1) clear environment
# CAUTION - once you clear something you can't unclear it!
rm(a) # single files 

remove(list=ls()) # completely clear environment
  # can also use broom icon in environment pane

# 2) set your working directory (wd)
  # tab-complete!!

getwd() # where are you working from? 
setwd("C:/Users/mhope/Desktop/Introduction to R (Part I)/Electronic Materials (Flash Drives)/")

# can also:
  # go to Files in bottome right pane
  # set wd using the "..."
  # search and select your folder
  # Select "More" 
  # Select "Set as Working Directory"

# with R we can already see that there are multiple ways to do the same thing :)


## OPEN CSV FOR TROPICAL STORM DATA

# Getting files prepared for R from Excel
# What is an NA?

# when you are creating your data files, you can use "NA" for missing data in 
  # excel - R knows how to handle that

# Load in data file to R
# "TropicalStormData.csv" - pull up to have copied and saved

storms <- read.csv("data/storms.csv") # this will be the actual file location
  # can also click on the file in bottom right pane under Files tab
  # select "Import Dataset..."
  # select "Import"

# take a look at the data!
  # alwasy important to know what you are working with!
head(storms) # top 5 rows
str(storms)
summary(storms)
View(storms) # can also click directly from environment


# Indexing from an object
# (when using square brackets, row ALWAYS comes first)
  # [row, column]
storms[5, 1]
storms[5, ]
storms[ , 1]
storms$Year[5]

# if you want to see multiple rows...
storms$Year[c(5, 10)] # see two rows (5 and 10) with ","
storms$Year[c(5:10)] # see multiple rows (5 through 10) with ":"

storms$Number.Tropical.Storms[1]
# see the first row from a specific column

# getting more specific...

# The number of tropical storms in 2004? 
storms$Number.Tropical.Storms[storms$Year == 2004] # note == ! 
  # Answer = 15

# Years in which the number of tropical storms exceeded 15? 
storms$Year[storms$Number.Tropical.Storms > 15]
  # Answer = 2003, 2005, 2008, 2010, 2011, 2012

# other useful tools: #

# 1) to include multiple years: | (like or)
# The number of tropical storms that occurred in 2004, 
  # and the number of tropical storms that occurred in 2009
storms$Number.Tropical.Storms[storms$Year == 2004 | storms$Year == 2009]
# numerical order! not by Year

# 2) & would index anything that fulfills BOTH conditions
storms$Number.Tropical.Storms[storms$Year == 2004 & storms$Number.Tropical.Storms == 14] 
# gives a warning because that combination doesn't exist in the same row
  # both conditions must be met


# PRACTICE # 

# 1) index 5 most recent years of storm counts
View(storms)

# Pull each individual year
storms$Number.Tropical.Storms[storms$Year == 2010 | storms$Year == 2011 | storms$Year == 2012 |
                                storms$Year == 2013 | storms$Year == 2014]

# could also reorder to index
# notice that we've created a new object so we don't corrupt our original data
storms_by_year <- storms[order(storms$Year),]

tail(storms_by_year, 5) # tail() is the opposite of head()!

# 2) index the storm counts for years 2003, 2007, and 2008
storms$Number.Tropical.Storms[storms$Year == 2003 | storms$Year == 2007 | storms$Year == 2008]

# 3) index the year that had the highest numbers of storms
storms$Year[storms$Number.Tropical.Storms == max(storms$Number.Tropical.Storms)]



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 1.c: Practice! ---------------------------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# PRACTICE loading csv file into R
# (a new data file -- the modified iris dataset)

# 1) load in the data file and peek at the columns/structure']


# Let's reorder these by plant ID
  # order() function
IRIS_by_ID <- IRIS[order(IRIS$Plant.ID),]

# 2) calculate the average sepal length across all years and species


# 3) find the earliest and latest years of data



# 4) INDEXING:
#    a) function "which"
#    What is the maximum sepal length across all years and species?
max(IRIS_by_ID$Sepal.Length)

#    Which species has the maximum sepal length?
IRIS_by_ID$Species[which(IRIS_by_ID$Sepal.Length == max(IRIS_by_ID$Sepal.Length))]

# '==' is not the same as '='
  # '=' is like ->

#    In which year does the maximum sepal length occur?


#    Which specific plant had the highest sepal length?


#    How can we check whether any of these answers are correct? Indexing!
IRIS_by_ID[132,]

#    b) functions "unique" and "length"
#    What different species of iris can be found in this dataset?
unique(IRIS_by_ID$Species)

#    How many individual plants are found in this dataset 
  # (this should be equal to the number of rows in your dataset - 
  # where else can you find this information?)


#    How many unique values for sepal length exist? 
  # If there are fewer unique values of sepal length than there are unique 
  # values of plant ID, what does that tell you about your irises?


#    c) More indexing: find the average sepal length for all versicolor 
  # irises in the year 2018
# Answer: 6.26


# End of Day 1! How is everyone feeling?

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 2.0: Day 2: Introduction to R ------------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Go online, check out Stack Overflow! ###
  # great source for when you have questions
  # just like coding, efficient Googling is a skill!

# see how we have set up our script? 
  # if you go right under the source window, can see which number / part of the 
  # code we are working in and you can jump to a different section of the code
# this is personal preference, but can help keep you organized when you have a 
  # lot of code to work with

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 2.a: Set up your workspace ---------------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# 1) clear environment - directly or in panel

remove(list=ls())

# 2) set your working directory

getwd()
setwd("")

# 3) INSTALLING PACKAGES

install.packages(c("dplyr", "tidyr"))
# you can also do this manually in the bottom right pane 
# select "Packages" tab
# select "Install Packages"
# search and select the packages you want
# hit "Install"

# but just because you installed something doesn't mean it is loaded...

# LOADING PACKAGES

library(dplyr)
library(tidyr)
# manual option here as well - check boxes in Packages view

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 2.b: Manipulating Data -------------------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# dplyr: four main functions and pipe tool
# data frame name is ALWAYS the first argument for these if using alone

# select
# filter
# mutate
# summarize
# %>% 

# upload files
  # can't remember how to do something? you can use CTRL+f to search your code,
  # just like a word document!
    # how did we load the Iris dataset yesterday?
find.csv("")

## choose specific column(s) by name, make a new object

Species_Year <- select(IRIS, Species, Year)
Species_Year

## choose row(s) by condition

Year2016 <- filter(IRIS, Year == 2016)
Year2016

# create new column(s)
  # mutate()

IRIS_Ratio <- mutate(IRIS, RatioPLengthSLength = Petal.Length/Sepal.Length)
IRIS_Ratio

# summarize (must become fewer rows than original)
MeanRatio <- summarize(IRIS_Ratio, MeanRatio = mean(RatioPLengthSLength))
MeanRatio

# pipe tool for multiple steps at once
# do NOT need to name data frame after the first line if using this, 
  # since it will automatically start with the data frame remaining from the 
  # previous line of code

# Use filter and select to create a new data frame of irises with relatively 
  # long petals when compared to their respective sepals
# only want to know plant id, the ratio, species, and year

LongPetals <- IRIS_Ratio %>%
  filter(RatioPLengthSLength >= 0.5) %>%
  select(Plant.ID, RatioPLengthSLength, Species, Year)
View(LongPetals)

# pipe tool shortcut: CTRL + Shift + M


## grouping and summarizing

# What is the average ratio of petal length to sepal length for each species?
SpeciesRatio <- IRIS_Ratio %>%
  group_by(Species) %>%
  summarize(MeanGroupRatio = mean(RatioPLengthSLength))
SpeciesRatio
# before we the mean ratio for all plants at once (MeanRatio) - 1 row
  # now we get the mean ratio for each species - 3 rows

# What if this species average varies by year?
SpeciesRatio_by_Year <- IRIS_Ratio %>%
  group_by(Species,Year) %>%
  summarize(MeanGroupRatio = mean(RatioPLengthSLength))
SpeciesRatio_by_Year
# and now we get the mean ratio for each species for each year


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 2.c: Practice ----------------------------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# using the dplyr tools, create a new object that gives the average number of  
# storms in years since 2010 (inclusive)

# 1. load in tropical storm data set


# 2. create a new object - select years 2010-2014, take the average of 
  # number of tropical storms



# reformatting with pivot()

# pivot_long
storms_long <- storms %>%                          # takes storms data
  pivot_longer(cols = c(starts_with("Severity")),  # selecting which cols to collapse
               names_to = "severity_type",         # creates 1 column based of 5 severity columns
               values_to = "No_Sev_Storms")        # creates 1 column for values

# pivot_wide
storms_wide <- storms_long %>% 
  pivot_wider(names_from = "severity_type",       # creates new columns based on severity_type        
              values_from = "No_Sev_Storms")      # where to pull the values from

## PRACTICE:
# make a new object, with the mean number of storms of each severity 
  # category over time (for all years)




#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 2.d: Practice ----------------------------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## EXPLORE THE TURKEY DATA FROM NORTH CAROLINA COUNTIES
# this practice will include some googling!

## 1) Read in the provided csv file into R and give it a new object name


## 2) Look at the data, structure, summary, etc. to familiarize yourself with it



# a) how many counties are there?


# b) how many counties did not produced turkeys?



# c) how many years of data do we have?


## 3) How many turkeys total were produced in North Carolina in 2012?


# a) max number of turkeys produced? by which county?



# b) min number of turkeys produced (not NAs)? by which county?



# c) average number of turkeys across North Carolina?


## 4) Find the 5 counties producing the most turkeys. 


## 5) Find the bottom 5 counties producing the least turkeys. 



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 3.a: Basic Plotting in R -----------------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## histogram - only set your x axis
  # y axis will be the count

hist(IRIS_Ratio$RatioPLengthSLength)


## boxplot - set x and y

boxplot(Sepal.Width~Species,IRIS)


## scatterplot - set x and y

plot(Sepal.Length ~ Petal.Length, data = IRIS_Ratio)


## trend line - create a linear model with lm()
fit <- lm(Sepal.Length ~ Petal.Length, data = IRIS_Ratio)
summary(fit) # how good is your linear model?

plot(Sepal.Length ~ Petal.Length, data = IRIS_Ratio)       
lines(IRIS_Ratio$Petal.Length, fitted(fit), col="blue")


## PRACTICE: Iris data
  # make a scatterplot of the Petal to Sepal Length ratio vs Petal width
  # make a scatterplot of the Petal to Sepal Length ratio vs Sepal width

  # make a best fit trend line for both
  ## which trend line fits the data better?


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 3.b: Basic Statistics in R ---------------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# correlations between two variables - how closely are they related?

cor(x = IRIS_Ratio$Petal.Length, y = IRIS_Ratio$Sepal.Length)


# t-test - one-sided (number of tropical storms with zero) - how different are they?

t.test(storms$Number.Tropical.Storms)



# 2-sided t-test to compare two different sets of data/columns

t.test(x = IRIS_Ratio$Petal.Length[IRIS_Ratio$Species == "setosa"], y = IRIS_Ratio$Petal.Length[IRIS_Ratio$Species == "virginica"])


# ANOVA (1-way)
# does petal length differ by species?
# NOTE: data needs to be summarized in LONG format

SepalWidth.aov <- aov(Sepal.Width ~ Species, data = IRIS_Ratio)
summary(SepalWidth.aov)
TukeyHSD(SepalWidth.aov)


## LINEAR REGRESSION
# linear regression of tropical storm trends over time

# are the number of long-distance birds changing over time?

bird.mod <- lm(LongDistance ~ Year, data = birdsWide)
summary(bird.mod)


## PRACTICE:  are the number of tropical storms per year changing?




#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 1.c: Practice Answers --------------------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# 1) load in the data file and peek at the columns/structure
IRIS <- read.csv("iris_modified.csv")

# Let's reorder these by plant ID
IRIS_by_ID <- IRIS[order(IRIS$Plant.ID),]

# 2) calculate the average sepal length across all years and species
mean(IRIS$Sepal.Length)

# 3) find the earliest and latest years of data
max(IRIS$Year)
min(IRIS$Year)

# 4) INDEXING:
#    a) function "which"
#    What is the maximum sepal length across all years and species?
max(IRIS_by_ID$Sepal.Length)
#    Which species has the maximum sepal length?
IRIS_by_ID$Species[which(IRIS_by_ID$Sepal.Length == max(IRIS_by_ID$Sepal.Length))]

# '==' is not the same as '='
# '=' is like ->

#    In which year does the maximum sepal length occur?
IRIS_by_ID$Year[which(IRIS_by_ID$Sepal.Length==max(IRIS_by_ID$Sepal.Length))]

#    Which specific plant had the highest sepal length?
IRIS_by_ID$Plant.ID[which(IRIS_by_ID$Sepal.Length==max(IRIS_by_ID$Sepal.Length))]

#    How can we check whether any of these answers are correct? Indexing!
IRIS_by_ID[132,]

#    b) functions "unique" and "length"
#    What different species of iris can be found in this dataset?
unique(IRIS_by_ID$Species)

#    How many individual plants are found in this dataset 
# (this should be equal to the number of rows in your dataset - where else can you find this information?)
length(IRIS_by_ID$Plant.ID)

#    How many unique values for sepal length exist? If there are fewer unique values of sepal length than there are unique values of plant ID, what does that tell you about your irises?
length(unique(IRIS_by_ID$Sepal.Length))

#    c) More indexing: find the average sepal length for all versicolor irises in the year 2018
# Answer: 6.26
mean(IRIS_by_ID$Sepal.Length[IRIS_by_ID$Species == "versicolor" & IRIS_by_ID$Year == 2018])


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 2.c: Practice Answers --------------------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# using the dplyr tools, create a new object that gives the average number of  
# storms in years since 2010 (inclusive)

# 1. load in tropical storm data set
storms <- read.csv("TropicalStormData.csv")

# 2. create a new object - select years 2010-2014, take the average of 
# number of tropical storms
storms_2010_2014 <- storms %>%                                    # create a new object
  filter(Year >= 2010) %>%                                        # select years 2010 - 2014
  summarise(Average = mean(Number.Tropical.Storms, na.rm = TRUE)) # take the mean



# find the mean number of storms of each severity category over time (for all years)
mean_storms_total <- storms %>%
  summarise(mean_sev1 = mean(Severity.1),
            mean_sev2 = mean(Severity.2),
            mean_sev3 = mean(Severity.3),
            mean_sev4 = mean(Severity.4),
            mean_sev5 = mean(Severity.5))


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 2.d: Practice Answers --------------------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## EXPLORE THE TURKEY DATA FROM NORTH CAROLINA COUNTIES
# this practice will include some googling!

## 1) Read in the provided csv file into R and give it a new object name
turkey <- read.csv("Turkey_production_2012.csv", header = TRUE)

## 2) Look at the data, structure, summary, etc. to familiarize yourself with it
head(turkey)
colnames(turkey)
str(turkey)

# a) how many counties are there?
length(unique(turkey$County))

# b) how many counties did not produced turkeys?
summary(turkey$Value)

table(is.na(turkey$Value))

# c) how many years of data do we have?
length(unique(turkey$Year))

## 3) How many turkeys total were produced in North Carolina in 2012?
sum(turkey$Value, na.rm = TRUE)

# a) max number of turkeys produced? by which county?
max(turkey$Value, na.rm = TRUE)

turkey[which.max(turkey$Value), ]

# b) min number of turkeys produced (not NAs)? by which county?
min(turkey$Value, na.rm = TRUE)

turkey[which.min(turkey$Value), ]

# c) average number of turkeys across North Carolina?
mean(turkey$Value, na.rm = TRUE)

## 4) Find the 5 counties producing the most turkeys. 
turkey %>% top_n(5)

## 5) Find the bottom 5 counties producing the least turkeys. 
turkey %>% top_n(-5)