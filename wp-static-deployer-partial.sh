#!/bin/bash

if [ "$#" -ne 4 ]
then
	echo "use: $0 <destination directory> <website URL> <max_num> <mode>"
	exit 1
fi

website_dir="$1"
website_url="$2"
max_num="$3"
mode="$4"
escaped_url="${website_url//\//\\/}"
url_file="urls.txt"
url_done="urls.done"


if [[ "$mode" == "urls" ]]
then
	# zapisywanie urli
	wget -k -E -r -l 0 -p -F --restrict-file-names=unix --no-check-certificate -nH "$website_url" --spider 2>&1 | grep '^--' | awk '{ print $3 }' | sort | uniq > "$url_file"
	
	# pobieranie urli z pliku od razu
	# wget --wait 2 --random-wait -k -E --no-check-certificate -x -nH -P "$website_dir" -i "$url_file"
	exit 0
elif [[ "$mode" == "download" ]]
	# pobieranie urli z pliku partiami
	i=0
	cat "$url_file" | while IFS= read line
	do
		wget --wait 2 --random-wait -k -E --no-check-certificate -x -nH -P "$website_dir" "$line"
		echo "$line" >> "$url_done"
		sed -i '1d' "$url_file"
		((i++))
		if [ "$i" -ge "$max_num" ]
		then
			exit 0
		fi
	done
else
	echo "use: $0 <destination directory> <website URL> <max_num> <mode>"
	exit 1
fi


