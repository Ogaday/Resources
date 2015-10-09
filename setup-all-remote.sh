#!bin/sh

for host in $(cat hosts.txt); do ssh "wow203@$host" "$(echo hello)" > "output.wow203@$host"; done
