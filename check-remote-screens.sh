for host in $(cat protohosts01.txt); do ssh wow203@$host echo Hello $host; ssh wow203@$host screen -ls; done
