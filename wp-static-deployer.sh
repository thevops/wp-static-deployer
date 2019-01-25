#!/bin/bash

if [ "$#" -ne 2 ]
then
	echo "use: $0 <destination directory> <website URL>"
	exit 1
fi

website_dir="$1"
website_url="$2"

# pobieranie od razu
wget -k -E -r -l 0 -p -N -F --restrict-file-names=unix --no-check-certificate -q -nH -P "$website_dir" "$website_url" --show-progress

exit 0

