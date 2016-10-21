#!/bin/bash

DATA=/home/ubuntu/Desktop/problema1/hojasDatos
mkdir $DATA/archivos_csv
mkdir $DATA/datos_graf
GRAF_DATA=$DATA/datos_graf
OUT_DATA=$DATA/archivos_csv

m=0
                      
for i in `find $DATA -name '*.xls' `
do
		echo "Procesando archivo $i"

		xls2csv $i > $OUT_DATA/data-$m.csv
		let m=m+1
done 2> error1.log

for e in `find $OUT_DATA -name "*.csv"`
do
	echo "Dando formato de datos para graficar el archivo $e"
	cat $e | awk -F "\",\"" '{print $1 " " $2 " " $3 " " $4 " " $5}' | sed '1,$ s/"//g' | sed '1 s/date/#date/g' > $GRAF_DATA/graf-$m.dat
		let m=m+1
done 2> error2.log
