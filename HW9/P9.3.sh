#!/usr/bin/awk -f

function calc_matrix_new(array,file){
  sumfirstrow=0
  sumlastrow=0
  sumfirstcolumn=0
  sumlastcolumn=0
  totalsum=0
  for (j=1;j<=FileRowArray[file];j++){
      sumfirstrow+=ElementsArray[file,1,j]
      sumlastrow+=ElementsArray[file,FileRowArray[file],j]
      sumfirstcolumn+=ElementsArray[file,j,1]
      sumlastcolumn+=ElementsArray[file,j,FileRowArray[file]]
      totalsum+=LineSum[file,j]
    }
    if (sumfirstrow == sumlastrow && sumlastrow == sumfirstcolumn && sumfirstcolumn == sumlastcolumn) {
      return "true"
    } else{
      return "false"
    }

  }
  
BEGIN{
    for(i=1; i<ARGC; i++){
      files[i]=ARGV[i]
    }
}

{
  for(i=1;i<=NF;i++){
    ElementsArray[FILENAME,FNR,i]=$i
    LineSum[FILENAME,FNR]+=$i
  }
  FileRowArray[FILENAME]=FNR
}

END{
  for(i=1;i<=length(files);i++){
    file=files[i]
    if (calc_matrix_new(ElementsArray,file) == "true"){
      print file " YES"
    }else{
      print file " NO"
    }
  if (totalsum>maxsum){
    maxsum=totalsum
  }
  }
      print maxsum

}
