#!/bin/sh

ip=$(ping -c1 -n web | head -n1 | sed "s/.*(\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\)).*/\1/g")

echo "${ip} test.loc" >> /etc/hosts
