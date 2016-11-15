
# Set Workspace -----------------------------------------------------------
rm(list=ls());par(mfcol=c(1,1))

source("dataUtil.R")    # load the function definitions
data1 <- courseData()    # load the wrapper object for the data


makePlot1(data1)   # call function to build the plot using the data set.


