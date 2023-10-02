#!/bin/bash

# Function for creating a playlist
update_playlist() {
	name=$1 # Name of the playlist
	url=$2 # Url of the youtube playlist
	mkdir -p "$HOME/Music/$name"  && echo ''
	# Download the playlist
	yt-dlp $url -x --audio-format mp3 --download-archive $HOME/Music/$name/songs.txt -o "$HOME/Music/$name/%(title)s.%(ext)s" # Download the playlist in mp3 or update it
	echo "done"
}


# Playlists ...
update_playlist "Hack" "https://www.youtube.com/playlist?list=PLd1oSjQxEWgW6qCUj9u5HL7491J8tlESC"
