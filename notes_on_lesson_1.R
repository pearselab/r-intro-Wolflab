empty.vector <- logical(0)
numbers <- c(1, 3, 5, 3)
vector.maths <- numbers * 4.5
letters
1:5
letters[1:5]
x <- 1:26
x<10
letters[x<10]
names(x) <- letters
x
x["a"]
my.mat <- matrix(1:25, nrow=5, ncol=5)
my.mat
my.mat[1:5,]
my.mat[,1:5]
my.mat[1,3]
my.mat[-1,]
my.mat[,-1:-2]
my.mat[1:2,1:2]
array(1:8, dim=c(2,2,2))
array(1:8, dim=c(2,2,2))[1,1,1]
characters <- c("a", "f", "3")
characters %in% letters
match(characters, letters)
letters
characters
letters[match(characters, letters)]
letters[characters %in% letters]
my.list <- list(n=c(1,3,5), c=c("hello","world"), 
                l=c(TRUE,FALSE,TRUE))

my.list[[1]][2]
my.list[[3]]
my.df <- data.frame(n=c(1,3,5), c=c("hello","world", "yuck")
                    , l=c(TRUE,FALSE,TRUE))
my.df
my.df[c('n', 'c')]
my.df[1,]
my.df[,2:3]