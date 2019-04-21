###Import data
install.packages("")
library("") #Load packages, you are attaching packages into your library

#Example CSV Data.
read.csv("swimming_pools.csv", stringsAsFactors = TRUE)

#The "stringAsFactors" variable either converts your data frame columns to character (FALSE) or factors (TRUE).

#Tab-delimited File:
read.delim("file.txt", stringsAsFactors = "True or False")

#Exotic file format:
  #Example would be a text file with the data seperated by "/".
  #Use read.table(). Can read any tabular file and has a massive number of arguments that can be passed through it.


#Example
read.table("file.txt", header = TRUE, sep = "/", stringsAsFactors = FALSE)
#Header var.: Tells R if the first rows of the file are variables names (TRUE). It's set to FALSE as default. Will read first row as observations even if the first row is variable names.
#sep: Explains to R what is the field serperator.

#Source: DataCamp

##Selection within Delim files
df <- data[which.min(data$variable),] <- #This would return the index of the smallest value in a vector.
df <- data[which.max(data$variable),] <- #This would return the index of the largest value in a vector.

#Classifying column classess
read.delim("my_file.txt", colClasses = c("character", "numeric", "logical")).
#If you put "NULL" in the vector, this column will be skipped and not loaded into the data.

##Special packages
readr (works with tibble) & data.table
#To import csv & tsv (tab seperated value) files you do: read_csv() & read_tsv().

#read_delim: 1st arguement specify data/data path, "delim" - 2nd arguement specifics the character that is used to seperate the field. Both mandatory.

