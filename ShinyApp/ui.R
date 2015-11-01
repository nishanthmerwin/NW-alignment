shinyUI(fluidPage(
    
    # Copy the line below to make a text input box
    
    titlePanel("Needleman-Wunsch Scoring Algorithm (Identity Matrix)"),
    
    
    sidebarLayout(
        
        
        sidebarPanel(
            
            textInput("seqA", label = ("Enter DNA sequence 1"), value = toupper("a")),
            
            textInput("seqB", label = ("Enter DNA sequence 2"), value = toupper("t")),
            
            sliderInput("slider1", label = ("Gap Penalty"), min = -10, max = 0, value = -1),
            
            actionButton("button", "Click to Generate the matrices!")
            
        ),
        
        mainPanel(
            
            h3("Score Matrix"),
            tableOutput("score"),
            h3("Trace Matrix"),
            ("In the trace matrix, a binary system is used to classify where each cell is calculated from while accounting for multiple tracebacks."),
            h1(" "),
            ("1=Left 2=Top 3=Top and Left 4=Topleft 5=Topleft and left 6=Topleft and top 7=Topleft, top and left"),
            tableOutput("trace")
            
            
        )
        
        
        )
    
    
    
    
    
    
    
    
    
    
    
))
