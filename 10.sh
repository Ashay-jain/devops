#!/bin/bash

pid=$(sudo netstat -nltp | awk '/:80/  {print $7}' | cut -d '/' -f1)

if [[ -n "$pid" ]] 
then
      sudo kill "$pid"
echo " ${pid} is runing for port 80 it is deleted"

fi


