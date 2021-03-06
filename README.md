# Needleman-Wunsch Alignment algorithm

This repo contains a rough version of this alignment algorithm written in Perl. Right now, all it provides is the grid, which can then be used for scoring the different sequences.

- The currrent version of this script can only align two DNA/protein sequences that are of equivalent length. 
- It assumes a linear gap penalty of -1 using the PAM250 scoring matrix. 
- Try it out!


# Shiny App

Under the ShinyApp directory are the current versions of the shiny app that has been published at [https://nmerwin.shinyapps.io/NW-Alignment](https://nmerwin.shinyapps.io/NW-Alignment).

- The currrent version of this script can only align two DNA/protein sequences.

- Only does the Needleman-Wunsch algorithm.

- Sequences are limited to the width of your screen.. it gets all wonky after that!
 
- Try it out, and give me feedback (post an issue on the repo)

Current plans for updates:

- Include drop down menu for Global / Local alignment

- Format printed aligned sequences (Kinda done.. could be much better)

- Work on JS processing for layout.

- Print out summary statistics for aligned sequences (ex. number of gaps, number of matches, total score??)

- Print out aligned sequences (remove matrices) -- DONE!!

- Drop down menu for scoring matrices (ex. Ts/Tv, PAM, BLOSUM, etc) --- DONE!!

- Allow for initation/extension gap penalties --- DONE!!