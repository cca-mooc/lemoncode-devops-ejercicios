#!/bin/bash
mkdir -p foo/{empty,dummy}
echo 'Me encanta la bash!!' > foo/dummy/file1.txt
touch foo/dummy/file2.txt
cat ./foo/dummy/file1.txt > ./foo/dummy/file2.txt & mv ./foo/dummy/file2.txt ./foo/empty
