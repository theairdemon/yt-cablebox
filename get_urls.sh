#!/bin/bash
yt-dlp --flat-playlist --print "{https://youtu.be/%(id)s},{%(title)s},{%(duration)s}" $1 > VideoCSVs/videos.csv
