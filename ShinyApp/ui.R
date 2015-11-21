shinyUI(fluidPage(
    
    # Copy the line below to make a text input box
    
    titlePanel("Needleman-Wunsch Scoring Algorithm"),
    
    
    sidebarLayout(
        
        
        sidebarPanel(
            
            textInput("seqA", label = ("Enter DNA/Protein sequence 1"), value = toupper("agt")),
            
            textInput("seqB", label = ("Enter DNA/Protein sequence 2"), value = toupper("tga")),
            
            selectInput("scoring_matrix", label = ("Choose scoring matrix"), 
                        choices = list("DNA: Identity" = "ID.txt", "DNA: Transition/Transversion" = "TSTV.txt", "Protein: BLOSUM62" = "BLOSUM.txt",
                                       "Protein: PAM40"= "PAM40.txt", "Protein: PAM250" = "PAM250.txt"), 
                        selected = 1),
            
            sliderInput("slider1", label = ("Gap Extend Penalty"), min = -10, max = 0, value = -1),

            sliderInput("slider2", label = ("Gap Start Penalty"), min = -10, max = 0, value = -5),
            
            
            actionButton("button", "Click to Align!")
            
        ),
        
        mainPanel(
            
            h3("Alignment"),
            tags$pre(
            textOutput("seqAo"),
            textOutput("matcho"),
            textOutput("seqBo")),
            
            tags$head(tags$style("#seqAo{color: black;
                                 font-size: 2em;
                                 font-style: courier;
                                 margin-bottom:-2em
                                 }
                                  #matcho{color: black;
                                 font-size: 2em;
                                 font-style: 'Lucida Console';
                                 }
                                  #seqBo{color: black;
                                 font-size: 2em;
                                 font-style: courier;
                                 margin-top: -2em;
                                 margin-bottom: 0em;
                                 }
                                 "
                                 
                                 
                                 ))
            
            
               
        )
        )
    
))
