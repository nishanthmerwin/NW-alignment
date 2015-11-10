createMat <- function(seqA,seqB,gapPen,gapStart){
    
    # Match matrix, gap1 represents gap in seqA, gap2 represents gap in seqB
    matchMat <- matrix(data=NA,nrow=length(seqA)+1,ncol = length(seqB)+1)
    gap1 <- matrix(data=NA,nrow=length(seqA)+1,ncol = length(seqB)+1)
    gap2 <- matrix(data=NA,nrow=length(seqA)+1,ncol = length(seqB)+1)
    
    
    matchMat[,1][1] <- 0
    gap1[,1][1] <- 0 + gapStart
    gap2[,1][1] <- 0 + gapStart
    
    for(i in seq(2,length(seqA)+1,by=1)){
        matchMat[i,][1] <- matchMat[(i-1),][1] + gapPen
        gap1[i,][1] <- gap1[(i-1),][1] + gapPen
        gap2[i,][1] <- gap2[(i-1),][1] + gapPen
    }
    for (j in seq(2,length(seqB)+1,by=1)){
        matchMat[1,][j] <- matchMat[1,][j-1] +gapPen
        gap1[1,][j] <- gap1[1,][j-1] +gapPen
        gap2[1,][j] <- gap2[1,][j-1] +gapPen
    }
    return(list(matchMat,gap1,gap2))    
}