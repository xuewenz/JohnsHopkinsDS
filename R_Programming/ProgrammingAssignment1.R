## correlation Function
corr <- function(directory, threshold = 0) {

  LengthList <- complete(directory,ids = 1:332)
  CompleteNumbers <- LengthList[,2]
  ID_List <- LengthList[,1]
  SumOfComplete <- 0
  cutoff <- threshold
  index <- 0
  QualifiedMonitors <- ID_List[(CompleteNumbers > threshold)]

  Correlation <- vector()
  
  for (id in QualifiedMonitors) {
   Filename <- sprintf("%03d.csv",id)
   Path <- paste(directory,Filename,sep = "/")
   Data <- read.csv(Path)
   
   Bad1 <- is.na(Data[2])
   Bad2 <- is.na(Data[3])
   CombinedBad <- (Bad1 | Bad2)
   
   Data_Sulfate <- Data[2]
   Data_Sulfate <- Data_Sulfate[!CombinedBad]
   Data_Nitrate <- Data[3]
   Data_Nitrate <- Data_Nitrate[!CombinedBad]
   
   Correlation_sub  <- cor(Data_Sulfate,Data_Nitrate)
   Correlation <- c(Correlation, Correlation_sub)
  }
  
    return(Correlation) 
}

##complete tracking Function
complete <- function(directory, ids = 1:332) {
  
  id <- vector()
  nobs <- vector()
  
  for (i in ids) {
    
    filename <- sprintf("%03d.csv",i)
    filepath <- paste(directory, filename, sep = "/")
    Data <- read.csv(filepath)
    Bad1 <- is.na(Data[2])
    Bad2 <- is.na(Data[3])
    CombinedBad <- (Bad1 | Bad2)
    #print(CombinedBad)
    Data <- Data[2]
    Data <- Data[!CombinedBad]
    nob <- length(Data)
    id <- c(id, i)
    nobs <- c(nobs, nob)

  }
  df <- data.frame(id,nobs)
  return(df)
}

## Mean Function
pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  Total_Data <- vector()
  
  for (i in id) {
    filename <- sprintf("%03d.csv",i)
    filedirectory <- paste(directory, filename, sep = "/")
    Data <- read.csv(filedirectory)
    P_Data <- Data[,pollutant]
    P_Data <- P_Data[!is.na(P_Data)]
    Total_Data <- c(Total_Data, P_Data)
  }
    mean(Total_Data)
}
