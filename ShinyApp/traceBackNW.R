

traceBackNW <- function(seqA,seqB,listMat){
    
    
    # Splits the sequences
    seqA <- strsplit(toupper(seqA),c())[[1]]
    seqB <- strsplit(toupper(seqB),c())[[1]]
    
    
    
    ## Pulls in the matrices
    matchMat <- listMat[[1]]
    gap1 <- listMat[[2]]
    gap2 <- listMat[[3]]
    
    
    ## Creates empty vectors for aligned sequences
    alignedA <- c()
    alignedB <- c()
    matchLine <- c()
    
    
    # figures out the dimensions of the matrix
    i <- dim(matchMat)[1]
    j <- dim(matchMat)[2]
    # Until it goes to the top.
    while(i != 1 & j != 1){
        # Figures out the which of the matrices produces the max (This alignment favours matches over gap)
        maxVal <- max(matchMat[i,][j],gap1[i,][j],gap2[i,][j])
        boolTrace <- maxVal == list(matchMat[i,][j],gap1[i,][j],gap2[i,][j])
        chooseTrace <- match(TRUE,boolTrace)
        
        
        # chooseTrace has 1=match, 2=gap in sequence 1, 3=gap in sequence 2
        if(chooseTrace == 1){
            alignedA = c(seqA[i-1],alignedA)
            alignedB = c(seqB[j-1],alignedB)
            
            # Handles the case of the line between the two sequences
            if(seqA[i-1]==seqB[j-1]){
                matchLine = c("|",matchLine)
            }
            else{
                matchLine = c(" ",matchLine)
            }
            i = i - 1
            j = j - 1
            
        }
        else if(chooseTrace == 2){   
            alignedA = c(seqA[i-1],alignedA)
            alignedB = c("-",alignedB)
            matchLine = c(" ",matchLine)
            i = i - 1
        }
        else if(chooseTrace == 3){
            alignedA = c("-",alignedA)
            alignedB = c(seqB[j-1],alignedB)
            matchLine = c(" ",matchLine)
            j = j - 1
        }   
    }
    
    
    ## Deals with the remaining gaps once it hits the end of a sequence.
    if(i==1){
        while(j != 1){
            alignedA = c("-",alignedA)
            alignedB = c(seqB[j-1],alignedB)
            matchLine = c(" ",matchLine)
            j = j - 1  
        }
    }
    if(j==1){
        while(i !=1){
            alignedA = c(seqA[i-1],alignedA)
            alignedB = c("-",alignedB)
            matchLine = c(" ",matchLine)
            i = i - 1
        }
    }
    return(list(alignedA,alignedB,matchLine))
    
}
