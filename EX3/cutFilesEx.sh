read list
str=""
for pair in $list
do
echo $pair >| tmp
file=$(cut -d":" -f1 tmp)
i=$(cut -d":" -f2 tmp)
head -i$ $file >| tmp
z=$(tail -1 tmp)
str="$str $z"
done
echo "$str" >| tmp
cut -c2- tmp