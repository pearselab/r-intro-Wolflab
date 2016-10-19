################################################
## Exercises ###################################
################################################

# c - concatenate
#     - takes two (or more) vector and joins them together
c(1, 2, 3)
c(c(1,2,3), c(4,5,6))
#     - they need to be of the same type, though!
c(1,2, "three")


#OK - here we go
# cat in R
# Well, I thought I understood this until I read the help file. I had already read that c means
# concatenate. Now I find that cat aloso means concatenate. 
# would be nice if different functions had different names
# cat seems to join things and send the joined stuff to screen.  Let's try:
cat("hello", " world")
# now:
x = c("hello", " world")
x
#ok - this is starting to make a little sense

################################################
## Bonus exercises #############################
################################################

# Paul is adding some uselss text now

bonus.text <- "It was the best of times, it was the worst of times, it was the age of
wisdom, it was the age of foolishness, it was the epoch of belief, it
was the epoch of incredulity, it it was the season of Light, it was the
season of Darkness, it was the spring of hope, it was the winter of
despair, we had everything before us, we had nothing before us, we
were all going direct to Heaven, we were all going direct the other
way- in short, the period was so far like the present period, that
some of its noiosiest authorities insisted on its being received, for
good or for evil, in the superlative degree of comparison only."
