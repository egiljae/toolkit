#! /bin/bash
echo "Current public IP is: `curl -s checkip.dyndns.com | grep -Eo "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+"`"
