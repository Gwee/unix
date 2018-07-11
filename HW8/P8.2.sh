#!bin/awk -f
file=$1
awk '{for (i=1;i<=NF;i++)
        sum[i]+=$i
     }END {for (i=1;i<=length(sum);i++)
                printf "%s " ,sum[i]
           printf "\n"
     }' $file

