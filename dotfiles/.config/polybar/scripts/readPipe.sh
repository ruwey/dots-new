#!/bin/sh

while true; do
	if read bla <$1; then
		if [[ $bla = "BREAK" ]]; then
			break
		fi
		echo $bla
	fi
done

