#!/usr/bin/perl
# $Id: bittivahti.pl 1166 2008-11-16 20:13:58Z joneskoo $

# Created by Joonas Kortesalmi on 2006-06-16.

# The script reads Linux /proc/net/dev every 1 second and prints the
# throughput in KiB/s for each interface.

my $PROGRAM = "bittivahti.pl";
my $VERSION = '1.01 ($Rev: 1166 $)';
my $show_packets = 0; # Change to 1 to enable packet counters

use strict;
use warnings;
use Time::HiRes qw(time sleep);

my $devfile = '/proc/net/dev';
my $sleep_seconds = 3;
my $dev_regexp = qr/^\s*([a-z0-9]+):\s*(\d+)\s*(\d+)(\s+\d+){6}\s+(\d+)\s*(\d+)/;

my $interfaces = {};
my $interfaces_sum = {};
my $time = time();

sub updatevalues {
    open (my $FD, "<$devfile");
    while (<$FD>) {
        if (my ($interf, $rxbytes, $rxpackets, undef, $txbytes, $txpackets) = /$dev_regexp/) {
            $interfaces->{$interf} = [$rxbytes, $rxpackets, $txbytes, $txpackets];
        }
    }
}

sub printdiffs {
    print("$PROGRAM $VERSION\n");
    printf("%12s |  %s  |  %s  |    %s  |   %s\n",
        "interface", "RX bandwidth", "TX bandwidth",
        "RX traffic", "TX traffic");
    
    my $interfaces_new = {};
    open (my $FD, "<$devfile");
    
    # Keep track of time in case something weird happens
    my $time_delta = time() - $time;
    $time = time();
    
    while (<$FD>) {
        if (my ($interf, $rxbytes, $rxpackets, undef, $txbytes, $txpackets) = /$dev_regexp/) {
            # We don't need to list dead interfaces
            next if ($rxbytes == 0 && $txbytes == 0);
            
            $interfaces_new->{$interf} = [$rxbytes, $txbytes, $rxpackets, $txpackets];

            my $rx_delta = $interfaces_new->{$interf}->[0] - $interfaces->{$interf}->[0];
            my $tx_delta = $interfaces_new->{$interf}->[1] - $interfaces->{$interf}->[2];
	    my $rxp_delta = $interfaces_new->{$interf}->[2] - $interfaces->{$interf}->[1];
	    my $txp_delta = $interfaces_new->{$interf}->[3] - $interfaces->{$interf}->[3];


            # 32 bit overflow check
            $tx_delta += 2**32 if ($tx_delta < 0 && $tx_delta >= -2**32);
            $rx_delta += 2**32 if ($rx_delta < 0 && $rx_delta >= -2**32);
	    $txp_delta += 2**32 if ($txp_delta < 0 && $txp_delta >= -2**32);
	    $rxp_delta += 2**32 if ($rxp_delta < 0 && $rxp_delta >= -2**32);

            
            if ($tx_delta >= 0 && $rx_delta >= 0 && $txp_delta >= 0 && $rxp_delta >= 0) {
                $interfaces_sum->{$interf}->[0] += $rx_delta;
                $interfaces_sum->{$interf}->[1] += $tx_delta;
		$interfaces_sum->{$interf}->[2] += $rxp_delta;
		$interfaces_sum->{$interf}->[3] += $txp_delta;

                
                printf("%12s |%9.1f KiB/s |%9.1f KiB/s | %10.1f MiB |%10.1f MiB\n",
                    $interf,
                    $rx_delta / 1024 / $time_delta,
                    $tx_delta / 1024 / $time_delta,
                    $interfaces_sum->{$interf}->[0] / 1024 / 1024,
                    $interfaces_sum->{$interf}->[1] / 1024 / 1024,
                );                
		printf("             |%11.0f p/s |%11.0f p/s | %12.0f p |%12.0f p\n",
		    $rxp_delta / $time_delta,
		    $txp_delta / $time_delta,
		    $interfaces_sum->{$interf}->[2],
		    $interfaces_sum->{$interf}->[3]
		) if $show_packets;
            }
            else {
                print "$interf: COUNTER RESET!\n"
            }
        }
    }
}

sub clear {
    print "\e[H\e[J";
}

print "Please wait. The display is updated every $sleep_seconds seconds.\n";
print "Starting up...\n";

# Main loop
while (1) {
    die unless (-f $devfile && -r _ ); # Die if can't read input file
    clear();
    updatevalues();
    sleep($sleep_seconds);
    printdiffs();
}
