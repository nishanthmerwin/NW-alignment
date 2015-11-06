NW <- function(seqA,seqB,gapPen,gapStart,matrix){
    
    seqA <- strsplit(toupper(seqA),c())[[1]]
    
    seqB <- strsplit(toupper(seqB),c())[[1]]
    
    # Creates empty matrices
    start <- create(seqA,seqB,gapPen,gapStart)
    match <- start[[1]]
    gap1 <- start[[2]]
    gap2 <- start[[3]]
    
    
    # Creates reference sequence from scoring matrix
    ref <- names(matrix)
    
    
    
    for (i in seq(2,length(seqA)+1,by=1)){
        for (j in seq(2,length(seqB)+1,by=1)){
            # Finds the match score
            posA <- seqA[i-1]
            posB <- seqB[j-1]
            posA <- match(posA,ref)
            posB <- match(posB,ref)
            matchVal <- matrix[posA,][posB]
            
            
            # Assigns value to each one. 
            
            match[i,][j] <- matchVal + max(match[(i-1),][(j-1)],
                                           gap1[(i-1),][(j-1)],
                                           gap2[(i-1),][(j-1)])
            
            gap1[i,][j] <- max(match[i,][(j-1)] + gapStart + gapPen,
                               gap1[i,][(j-1)] + gapPen,
                               gap2[i,][(j-1)], + gapStart + gapPen)
            
            gap2[i,][j] <- max(match[(i-1),][j] + gapStart + gapPen,
                               gap1[(i-1),][j] + gapStart + gapPen,
                               gap2[(i-1),][j] + gapPen)
                
        }
    }
    return(list(match,gap1,gap2))
}


## These are for displaying fun stuff... otherwise not needed!
score <- data.frame(score)

trace <- data.frame(trace)

score <- rbind(c(0,seqB),score)
score <- cbind(c("Sequence",0,seqA),score)

trace <- rbind(c(0,seqB),trace)
trace <- cbind(c("Sequence",0,seqA),trace)

