# !/bin/bask
tmpF="tmp.txt"
resultF="lan.txt"
echo -e ">>>>>>>>>>>>>>>>>> language extract <<<<<<<<<<<<<<<<"
echo ">"
read -p "> please input string name(end with enter): " input
rm -f ${resultF}
find . -type f -name "strings.xml" | xargs grep -ri "${input}" > ${tmpF}
sort -n ${tmpF} | uniq > ${resultF}
rm -f ${tmpF}
line=`sed -n '$=' ${resultF}`
echo "> match line count: ${line}"
echo ">"
echo ">>>>>>>>>>>>>>>>>>>> extract finished <<<<<<<<<<<<<<<<"
