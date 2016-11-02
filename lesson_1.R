################################################
## Exercises ###################################
################################################


# c - concatenate
#     - takes two (or more) vector and joins them together
c(1, 2, 3)
c(c(1,2,3), c(4,5,6))
#     - they need to be of the same type, though!
v <- c(1,2, "three")
v

#OK - here we go
# cat in R - concatenates items to screen (like a print statement)
cat("hello", " world")
# now:
x = c("hello", " world")
x
h = c(2,3,4,4)
cat(h,x)

# UP next: cbind
a <- c(1,2,3,4,5,6)
b <- c("a", "b", "c", "d", "e", "f")
c <- c(1.1, 2.1, 3.1, 4.4, 5.5, 6.6)
cbind(a,b,c)
rbind(a,b,c)
# I can do this. Descriptions in help menu is good
# But the examples in the help menu seem strange becasue they are trying to cbind
# things that don't exists yet. I'll just keep it simple for now.
m1 <- matrix(1:9, nrow=3, ncol = 3)
m2 <- matrix(34:42,nrow=3, ncol = 3)
m3 <- matrix(54:70, ncol=3, nrow=4)
cbind(m1,m2)
rbind(m1,m2)
cbind(m1,m3)# this should fail
rbind(m1,m3)
# Must have same number of rows to cbind a matrices
# Must have same number of cols to rbind matrices


#col is the vector of integers describing the 
# create an identity 5-by-5 matrix
x <- matrix(0, nrow = 5, ncol = 5)
# now,for elements where row is col (diaganols), enter 1. Clever
x[row(x) == col(x)] <- 1
x
# extract an off-diagonal of a matrix
ma <- matrix(1:12, 3, 4)
ma
ma[row(ma) == col(ma) + 1]
# OK, I guess. Could be useful in a matrix?
ma[col(ma) == 3] # Looks like you can also index
ma[,3] # same thing, of course
ma[row(ma) == col(ma)] <- 17
ma
ma[ma[,3] == ma[3,]] <- 33
ma # Same thing by just using the index. Cannot see how row and col used differently
# This means that I do not fully understand how to use row and col.  Needs attention!
#  *******COME BACK TO THIS (ABOVE) ******

# cut
# This one is strange in that it is easier to explain in words than by example. Syntax complex
# because lots of things to do. So only check out when needed. Essenatially, use when you want to 
# convert numeric data to categorical. You can use cut to chop out data within sertain ranges
# into differnet categories. Nice control of intervals and limits. 

# diff

# first note that the help menu for this refers to another tool: cumsum
# cumulative sums:
y <- (cumsum(1:10))
y # see how each element is simply a sum of the previous ones. Handy! Remember that!

# diff just takes the differnces. But let's try with a less contrived example:

a <- c(2, 23, 45, 56, 78, 122)
diff(a) # Note that there is always one less element, of course
 # Another potentially useful one!

# Next is dim. But erhaps even more useful is dim names
# Can use this to check dimensions (dim) and col/row names (dimnames) of matrix or data frame
get.species.list <- function(my.file = "/Users/Paul13/Dropbox/docs_wolf/Python_files/2016_Programming/r-intro-Wolflab/species_list.csv"){
  species.data <- read.csv(my.file, header = TRUE, as.is = TRUE )
  return(species.data)
}
dimnames(species.data)
dim (species.data)

# Well this could be very handy to check that everything is copacetic

# rownames, colnames, names - alerady used these. Self explanatory. Don't you just love that!
rownames(species.data)
colnames(species.data)
names(species.data)

# Nice!

# expand.grid
# "Create a data frame from all combinations of the supplied vectors or factors"

# Similar to itertools in Python. Creates a matric of all combinations of two vectors
# Maybe
# lets try:

a <- c(11,12,13,14,14,15)
b <- c("a", "B", "f")
c <- expand.grid(a,b)
c # c is a vector containing 18 elements, each a pair from a and b. All combinations
# I can't remember when I have used this, but I know I have needed such a tool in Python
# remember "expand.grid". Note that name is not a clear indication of ow I would likely use it!

# with. I need to master this one I can see. So far finding this very confusing. Looks for other examples
# Don't start with help menu - That might be useful later when you get it used to this.
# Now looking at things a bit differently. Might need a rubber duck at some point
# Check out http://www.statmethods.net/stats/withby.html 
# also: http://www.endmemo.com/program/R/with.php
# for some gentler introduction
# "The with( ) function applys an expression to a dataset" That makes sense to me:
# Thus, with(mydata, expression(arg1, arg2))

mult.by.three <- function(x){
  return(x*3)
}
my.vect <- c(4,5,6,7,8,9)
f <- my.vect*3
f # that was easy
# Let's try with with
with(my.vect, mult.by.three()) #arghhh. Failed again. Obviously missing something

#  *******COME BACK TO THIS (ABOVE) ******







################################################
## Bonus exercises #############################
################################################


bonus.text <- "It was the best of times, it was the worst of times, it was the age of
wisdom, it was the age of foolishness, it was the epoch of belief, it
was the epoch of incredulity, it it was the season of Light, it was the
season of Darkness, it was the spring of hope, it was the winter of
despair, we had everything before us, we had nothing before us, we
were all going direct to Heaven, we were all going direct the other
way- in short, the period was so far like the present period, that
some of its noiosiest authorities insisted on its being received, for
good or for evil, in the superlative degree of comparison only."


#All instances of “the”:
print(gregexpr("\\bthe\\b", bonus.text, ignore.case = TRUE)) 
# but how to contol the output? Nothing in help

#What lines end with vowels
print(gregexpr("\n", bonus.text, ignore.case = TRUE))