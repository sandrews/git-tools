#!/usr/bin/env python2
"""
Copyright 2018 Shantha Andrews ( shantha.andrews@gmail.com )

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
"""

import requests

page=1
notDone=True

user='user_name'
pwd='password'
teamname='teamname'

while notDone:
    url = 'https://api.bitbucket.org/2.0/repositories/{}?page={}'.format(teamname, page)
    response = requests.get(url, auth=(user, pwd))
    page += 1

    try:
        sid=response.json()['values'][0]['links']
    except IndexError:
        break

    valueArr=0
    while notDone:
        try:
            href=response.json()['values'][valueArr]['links']['clone'][1]['href']
            print('git clone ' + href)
            valueArr += 1
        except IndexError:
            break
