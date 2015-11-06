# Alignment 

shinyServer(function(input, output) {
    
    
    

    
    NW <- function(seqA,seqB,gapPen,gapStart,matrix){
        
        seqA <- strsplit(toupper(seqA),c())[[1]]
        
        seqB <- strsplit(toupper(seqB),c())[[1]]
        
        # Creates empty matrices
        start <- create(seqA,seqB,gapPen,gapStart)
        matchMat <- start[[1]]
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
                matchVal <- as.numeric(matrix[posA,][posB])
                
                
                # Assigns value to each one. 
                
                matchMat[i,][j] <- matchVal + max(matchMat[(i-1),][(j-1)],
                                               gap1[(i-1),][(j-1)],
                                               gap2[(i-1),][(j-1)])
                
                gap1[i,][j] <- max(matchMat[i,][(j-1)] + gapStart + gapPen,
                                   gap1[i,][(j-1)] + gapPen,
                                   gap2[i,][(j-1)], + gapStart + gapPen)
                
                gap2[i,][j] <- max(matchMat[(i-1),][j] + gapStart + gapPen,
                                   gap1[(i-1),][j] + gapStart + gapPen,
                                   gap2[(i-1),][j] + gapPen)
                
            }
        }
        return(list(matchMat,gap1,gap2))
    }
    
    ## Function to create empty trace and score matrices
    create <- function(seqA,seqB,gapPen,gapStart){
        
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
   
    matchFun <- eventReactive(input$button,{
       
       NW(input$seqA,input$seqB, input$slider1,input$slider2 ,read.table(input$scoring_matrix))[[1]]
       
   })
   
    gap1<- eventReactive(input$button,{
       
       NW(input$seqA,input$seqB, input$slider1,input$slider2 ,read.table(input$scoring_matrix))[[2]]
       
   })

    gap2 <- eventReactive(input$button,{
    
    NW(input$seqA,input$seqB, input$slider1,input$slider2 ,read.table(input$scoring_matrix))[[3]]
    
    })     


    output$match <- renderTable({ matchFun() },include.rownames=F,include.colnames=F) 
  
    output$gap1 <- renderTable({ gap1() },include.rownames=F,include.colnames=F)

    output$gap2 <- renderTable({ gap2() },include.rownames=F,include.colnames=F)


})

