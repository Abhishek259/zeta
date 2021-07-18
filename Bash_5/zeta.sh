#!/bin/bash

###3rd MOST CPU#####
Process=$(ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu|head -n 4|tail -n 1)
echo $Process>Process.txt
echo "$Process"
echo -ne "3rd highest cpu process name is "
echo $Process|awk '{print $3}'
echo -ne "whose Cpu % is "
echo $Process|awk '{print $5}'
echo -ne " and Memory taken by that process is "

echo $Process|awk '{print $4}'
echo -ne "id of process is "
echo $Process|awk '{print $1}'>test.txt
test=$(cat test.txt)
echo $test
echo -ne "port is "
Process_Port=$(sudo netstat netstat -tnulp|grep $test )
echo $Process_Port|awk   '{print $4}'|sed 's/.*://g'
#echo -ne "\nprocess name is\n $cpu_process"

##3rd Most Consuming Memory######
Process_Mem=$(ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem|head -n 4|tail -n 1)
echo $Process>Process.txt
echo "$Process"
echo -ne "3rd highest memory process name is "
echo $Process|awk '{print $3}'
echo -ne "i whose Cpu % is "
echo $Process|awk '{print $5}'
echo -ne "Memory taken by process is "

echo $Process|awk '{print $4}'
echo -ne "id of process is "
echo $Process|awk '{print $1}'>test.txt
test=$(cat test.txt)
echo $test
echo -ne "port is "
Process_Port=$(sudo netstat netstat -tnulp|grep $test )
echo $Process_Port|awk   '{print $4}'|sed 's/.*://g'

