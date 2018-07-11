#!/bin/awk -f

function sort(file){
    system("sort -n -k3 "file)
}

function calc_line_sum(file){
    sum=""
    while(getline<file){
        prevsum=sum
        sum=""
        #using j as index because did not pass i as param to the function and is being used in BEGIN
        for (j=1; j<=NF; j++){
            sum+=$j
        }
        
        if (prevsum == "" || sum =="") {
            continue
            } else {
            if (check_sum(prevsum,sum) == "false"){
                return "false"
            }
        }
    }
    close(file)
    #take care of 0 sum's
    if (sum==""){
        sum=0
    }
    if (sum>maxsum){
        maxsum = sum
    }
    return "true"
}

function check_sum(prevsum,sum){
    if (prevsum == sum){
        return "true"
    } else
    return "false"
}

BEGIN{
    for (i=1; i<ARGC; i++){
        file=ARGV[i]
        if (calc_line_sum(file) == "true") {
            print file " YES " sum > "yes_files"
        }
    else{
            print file " NO" > "no_files"
        }
    }
    #TODO: check if one of these files exist and then try to run sort
    sort("no_files")
    sort("yes_files")
    print maxsum
}