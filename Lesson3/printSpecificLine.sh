echo -n "Enter line number:"
read i
head -$i file >| tmp
tail -1 tmp
