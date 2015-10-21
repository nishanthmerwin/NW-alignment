# Needleman-Wunsch Alignment algorithm

This repo contains a rough version of this alignment algorithm written in Perl. Right now, all it provides is the grid, which can then be used for scoring the different sequences.

- The currrent version of this script can only align two proteins that are of equivalent length. 
- It assumes a linear gap penalty of -1 using the PAM250 scoring matrix. 
- Try it out!