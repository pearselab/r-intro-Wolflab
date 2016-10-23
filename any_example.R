#Check whether any or all of the elements of a vector are TRUE
for (i in 1:25){
  cat(i, any(i > 13), ", ")
}
