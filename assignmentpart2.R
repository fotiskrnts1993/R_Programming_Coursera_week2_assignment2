completed<-function(directory, id=1:332){
        
        #Creating the directory path and formatting the data file
        directory<-setwd("C:/Users/Fotis K/Documents/R/r_coursera/week 2/specdata")
        fileNames<-paste0(directory,"/",formatC(id, width=3, flag=0),".csv")
        
        #reading in all files and making a large datalist
        lst<-lapply(fileNames, data.table::fread)
        dt <- rbindlist(lst)
        
        
        #return the list with the sum of complete cases for each id/file
        return(dt[complete.cases(dt), .(nobs = .N), by = ID])
}

