#!/usr/bin/perl
# Nicholas Zaleski PID 720270935

use warnings;
use diagnostics;


$inputname = "Please enter a name:";
$inputarea = "What is this person's area code?:";
$inputphone = "What is person's phone number?:";
@name = ();
@area = ();
@phone = ();



print $inputname;
$name2 = <STDIN>;
chomp $name2;
push ( @name, $name2 );


while ( $name2 ne "--DONE--" )  #when STDID = --DONE-- then exits
{
	print $inputarea;
	$area2 = <STDIN>;
	chomp $area2;
	push ( @area, $area2 );

	print $inputphone;
	$phone2 = <STDIN>;
	chomp $phone2;
	push ( @phone, $phone2 );

	print "\n";

	print $inputname;
	$name2 = <STDIN>;
	chomp $name2;
	push ( @name, $name2 );

}

pop @name; # removes --DONE-- from array


if (@name) # if array has value then prints output
{
	print "\n";
	print "Name                     Phone Number\n";
	print "---------------          --------------\n";	
	for ($i=0; $i < scalar(@name); $i++)
	{
		$space= " " x (25-length($name[$i]));

		print "$name[$i]$space($area[$i])$phone[$i]\n";

	}
}

#comment
