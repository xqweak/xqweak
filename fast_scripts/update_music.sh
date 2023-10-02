#!/bin/bash

# Function for creating a playlist
create_playlist() {
	name=$1 # Name of the playlist
	url=$2 # Url of the youtube playlist
	mkdir -p "$HOME/Music/$name" && echo "created $HOME/Music/$name"
	# Download the playlist
	yt-dlp $url -x --audio-format mp3 --download-archive $HOME/Music/$name/songs.txt -o "$HOME/Music/$name/%(title)s.%(ext)s" # Download the playlist in mp3 or update it
}


# Playlists ...

