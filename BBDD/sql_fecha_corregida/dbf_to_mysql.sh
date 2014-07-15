#!/bin/sh

#Cuales son las tablas que tienen la fecha mal ?
tablas_fecha_mal=$(grep DATETIME ../*.sql|cut -d':' -f1|uniq)
#tablas_fecha_mal=$(ls)
#for i in "${tablas_fecha_mal[@]}" ; do echo "$i" ; done
#En DBF el formato de fecha es 'DD-M-AA' pero MySQL usa 'AA-MM-DD'
for i in $tablas_fecha_mal
#do echo "$i" 
  do sed 's/DATETIME/DATE/g' $i > ${i}.tmp
  sed 's/\([0-9]\+\)-\([0-9]\+\)-\([0-9]\+\)/\3-\2-\1/g' $i.tmp > ${i}.fd
done
