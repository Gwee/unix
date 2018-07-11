function HandleWords
{
	echo $1 | egrep "^((([0-9])\3([a-zA-Z])\4+)\1$"
}
for W in $* ; do
	HandleWords $W
done