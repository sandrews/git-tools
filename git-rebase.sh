#!/usr/bin/env bash

#Copyright 2018 Shantha Andrews ( shantha.andrews@gmail.com )

#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# git pull --rebase applies the remote changes on top of the local changes. rebasing re-writes the project history by creating brand new commits for each commit in the original branch. 

# Ive included a stash before the rebase so that any local work will not be lost. 

gitRoot='/git/root/folder'

for d in `ls -d -- ${gitRoot}/*/ 2> /dev/null`; 
do
	(NL=$'\n'
	GITOUT="Trying to Rebase :  ${d}"
	GITOUT=${GITOUT}${NL}"$(git -C ${d} stash --quiet 2>&1)"   
	GITOUT=${GITOUT}${NL}"$(git -C ${d} pull --rebase --quiet 2>&1)"
        GITOUT=${GITOUT}${NL}"-----> Completed"${NL}
	echo "${GITOUT}") & 
done
wait
