# !bin/bash/awk -f
file=$1
awk 'BEGIN{maxLen=0}{
        for(i=1;i<=NF;i++){
                if(match($i,/^[^a-zA-Z]+$/)){
                        if(maxLen<length($i)){
                                maxLen=length($i)
                        }
                }
        }
}END{print maxLen}' $file
