#!/bin/bash

<<com
# Created by: Luis Contreras
# Email: luis.contreras.do@gmail.com
# Github: https://github.com/luiscontrerasdo
# Script in order to import hosts into Centreon

# IMPORTANT: This script should be in your Centreon Server


# Your CSV file should have the following fields in order, separated by comma

# -----------------------------------------------------------------------------
# Order         Description                                                   |
# -----------------------------------------------------------------------------
#   1           Host name                                                     |
#   2           Host alias                                                    |
#   3           Host IP address                                               |
#   4           Host templates; for multiple definitions, use delimiter |     |
#   5           Instance name (poller)                                        |
#   6           Hostgroup; for multiple definitions, use delimiter |          |
#-----------------------------------------------------------------------------|

Your csv file should look like this one:

test1;Test host;127.0.0.1;OS-Linux-SNMP-custom;Central;test
test2;Test host;127.0.0.2;OS-Linux-SNMP-custom;Central;test
test2;Test host;127.0.0.3;OS-Linux-SNMP-custom;Central;test

You can find more information here: https://docs.centreon.com/docs/centreon/en/19.04/api/clapi/objects/hosts.html

com
# Block ends here

# File with your hosts

file="test.csv"

# Credentials for Centreon

user="admin"
pass="admin"

# Let's do the magic here while reading the file

cat $file | while read LINE

do
   hosts=`echo $LINE`
   centreon -u $user -p $pass -o HOST -a ADD -v "$hosts"
   echo $hosts
done
