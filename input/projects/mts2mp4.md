title: mts2mp4
submenu-position: 3
description: converting sony mts format to standard mp4
author: Josh Drizin
date: 2013/08/22
---

# Converting Sony Handycam MTS videos to mp4

This is a mostly stream-of-conciousness account of converting a couple MTS 
files to a much more useful format and container. I did this on Arch Linux, but 
it would be nice to have something for Windows users too.

## Camera stuff
* Apparently the SD card is formatted as Microsoft's exFAT filesystem.
* Windows 7 doesn't seem to support it out of the box, somehow. What?
* Linux will happily read it once you install the exfat packages. I couldn't get udev to pick up the device until I rebooted.
* I only noticed the usb cable on the handstrap after swearing at Sony for using a nonstandard usb port.

## File conversion
* Sony's MTS files hold standard h264 video and have obnoxious ac3 audio.
* ffmpeg will happily convert the files without re-encoding the video and converting audio to aac!

<pre><code>for i in *.MTS; do ffmpeg -i "$i" -c:v copy -c:a aac -aq 0 "$i.mp4"; done</code></pre><br />
But, as it turns out, Sony splits the files at 2GB, defeating the entire purpose of using exFAT in the first place (overcoming the 2GB filesize limit of FAT). Come on, Sony. Apparently it's possible to concatenate the files losslessly, though it's a small hassle. I would rewrite this as a script with temporary files (or fifos where supported) if I would be doing this a lot. If you have long videos, you better have plenty of disk space to spend on temporary files.

This is where the code starts to get a little filename-dependant. In a script, this would be more clever.

<pre><code>ffmpeg -i 00120.MTS.mp4 -c copy -bsf:v h264_mp4toannexb -f mpegts intermediate1.ts
ffmpeg -i 00121.MTS.mp4 -c copy -bsf:v h264_mp4toannexb -f mpegts intermediate2.ts
ffmpeg -i "concat:intermediate1.ts|intermediate2.ts" -c copy -bsf:a aac_adtstoasc output.mp4</code></pre><br />
And it works! You end up with an h264 video, aac audio, and an mp4 container.

As for a Windows solution...

1. you can use Handbrake ( http://handbrake.fr/ ) to convert the files. I'm unfamiliar with the interface, but google suggests that it works. No idea about the concatenation part.
2. write a batch file for ffmpeg. you can run ffmpeg from the windows command line. Unless you're proficient in bat, this will probably be a hassle.

This seems like good project for python practice. A python script ought to work in Windows, if you've got the right pieces.