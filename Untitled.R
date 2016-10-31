input <- list(1:10, letters[1:6], c(TRUE,FALSE,TRUE))
#print(lapply (input, length))

print(mapply(paste, letters[1:3], letters[4:6], letters[7:9]))

#print(letters[1:3])