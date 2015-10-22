use strict;
use warnings;


my $strA="CAT";
my $strB="GTG";



# Gap Penalty
my $gapPen=-3;

my $ref = " ACGT";

# ID Scoring Matrix
my @PAM250 = (	[ " ","A","C","G","T"],
				["A" ,  1,  0,  0,  0],
				["C" ,  0,  1,  0,  0],
                ["G" ,  0,  0,  1,  0],
				["T" ,  0,  0,  0,  1]);
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

# Traceback matrix 1 represents left, 2 represents up, 4 represents topleft. The sum can be used to determine if multiple alignments are possible.
my @trace = ();


push(@{$score[0]},0);
push(@{$trace[0]},0);

for(my $j=1; $j <= length($strA); $j++){
	push(@{$score[0]},$j * $gapPen);
	push(@{$trace[0]},1);
}
for(my $i=1; $i <= length($strB); $i++){
	push(@{$score[$i]},$i * $gapPen);
	push(@{$trace[$i]},2);
}







## 2D Array Stuff

my ($i,$j,$posA,$posB,$matchscore,$top,$left,$topleft,@values,$nwscore);

for($i=1; $i <= length($strB); $i++){
	for($j=1; $j <= length($strA); $j++){
	
		# Finds the index in PAM250
		$posA = index($ref,substr($strA,$i-1,1));
		$posB = index($ref,substr($strB,$j-1,1));
		
		# Determines match score
		$matchscore = $PAM250[$posA][$posB];
		
		# Determines the top value
		$top = $score[$i-1][$j] + $gapPen;

		# Determines the left value
		$left = $score[$i][$j-1] + $gapPen;
		
		# Determines the top-left value
		$topleft = $score[$i-1][$j-1] + $matchscore;

		# Traceback matrix sums representing the traceback
		if($left > $top && $left > $topleft){
			push(@{$trace[$i]},1);
		}
		elsif($top > $left && $top > $topleft){
			push(@{$trace[$i]},2);
		}
		elsif($top == $left && $top > $topleft){
			push(@{$trace[$i]},3);
		}		
		elsif($topleft > $left && $topleft > $top){
			push(@{$trace[$i]},4);
		}
		elsif($topleft > $top && $topleft == $left){
			push(@{$trace[$i]},5);
		}
		elsif($topleft > $left && $topleft == $top){
			push(@{$trace[$i]},6);
		}
		elsif($topleft == $left && $left == $top){
			push(@{$trace[$i]},7);
		};
		
		# Sorts values and assigns highest value as score
		@values=($top,$left, $topleft);
		
		# if($left == -1){
			# print "@values\n";
			# print "Row is $i, Column is $j\n";
			# print "Cell to left is (i,j):($i,$j) and it's value is $score[$i][$j-1]\n";
			# <STDIN>;
		# }
		
		
		@values = sort { $b <=> $a } @values;
		$nwscore = $values[0];
		

		# Adds score to the right column
		push(@{$score[$i]},$nwscore);
	}
}

my (@aligned,$rows,$columns,$done,$matchA,$matchB);

$rows = length($strA);

$columns = length($strB);

foreach my $row(@score) {
    foreach my $element(@$row) {
		printf("%3d",$element);
    }
	print "\n";
}


foreach my $row2(@trace) {
    foreach my $element2(@$row2) {
		printf("%3d",$element2);
    }
	print "\n";
}

print "There are $rows rows and $columns columns\n";


$done = 0;

## aligned[0] is strA, aligned[1] is strB

## While loop goes through traceback loop. Creates a single alignment, although there could be many
## I don't think the alignment is right.. I'm just happy it gives me a result. For now.
while($done==0){
	if($trace[$rows][$columns]==1){
		$matchA = substr($strA,$rows-1,1);
		$matchB = substr($strB,$columns-1,1);
		unshift(@{$aligned[0]},"-");
		unshift(@{$aligned[1]},$matchB);
		$columns -= 1;
	}
	elsif($trace[$rows][$columns]==2){
		$matchA = substr($strA,$rows-1,1);
		$matchB = substr($strB,$columns-1,1);
		unshift(@{$aligned[0]},$matchA);
		unshift(@{$aligned[1]},"-");
		$rows -= 1;
	}
	elsif($trace[$rows][$columns]==3){
		$matchA = substr($strA,$rows-1,1);
		$matchB = substr($strB,$columns-1,1);
		unshift(@{$aligned[0]},"-");
		unshift(@{$aligned[1]},$matchB);
		$rows -= 1;
	}
	elsif($trace[$rows][$columns]==4){
		$matchA = substr($strA,$rows-1,1);
		$matchB = substr($strB,$columns-1,1);
		unshift(@{$aligned[0]},$matchA);
		unshift(@{$aligned[1]},$matchB);
		$rows -= 1;
		$columns -= 1;
	}
	elsif($trace[$rows][$columns]==5){
		$matchA = substr($strA,$rows-1,1);
		$matchB = substr($strB,$columns-1,1);
		unshift(@{$aligned[0]},$matchA);
		unshift(@{$aligned[1]},$matchB);
		$rows -= 1;
		$columns -= 1;
	}
	elsif($trace[$rows][$columns]==6){
		$matchA = substr($strA,$rows-1,1);
		$matchB = substr($strB,$columns-1,1);
		unshift(@{$aligned[0]},$matchA);
		unshift(@{$aligned[1]},$matchB);
		$rows -= 1;
		$columns -= 1;
	}
	elsif($trace[$rows][$columns]==7){
		$matchA = substr($strA,$rows-1,1);
		$matchB = substr($strB,$columns-1,1);
		unshift(@{$aligned[0]},"-");
		unshift(@{$aligned[1]},$matchB);
		$columns -= 1;
	}
	elsif($trace[$rows][$columns]==0 && $rows==0 && $columns==0){
		$done=1;
	}
}


foreach my $row(@aligned) {
    foreach my $element(@$row) {
		print $element;
    }
	print "\n";
}




# foreach my $row(@score) {
    # foreach my $element(@$row) {
		# printf("%3d",$element);
    # }
	# print "\n";
# }


# foreach my $row2(@trace) {
    # foreach my $element2(@$row2) {
		# printf("%3d",$element2);
    # }
	# print "\n";
# }




exit;






