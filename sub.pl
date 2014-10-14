#/usr/bin/perl
use strict;
use diagnostics;
use warnings;
use 5.010;

# sub IDENTIFIER BLOCK
# IDENTIFER name of sub routine
# BLOCK code that is executed

my $result1 = random_roll_die1();
print "Six-sided die randomly rolled once: $result1\n";

sub random_roll_die1 {
	return 1 + int ( rand(6) );
}

#Arguement Handling
# can pass it in the print or when calling the subroutine

my $random_roll_die2 = random_roll_die2();
print "This takes the arguements 10, meaning a 10 sided die rolled once:$random_roll_die2\n";
sub random_roll_die2 {  # this is the number of sides on the dice, can vary in sub 
	my $num_dice_sides = @_;  #this is assigning to subroutines default array
	$num_dice_sides ||= 6;  # this is making six a default if no argument is passed

}


#Multiple Arguements $random_roll_die3
my $results3 = random_roll_die3(20,3); #seven-sided die, 3 rolls 
print "This is sum of 7-sided die rolled 3 times: $results3\n";


sub random_roll_die3  {
	my ($num_dice_sides, $num_of_rolls) = @_;  # both get passed on to same array
	$num_dice_sides ||= 6;
	$num_of_rolls ||= 1;
	my $total = 0;
	for (1..$num_of_rolls) {
		$total += 1 + int ( rand ($num_dice_sides));
	}
	return $total;
}
	
# print random_roll_die3(6,3); //print works well to call the sub with arguemtns, but may not work well for formatting issues with print.


#Named Arguements
#you can also name the arguements to make them more clean, like the previous example
#in Perl this is accomplished by passing through hash

# print random_roll_die4 ( 6,4 ); <- instead of  
my $results4 = random_roll_die4 (
	number_of_sides => 6,
	number_of_rolls => 4,
	);


print "This is using named arguements(sum of 6 sides/4rolls): $results4\n";

sub random_roll_die4 {
	my %argument_for_default = @_;

	my $number_of_sides = $argument_for_default{number_of_sides} || 6;  #no = because at begining
	my $number_of_rolls = $argument_for_default{number_of_rolls} || 1; 
	my $total = 0;

	for (1..$number_of_rolls) {
		$total += ( 1 + int (rand ($number_of_sides)));
	}
	return $total;  # take note must return the total  
}

#Aliasing
# the @_ aliases its arguemnts 
# best not to try to modify value of variable with aliasing 
# generally you should aassign @_ to new variable. 

#State Variables Perl 5.10 and better

sub how_many{
	state $count = 0; #this is to initalize
	$count++;
	print "I have been called $count time\n";
	}

how_many() for 1..5;




