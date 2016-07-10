
max(1,3,5)


#read the documentation supplied with R
help.start()

############################################
# 1.7 Getting Help on a Function
############################################

#display the documentation for the function
help(functionname)

#a quick reminder of the function arguments
args(functionname)

#see examples of using the function
example(functionname)

#Suppose you want to know more about the mean function. 
help(mean)
#or
?mean

#Sometimes you just want a quick reminder of the arguments to a function:
args(mean)
args(sd)

# For sd, the synopsis shows the same vector, x, and an optional argument called na.rm. 
## args(sd)
## function (x, na.rm = FALSE) 
## NULL

example(mean)


############################################
# 1.8 Searching the Supplied Documentation
############################################

#Use help.search to search the R documentation on your computer
help.search("pattern")

??pattern

#Discussion
help(adf.test)
help.search("adf.test")
help(adf.test, package="tseries")

#Suppose you want to find all functions that mention the Augmented Dickey–Fuller (ADF) test
help.search("dickey-fuller")




############################################
# 1.9 Getting Help on a Package
############################################
help(package="packagename")
help(package="tseries")

#You can see a list of all vignettes（插图） on your computer
vignette()

vignette(package="packagename")
vignette("vignettename")

############################################
# 1.10 Searching the Web for Help
############################################

RSiteSearch("key phrase")































