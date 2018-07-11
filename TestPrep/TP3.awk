#!/usr/bin/awk -f
function max_sum(file){
    line_sum=0
    ms=0
    for (j=1; j<=FileRowArray[file];j++ ) {
        for (l=1; l<=LineRowArray[file,j]; l++) {
            word=ElementsArray[file,j,l]
            #This is not part of the exercise - just to show you how to use sub
            if (sub("[^0-9]","s",word)==1){
                print "there are chars that are not numeric which is "word
            }
            #End
            res=sum_word(word)
            if (ms<res){
                ms=res
            }
        }
    }
    return ms
}
function sum_word(word,arr){
    sd=0
    split(word,arr,"")
    for (k=1; k<=length(arr); k++) {
        if (arr[k]>=1 && arr[k] <= 9) {
            sd+=arr[k]
        } else {
            return 0
        }
    }
    return sd
}
BEGIN{
    for (i=1; i<ARGC; i++) {
        files[i]=ARGV[i]
    }
}
{
    for (i=1; i<=NF; i++) {
        ElementsArray[FILENAME,FNR,i]=$i
    }
    LineRowArray[FILENAME,FNR]=NF
    FileRowArray[FILENAME]=FNR
}
END{
    for (i=1; i<=length(files); i++) {
        file=files[i]
        max_sum(file)
        print file" " max_sum(file)
    }
}