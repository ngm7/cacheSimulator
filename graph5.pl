#!/usr/local/bin/perl
use strict;
my ($BLOCKSIZE,  $L1_SIZE,  $L1_ASSOC,  $L1_PREF_N,  $L1_PREF_M,  $L2_SIZE,  $L2_ASSOC,  $L2_PREF_N,  $L2_PREF_M);
my $temp = "";
my $filename = "graph44readings.txt";

for (my $i=15; $i<=20; $i++)
{
	for (my $j=10; $j<$i; $j++)
	{
	$L1_SIZE = 2 ** $j;
	$BLOCKSIZE =32;
	$L1_ASSOC  = 4;
	$L1_PREF_N = 0; 
	$L1_PREF_M  = 0;
	$L2_SIZE  = 2** $i;
	$L2_ASSOC  = 8;
	$L2_PREF_N = 0; 
	$L2_PREF_M = 0;
	my $cmd1 = "./sim_cache $BLOCKSIZE  $L1_SIZE  $L1_ASSOC  $L1_PREF_N  $L1_PREF_M  $L2_SIZE  $L2_ASSOC  $L2_PREF_N  $L2_PREF_M  gcc_trace.txt";
	print $cmd1;
	print "\n";
	my $output1 = `$cmd1`;
	$temp = $temp . $output1;
	}
	$temp =  $temp."\n";
}

open (OUTPUT, '>', $filename) || die "Can't open file [$!]\n";
print OUTPUT $temp;
close (OUTPUT);