#Colum names and types: 
col_names() 
col_types()
ex. read_delim("states3.txt", delim = "/", col_names = c("state", "city", "pop", "area")
ex. read_delim("states3.txt", delim = "/", col_types = "ccdd" <-- Short string representation. c = character, d = double (numeric), l = logical, i = integer

#Controlling which data you control in flat files: skip & n_max (arguements within read_delim()):
skip() = # of lines you are skipping/ignoring before importing data
n_max() = # of lines you are importing. 		

## Data.table package
fread() : #Import files and can infer column types and separators. Faster, convienent, and more reliable than read.table()
# Variables of interest: drop or select. 
#Example: Only want to keep the first and fifth variable of the data. These are options on how to do so:
fread("path/to/file.txt", drop = 2:4)
fread("path/to/file.txt", select = c(1, 5))
fread("path/to/file.txt", drop = c("b", "c", "d"))
fread("path/to/file.txt", select = c("a", "e"))

#source: DataCamp

## Microsoft Excel
#readxl package: excel_sheets(), #list different sheets as a simple character vector, & read_excel(), actually import data into R.

data <- read_excel("data.xlsx", sheet = "my_sheet", col_names = True, False, Character, col_types = (NULL, Character vector, "blank", skip = # of rows you want to skip before reading the data)

#Read multiple sheets at once: 
  my_workbook <- lapply(excel_sheets("data.xlsx"), read_excel, path = "data.xlsx")

#gdata package: Data manipulation. Can only support XLS unless you have an additional driver. Easy 
#Perl       read.csv()
#XLS   -------> CSV -------> R data frame

#Source: Datacamp

#XLConnect:
#Work with Excel through R, Bridge between Excel and R.
library("XLConnect")
book <- loadWorkbook("cities.xlsx")
getSheets(book) => #same function as excel_sheets. 
  
# To import data from a sheet, use readWorksheet().
#Example:
my_book <- loadWorkbook("urbanpop.xlsx")
print(getSheets(my_book))
print(readWorksheet(my_book, "1967-1974"))

#To add new data to existing Excel worksheet:
use createSheet("workbook", name = new sheets name)
#use writeWorksheet:
writeWorksheet("workbook", "data we want to add", "which sheet")


#use saveWorkbook() to save changes and have the new data incorporated into the excel spreadsheet.
#Other commands are renameSheet() & removeSheet()
                   
#source: Datacamp
                   
### Data Manipulation/Wrangling
#functions you can use:
is.(), as.*(), unlist(), 
#add elements to the end of a vector: 
append() 
#reverse elements in a data structure
rev()
seq(# you start at, # you end at, determines the increment)
  
##logical operators 
#& = and
#| = or 
#!= not equal
#== equal
                   
##Conditional statements
#if statement
if(condition) {expr} 
  x <- 5
if (x < 0) {print("x is a negative #")}
                   
#while loop
while(condition) {expr} #must have a condition that eventually becomes false otherwise the while lopp will run indefinitely
                   
#for loop
for(var in seq) {expr}
#a for loop works with list just like it does with vector.
                  
#example: 
  citites <- c("New York", "Paris", "London", "Tokyo", "Rio de Janeiro", "Cape Town")
  for(city in cities) {print(city)}
  "New York"
   "Paris"
   etc....
                   
#next statement:
   #inside for loop: skips the iteration that's True and continues the for loop.
   #for loop: v2, Manual looping index
   #Same vector as before:
      for(i in 1:length(cities)) {print(cities[i])}
            #must subset our vector "cities[i] because we are manuallying indexing ourselfves.
                   
    #looping over a matrix: nested for loop
      for(var1 in seq1) {
        for(var2 in seq2) {
            expr}
        }
  #lapply, apply function over list or vector, always outputs a list. Can make the list into a vector by using unlist().
     lapply(variable, function)
  #sapply, "simplify apply", produces an array or a matrix depending on the # of elements involved. apply function over list or vector, Tries to simplify list to array.
    sapply(variable, function, "USE.NAMES = True" optional argument)
  #vapply apply function over list or vector, EXPLICITY specifiy output format. vapply is best used to simplify lapply, not sapply.
    vapply(variable, function)
                   
##Ways to detect patterns in our data
    #grelp() helps us figure out a specific character in list:
        grepl(pattern = <regez>, x = <string>)
          #Example:
            animals <- c("cat", "moose", "impala", "ant", "kiwi")
                grepl(pattern = "a", x = animals)
                   #or
                grepl(pattern = "^a", x = aniamls)
                   #or
                grepl(pattern = "a$", x = animals)
                   
    #grep() very similar to grelp(), but gives the indicies of the true elements grepl returns.
                   
    #sub() helps us substitute the first specific character of each element in a list. 
          sub(pattern = <regex>, replacement = <str>, x = <str>)
              #Example:
                sub(pattern = "a", replacement = "o", x = animals)
                   
                   #gsub() just like sub(), but this will replace every character specified in the function.
                   
                   #gather(data, key, value, ...) -  helps rearrange columns and add them as values in the data set. Helps consolidate wide data sets into long data sets. 
                   
                   #spread(data, key, value) - opposite of gather. Helps consolidate long data sets into a wide data set. 

#Source: Datacamp
                
### GRAPHING DATA/VISUALIZATION
                   
#dplyr package
    glimpse() - provides a summary like str(), but provides a cleaner version of str().
                   
#ggvis package. 
                   plot(x-variable, y-variable) i.e. plot(potatoes$texture, potatoes$moistness)
  #histogram - shows the values of one variable on a histogram.
                   hist(lunch$perc_free_red)
  #scatter plot - shows the relationship between two variables
                   plot(lunch$year, lunch$perc_free_red)
  #boxplot(data) -> very simple way to display one variable
                   
#ggplot 
    #ex. 
        ggplot(mbta_boat, aes(x = month, y = thou_riders, col = mode)) +  geom_point() + 
        scale_x_discrete(name = "Month", breaks = c(200701, 200801, 200901, 201001, 201101)) + 
        scale_y_continuous(name = "Avg Weekday Ridership (thousands)")
             
#Source: Datacamp      
                   
###ANALYSIS
                   
  #Cleaning Data/Preparing Data for Visualization/Analysis:
      #Functions to help:
          #dim() - returns the dimensions of an object
          #head() - displays the first 6 rows of the object, unless you specify specifically. i.e. head(lunch, n = 15)
          #names() - returns the names associated with an object i.e. column names
          #class() - returns the class of the data
          #str() - provides useful summary of any data.
          #summary() - provides summary statistics of the data.
          #separate(data, col, into) - serperate two columns into indiviual columns.
              #ex. 
                   bmi_cc_clean <- serperate(bmi_cc, col=Country_ISO, into = c("Country", "ISO"), sep = "/")
          #unite(data, col, ...) - units two individual columns into a single columns. 
              #ex. 
                   bmi_cc <- unite(bmi_cc_clean, Country_ISO, Country, ISO, sep = "-")
                   
      #Coersions:
         #as.numeric() -> ex. as.numeric(True)
         #as.character() - ex. as.character(2016)
         #as.integer()
         #as.factor()
         #as.logical()
                   
      #string Manipulation
         #str_trim()
              str_trim(" this is a test    ")=> "this is a test"
         #str_pad()
              str_pad("24493", width = 7, side = "left", pad = "0") => 0024493.#Pad zeros on the left to make all passcodes 7 digits in length.
         #str_detect()
              str_detect(input string, what string we are looking for) #can help detect text in specific columns or a pattern of strings in your dataset. 
         #str_replace()
              str_replace(input string, string being replace, what we are replacing it with). 
         #tolower() - make all lowercase
              tolower()
         #toupper() - make all uppercase
              toupper()
         #str_replace_all() - can replace the same pattern of text throughout an entire spreadsheet
              str_replace_all()
              
#Source: Datacamp
              
    #Missing and special values
        #missing data may be random, but knwowing how the data is missed could be vital information.
            #is.na(df) -> will show you where NA's show up 
              is.na(social_df)
            #any(is.na()) -> this tells you if there are any NA's in your data frame
            #sum(is.na()) -> shows how many NA values are in a column. 
            #summary() -> can tell how many NA's are in each column. 
            #complete.cases() -> helps you find rows with missing values.
            #which(is.na()) -> shows which rows have missing data in them.