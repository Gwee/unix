# !bin/bash/awk -f
file=$1
lines=$(wc -l $file | cut -d" " -f1)
mainRC=$(cat $file | wc -l)
mainCC=$(head -n 1 $file | tr " " "\n" | wc -l)
successSum=0
for((c=1;c<=mainCC;c++));do
        for((r=1;r<=mainRC;r++));do
                countL=0
                >|tmp
                while read line; do
                        ((countL++))
                        if [ $countL -ne $r ];then
                                word=""
                                countC=0
                                echo $line | tr " " "\n" >| tmpLine
                                while read w;do
                                        ((countC++))
                                        if [ $countC -ne $c ]; then
                                                word="$word $w"
                                        fi
                                done < tmpLine
                                echo $word >> tmp
                        fi
                done < $file
                >|tmpsums
                rowCount=$(cat tmp | wc -l)
                columnCount=$(head -n 1 tmp | tr " " "\n" | wc -l)
                for((i=1;i<=columnCount;i++));do
                        sum=0
                        for((j=1;j<=rowCount;j++));do
                                ((sum=sum+$(head -n $j tmp | tail -n 1 | cut -d" " -f$i)))
                        done
                        echo $sum >> tmpsums
                done
                x=$(sort tmpsums | uniq -d | sort -r | wc -l)
                if [ $x -ne 0 ];then
                        ((successSum++))
                fi
        done
done

if [ $successSum -eq 0 ];then
        echo "NO"
else
        echo "YES"
fi

  

