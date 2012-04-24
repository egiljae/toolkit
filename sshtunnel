#! /bin/bash
echo -n "Username: "
read user
echo -n "Remote server: "
read host
echo -n "Port: "
read port
if [[ $port == "" ]]; then
    port="8080"
fi
echo "Tunneling to $user@$host at port $port.."
ssh -ND $port $user@$host
