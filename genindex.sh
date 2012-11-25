#
# Source : https://github.com/lofic/tips/blob/master/genindex.sh
#

cat > index.txt << EOF
Notes 
===== 

link:https://github.com/pryz[github.com/Pryz] 

List
---- 
EOF

for i in $(ls *.txt| grep -v index.txt);do
    title=$(head -1 $i)
    echo "* link:html/$i[$title]" >> index.txt
    echo >> index.txt
done

sed -i 's/\.txt/.html/g' index.txt

asciidoc --theme=pryz --backend=index_list index.txt

#rm index.txt
