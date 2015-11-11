# Alignment 

shinyServer(function(input, output) {
    
    source("tracebackNW.R",local=T)
    
    source("create.R",local=T)
    
    source("fillMat.R",local=T)
    
    ## Function to create empty trace and score matrices
    
    
    seqAOut <- eventReactive(input$button,{
        
        
        
        
        traceBackNW(input$seqA,input$seqB,
                                                       
        fillMat(input$seqA,input$seqB,input$slider1,input$slider2,read.table(input$scoring_matrix)))[[1]]})
    
    seqBOut <- eventReactive(input$button,{
        
        
            
        traceBackNW(input$seqA,input$seqB,
                        
        fillMat(input$seqA,input$seqB,input$slider1,input$slider2,read.table(input$scoring_matrix)))[[2]]})
    
    matchOut <- eventReactive(input$button,{
        
        
            
        traceBackNW(input$seqA,input$seqB,
                        
        fillMat(input$seqA,input$seqB,input$slider1,input$slider2,read.table(input$scoring_matrix)))[[3]]})
    
    
    output$seqAo <- renderPrint({ cat(seqAOut(),sep=" ")})
    
    output$matcho <- renderPrint({ cat(matchOut(),sep=" ") })
    
    
    
    
#     output$matcho <- renderPrint({ noquote(paste(matchOut(),sep=" "))})
    
    output$seqBo <- renderPrint({ cat(paste(seqBOut(),sep=" "))})
                        
                        
})



?renderPrint