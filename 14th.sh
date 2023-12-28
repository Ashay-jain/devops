#!/bin/bash

workdir=$(pwd)

echo "${workdir}"

echo "ziping"

date1=$(date +"%y%m%d%h%m%s")

echo "${date1}"
zip -r shellscripting_${date1}.zip ${workdir}
