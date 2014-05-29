#!/bin/bash

avconv -f image2 -framerate 24 -i "valentine%04d.png" -b 1500k -s 1200x900 video.avi

avconv -i video.avi -i audio.wav -vcodec copy -acodec copy -strict experimental valentine.avi

mv video.avi ~/Documents

mv valentine.avi ~/Documents