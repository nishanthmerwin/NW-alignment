use strict;
use warnings;

my $strB="MDLWVSTCYNMM";

my $strA="MFCWWYFWPCMF";

# Gap Penalty
my $gapPen=-1;

my $ref = " ARNDCQEGHILKMFPSTWYV";

# PAM250 Scoring Matrix
my @PAM250 = (	[ " ","A","R","N","D","C","Q","E","G","H","I","L","K","M","F","P","S","T","W","Y","V"],
				["A" , 2 , -2,  0,  0, -2,  0,  0,  1, -1, -1, -2, -1, -1, -3,  1,  1,  1, -6, -3,  0],
				["R" ,-2 ,  6,  0, -1, -4,  1, -1, -3,  2, -2, -3,  3,  0, -4,  0,  0, -1,  2, -4, -2],
				["N" , 0 ,  0,  2,  2, -4,  1,  1,  0,  2, -2, -3,  1, -2, -3,  0,  1,  0, -4, -2, -2],
				["D" , 0 , -1,  2,  4, -5,  2,  3,  1,  1, -2, -4,  0, -3, -6, -1,  0,  0, -7, -4, -2],
				["C" ,-2 , -4, -4, -5, 12, -5, -5, -3, -3, -2, -6, -5, -5, -4, -3,  0, -2, -8,  0, -2],
				["Q" , 0 ,  1,  1,  2, -5,  4,  2, -1,  3, -2, -2,  1, -1, -5,  0, -1, -1, -5, -4, -2],
				["E" , 0 , -1,  1,  3, -5,  2,  4,  0,  1, -2, -3,  0, -2, -5, -1,  0,  0, -7, -4, -2],
				["G" , 1 , -3,  0,  1, -3, -1,  0,  5, -2, -3, -4, -2, -3, -5,  0,  1,  0, -7, -5, -1],
				["H" ,-1 ,  2,  2,  1, -3,  3,  1, -2,  6, -2, -2,  0, -2, -2,  0, -1, -1, -3,  0, -2],
				["I" ,-1 , -2, -2, -2, -2, -2, -2, -3, -2,  5,  2, -2,  2,  1, -2, -1,  0, -5, -1,  4],
				["L" ,-2 , -3, -3, -4, -6, -2, -3, -4, -2,  2,  6, -3,  4,  2, -3, -3, -2, -2, -1,  2],
				["K" ,-1 ,  3,  1,  0, -5,  1,  0, -2,  0, -2, -3,  5,  0, -5, -1,  0,  0, -3, -4, -2],
				["M" ,-1 ,  0, -2, -2, -5, -1, -2, -3, -2,  2,  4,  0,  6,  0, -2, -2, -1, -4, -2,  2],
				["F" ,-3 , -4, -3, -6, -4, -5, -5, -5, -2, -1,  2, -5,  0,  9, -5, -3, -3,  0,  7, -1],
				["P" , 1 ,  0,  0, -1, -3,  0, -1,  0,  0, -2, -3, -1, -2, -5,  6,  1,  0, -6, -5, -1],
				["S" , 1 ,  0,  1,  0,  0, -1,  0,  1, -1, -1, -3,  0, -2, -3,  1,  2,  1, -2, -3, -1],
				["T" , 1 , -1,  0,  0, -2, -1,  0,  0, -1,  0, -2,  0, -1, -3,  0,  1,  3, -5, -3,  0],
				["W" ,-6 , -2, -4, -7, -8, -5, -7, -7, -3, -5, -2, -3, -4,  0, -6, -2, -5, 17,  0, -6],
				["Y" ,-3 , -4, -2, -4,  0, -4, -4, -5,  0, -1, -1, -4, -2,  7, -5, -3, -3,  0, 10, -2],
				["V" , 0 , -2, -2, -2, -2, -2, -2, -1, -2,  4,  2, -2,  2, -1, -1, -1,  0, -6, -2,  4]
			);
# Prints the PAM250 Scoring Matrix
# foreach my $row(@PAM250) {
    # foreach my $element(@$row) {
		
        # my $len = length($element);
		
		# if($len==1){
			# print "  ",$element;
		# }
		# elsif($len==2){
			# print " ",$element;
		# }
    # }
	# print "\n";
# }

#############################################

# Prints the matches
# my @score = ();
# for(my $i=0; $i < length($strA); $i++){
	# for(my $j=0; $j < length($strB); $j++){
		# my $match = substr($strA,$i,1).":".substr($strB,$j,1);
		# push(@{$score[1]},$match);
	# }
# }

# foreach my $row(@score) {
    # foreach my $element(@$row) {	
		# print " $element ";
    # }
	# print "\n";
# }

#################################################

# Prints the match score of the array using the PAM250 matrix (With a bunch of comments)
# my @score = ();
# for(my $i=0; $i < length($strA); $i++){
	# for(my $j=0; $j < length($strB); $j++){
	
		
		# my $ref = join("",@{$PAM250[$0]});
		
		# my $posA = index($ref,substr($strA,$i,1));
		# my $posB = index($ref,substr($strB,$j,1));

		# print "The ref is: ", @{$PAM250[$0]},"\n";
		# print "Letter ",substr($strA,$i,1), "found at pos #",$posA,"\n";
		# print "Letter ",substr($strB,$j,1), "found at pos #",$posB,"\n";
		
		
		# my $matchscore = $PAM250[$posA][$posB];
		# print "The score for this match is $matchscore\n\n";

		# push(@{$score[$i]},$matchscore);
	# }
# }

# foreach my $row(@score) {
    # foreach my $element(@$row) {
	
		# printf("%3d",$element);
    # }
	# print "\n";
# }

#################################################

# Prints the results of the NW score in a table

my @score = ();


for(my $j=0; $j<= length($strA); $j++){
	push(@{$score[0]},$j * $gapPen);
}
for(my $i=1; $i<= length($strB); $i++){
	push(@{$score[$i]},$i * $gapPen);
}


for(my $i=1; $i <= length($strA); $i++){
	for(my $j=1; $j <= length($strB); $j++){
	
		# Finds the index in PAM250
		my $posA = index($ref,substr($strA,$i-1,1));
		my $posB = index($ref,substr($strB,$j-1,1));
		
		# Determines match score
		my $matchscore = $PAM250[$posA][$posB];
		
		# Determines the top value
		my $top = $score[$i-1][$j] + $gapPen;
		
		# Determines the left value
		my $left = $score[$i][$j-1] + $gapPen;
		
		# Determines the top-left value
		my $topleft = $score[$i-1][$j-1] + $matchscore;
		
		
		# Sorts values and assigns highest value as score
		my @values=($top,$left, $topleft);
		@values = sort { $b <=> $a } @values;
		my $nwscore = $values[0];
		
		# Adds score to the right column
		push(@{$score[$i]},$nwscore);
	}
}


foreach my $row(@score) {
    foreach my $element(@$row) {
	
		printf("%3d",$element);
    }
	print "\n";
}




exit;





