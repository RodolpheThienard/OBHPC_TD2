if [ $# -eq 0 ]
then 
    echo "missing CPU name"
else

name=$1
echo "nom du CPU : $name"

lscpu > $name.txt


echo "__________ Cache L1 __________ " >> $name.txt
more /sys/devices/system/cpu/cpu0/cache/index0/* | cat >> $name.txt

echo "__________ Cache L2 __________" >> $name.txt
more /sys/devices/system/cpu/cpu0/cache/index2/* | cat >> $name.txt

echo "__________ Cache L3 __________  " >> $name.txt
more /sys/devices/system/cpu/cpu0/cache/index3/* | cat >> $name.txt

echo $name
fi