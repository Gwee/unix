#!/usr/bin/env awk -f

function calc_file(file,i,j,A,B)
{
  i=1
  split(””,A)
  while (getline<file ==1){
    for (j=1;j<=NF;J++){
      A[i,j]=$j
    }
    i++
    B[i]=NF
  }
  n=i-—
  s=0
  for (i=1;i<=n;i++){
    for (j=1;j<=B[i];j++){

    }
  }

  return sum
}
BEGIN {
  #this goes over each arg passed, meaning each file
for (i=1;i<ARGC;i++){
file=ARGV[i]
print file ” “calc_file(file) > “tmp”
}
#sort the summed values into a temp file
system(”sort tmp>|tmp1”)
#go over summed values and print
while(getline < ”tmp1” ==1){
  print $2”:”$$1
}
}
