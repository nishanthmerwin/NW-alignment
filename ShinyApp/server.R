# Alignment 

shinyServer(function(input, output) {
    
    ## Setting up the id matrix
    Abp <- c(1,0,0,0)
    Cbp <- c(0,1,0,0)
    Tbp <- c(0,0,1,0)
    Gbp <- c(0,0,0,1)
    dna <- c("A","C","T","G")
    dim <- list(x=dna,y=dna)
    id_matrix <- matrix(data=c(Abp,Cbp,Tbp,Gbp),nrow=4,ncol=4,dimnames=dim)
    
    
    traceFun <- function(top, left, topleft){
        ## Function that returns the traceback direction in the trace matrix
        ## Inputs are vectors of 3 (NW) or 4 (SW)   
        
        # 1=left
        if(left > top & left > topleft){
            return(1)
        }
        # 2=top
        else if(top > left & top > topleft){
            return(2)
        }
        # 3=top and left
        else if(top == left & top > topleft){
            return(3)
        }
        # 4=topleft
        else if(topleft > left & topleft > top){
            return(4)
        }
        # 5=topleft and left
        else if(topleft == left & topleft > top){
            return(5)
        }
        # 6=topleft and top
        else if(topleft > left & topleft == top){
            return(6)
        }
        # 7=topleft, left and top
        else if(topleft == left & topleft == top){
            return(7)
        }  
        
    }
    
    NW <- function(seqA,seqB,gapPen,id_matrix){
        
        seqA <- strsplit(seqA,c())[[1]]
        
        seqB <- strsplit(seqB,c())[[1]]
        
        # Creates empty matrices
        start <- create(seqA,seqB,gapPen)
        score <- start[[1]]
        trace <- start[[2]]
        
        for (i in seq(2,length(seqA)+1,by=1)){
            for (j in seq(2,length(seqB)+1,by=1)){
                # Finds the match score
                posA <- seqA[i-1]
                posB <- seqB[j-1]
                posA <- match(posA,dna)
                posB <- match(posB,dna)
                matchVal <- id_matrix[posA,][posB]
                
                # Determines the top score
                topleft <- score[(i-1),][j-1] + matchVal
                top <- score[(i-1),][j] + gapPen
                left <- score[i,][j-1] + gapPen
                
                # insert values into matrices
                score[i,][j] <- max(top,left,topleft)
                trace[i,][j] <- traceFun(top,left,topleft)       
            }
        }
        
        score <- data.frame(score)
        
        trace <- data.frame(trace)
        
        score <- rbind(c(0,seqB),score)
        score <- cbind(c("Sequence",0,seqA),score)
        
        trace <- rbind(c(0,seqB),trace)
        trace <- cbind(c("Sequence",0,seqA),trace)
        
        
        return(list(score,trace))
    }
    
    ## Function to create empty trace and score matrices
   create <- function(seqA,seqB,gapPen){
       
       
       
        score <- matrix(data=NA,nrow=length(seqA)+1,ncol = length(seqB)+1)
        trace <- matrix(data=NA,nrow=length(seqA)+1,ncol = length(seqB)+1)
        score[,1][1] <- 0
        trace[,1][1] <- 0
        
        for(i in seq(2,length(seqA)+1,by=1)){
            score[i,][1] <- score[(i-1),][1] + gapPen
            trace[i,][1] <- 2
        }
        for (j in seq(2,length(seqB)+1,by=1)){
            score[1,][j] <- score[1,][j-1] +gapPen
            trace[1,][j] <- 1
        }
        return(list(score,trace))
    }
   
   
   
   
   output$score <- renderTable({ NW(input$seqA,input$seqB, input$slider1 ,id_matrix)[[1]] },include.rownames=F,include.colnames=F)
   
   
   output$trace <- renderTable({ NW(input$seqA,input$seqB, input$slider1 ,id_matrix)[[2]] },include.rownames=F,include.colnames=F)
#    
#    output$trace <- eventReactive(input$button,{ 
#        renderDataTable({
#            
#            
#             
#            
#        })
#        
#        
#        
   
   
#     output$score <- renderText({ 
#         
#         eventReactive(input$button,{
#             NW(input$seqA,input$seqB, input$gapPen ,id_matrix)[[1]] 
#         
#         })
#         
#     })
#     output$trace <- renderText({ 
#         
#         eventReactive(input$button,{
#         NW(input$seqA,input$seqB, input$gapPen ,id_matrix)[[2]] 
#         })
#         
#     })
#     

    

    
})

# 
# eventReactive(input$button,{
#     
#     
#     # Selecting gap penalty
#     v1[["gapPen"]] <- input$slider1
#     
#     # Inputting sequences
#     v1[["seqA"]] = strsplit(input$seqA,c())[[1]]
#     v1[["seqB"]] = strsplit(input$seqB,c())[[1]]
#     
#     
#     v1[["listMat"]] <- create(v1[["seqA"]],v1[["seqB"]])
#     v1[["score"]] <- v1[["listMat"]][[1]]
#     v1[["trace"]] <- v1[["listMat"]][[2]]
#     
#     
#     
