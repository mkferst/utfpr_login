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

# ether-login v0.1: login script for UTFPR wired network.

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

curl --silent --insecure --data "POSTDATA=dst=&popup=true&username=${user}&password=${pass}" https://intranet.pb.utfpr.edu.br/login | grep -q 'Você está logado.' && echo "Login OK" || echo "Falha ao efetuar login"
