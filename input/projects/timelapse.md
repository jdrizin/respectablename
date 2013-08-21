title: timelapse
description: some information about time-lapse photography
author: Josh Drizin
date: 2013/07/26
submenu-position:2
---
<script src="/js/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>

# Hardware

## Cameras

I've only used Canon hardware to test any of the things I've done, but there's 
no reason it shouldn't work with anything gphoto2 supports. This is just a list 
of what I've tested out.

 * (dSLR) Canon 30D
 * (dSLR) Canon 350D / Kiss Digital N
 * (P&S) Canon PowerShot SX110

gphoto2 has a [big list of supported cameras](http://www.gphoto.org/doc/remote/)

# Software

## Control script

For my thesis, I was controlling two Canon 350Ds. I discovered that each 350D 
does not seem to identify itself uniquely to the computer by standard USB. This 
meant that I could not assign the cameras unique port names with udev to use 
with gphoto2. Because I needed to differentiate the cameras on the command line, 
I had to work around this issue. 

Turns out, many cameras have a way of storing information for use in EXIF tags. 
The ownername is a convenient tag for this and should be available on every 
camera supported by gphoto2. If you plug in only one camera at a time, you can 
set this using gphoto2 from the command 
line:

<pre><code> gphoto2 --set-config ownername="foo"</code></pre><br />
This works around the uniqueness issue and makes the camera script relatively 
hardware-agnostic, provided the hardware can use the ownername field. I wrote a
control script in Python.

Notes:
 * running Linux
 * gphoto2 is in your $PATH
 * defaults to --capture-and-download
 * the script dumps images in the current path
 * provides default values for number of frames to collect and interval time

OSX users may be able to use this script with slight modification. Windows 
users, good luck. You can find the up-to-date code [on Github](https://github.com/jdrizin/timelapse-utilities/blob/master/camera.py)

## Pulling out data

I ended up pulling out timestamp data using R and the exiv2 utility, though you 
could just as easily use your favorite scripting solution. Since all I cared 
about was time, I used:

<pre><code>exiv2 pr -g Exif.Image.DateTime </code></pre><br />
and [dumped the output into R](https://github.com/jdrizin/Drizin-thesis-code/blob/master/10_extractTimestamps.r) for processing.
