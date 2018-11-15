#normalization function
normalize <- function(x) {
    return ((x - min(x)) / (max(x) - min(x)))
  }
# applied to df
 dfNorm <- as.data.frame(lapply(df, normalize))
# One could also use sequence such as df[1:2]
dfNorm <- as.data.frame(lapply(df[1:2], normalize))

normalize <- function(x) {(x - min(x, na.rm=TRUE))/(max(x,na.rm=TRUE) -
min(x, na.rm=TRUE))}

read.csv(file.path("f:", "elements.csv"), stringsAsFactors=FALSE)
> str(elements)