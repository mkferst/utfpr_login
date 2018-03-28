#!/bin/bash

#Copyright (c) 2017-2018 Matheus K. Ferst <matheusferst[at]alunos.utfpr.edu.br>.
#
#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE

# wifi-login v0.1: login script for UTFPR wireless network.

if [ $# -ge 2 ]; then
	user="$1"
	pass="$2"
else
	echo -n "User: "
	read user
	echo -n "Password: "
	read -s pass
	echo
fi

curl --silent --insecure --data "buttonClicked=4&err_flag=0&err_msg=&info_flag=0&info_msg=&redirect_url=&network_name=Guest+Network&username=${user}&password=${pass}" "https://1.1.1.1/login.html?wlan=UTFPR-WEB&statusCode=1&ap_mac=00:00:00:00:00" --referer https://1.1.1.1/login.html | grep -q 'Login Successful' && echo "Login OK" || echo "Falha ao efetuar login"
