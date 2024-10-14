#!/bin/bash
#

echo "" > ./hashes.txt

echo "[+] initiating hash generation"
ctr=0
while [[ $ctr -lt 20 ]]; do
	cat /dev/random | head -1 | base64 | sha256sum | cut -d ' ' -f 1 >> ./hashes.txt
	((ctr++))
done
echo "[+] './hashes.txt' file populated with random hashes"

echo "[+] initiate heat generation activity"

hashcat -m 1400 -a 3 ./hashes.txt "?b?b?b?b?b?b?b"
