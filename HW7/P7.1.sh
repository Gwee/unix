#!/usr/bin/env bash
function count_word_in_dir {
    word=$1
    dir=$2
    counter=0
    for file in $(find $dir -type f);
    do
      x=$(echo $(cat $file) | tr ' ' '\n')
      flag='false'
      for entry in $x
      do
        if [[ "$word" == "$entry" ]]; then
          flag='true'
        fi
      done
      if [[ "$flag" == "true" ]]; then
        ((counter++))
      fi
    done
    echo -n "$counter "
    if [[ $counter = 0 ]]; then
      notall='true'
    fi
}

word_array=[]
i=0

while [ ! $# -eq 0 ]
do
  #word
  if [[ $1 != '-dirs' ]]; then
    word_array[$i]=$1
    ((i++))
  fi
  
	case "$1" in
		-dirs)

      dir_array=("$@")

			break
			;;
	esac
	shift
done

unset dir_array[0]

for w in "${word_array[@]}"
do
result=0
  echo -n "$w "
  notall='false'
  for d in "${dir_array[@]}"
  do
    count_word_in_dir $w $d
    #TODO: Fix the print to print word counter counter...counter and calc ALL/NOTALL
    #result="$counter $result"

  done
  if [[ "$notall" == "true" ]]; then
  echo -n "NOTALL"
  else
  echo -n "ALL"
  #echo -n "$w $result"
  fi
  echo ""
done