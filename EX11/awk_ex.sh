#!/usr/bin/env awk -f
#function 
BEGIN {
    for (x=1; x<length(ARGV); x++) {
        print ARGV[x]
        
    }
}