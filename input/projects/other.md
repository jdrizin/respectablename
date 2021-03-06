title: other
submenu-position: 6
description: other projects that don't need their own whole page
author: Josh Drizin
date: 2013/08/22
---
## Kite aerial photography
In 2007, Stuart suggested we send an expensive camera up in a kite. So we did. 
We had a kite the size of a queen-sized bed that would lift up the dSLR in 3mph 
winds, a camera with remote control in a 
[picavet](http://www.kaper.us/basics/BASICS_picavet.html) 
suspension, and a distance-marked kitestring. I came up with some ground markers 
that would allow us to stitch images together and we managed to get the kite 
going several times. Unfortunately, we never quite got the height we wanted 
and the kite-surveying idea never really panned out. We got some neat photos 
though. Find some more info on [the Echinacea Field Log](http://blog.lib.umn.edu/wage0005/echinacea/projects/kap/you)

If I were to tackle this again, I'd just get a quadcopter. It was a nightmare 
trying to get the camera to go where you wanted with the kitestring and you 
don't have great control. The quadcopter gives you decent stability for a 
relatively modest price and should be easier to deal with than a kite.

## ggmap and R
I have been building some maps in R with ggmap. You can see some of the code 
[online](https://github.com/jdrizin/artocarpus-mapping)

## gist-clone
I wrote a [little script](https://github.com/jdrizin/gist-clone) to parse http 
gist URLS and clone them as git urls so I don't need to type in a password.

## Interactive keys
I put together an interactive key using 
[Lucid 3.3](http://www.lucidcentral.com/en-us/software/lucid3.aspx), but the 
experience was not a pleasant one. Their installer was completely broken on 
Linux even after going back and forth with support. After finally fixing it, I 
got to experience the software. Not only is the interface confusing, the 
software is rather slow and seemed prone to crashing. There's also no way to 
enter in data from a text source, so be prepared to a lot of mousing around. 
This also makes it impossible to update the key from a database or keep it under 
and reasonable version control. It's certainly not worth the expensive license. 

[SAIKS](http://www.galexander.org/saiks/README), on the other hand, sucks much 
less. The data format is kind of a fragile javascript file with the data in a 
couple big arrays, but it works. I ended up writing a conversion script to go 
from a CSV format to the JS format with an ugly change to deal with unknowns in 
our data. This treats missing characters as wildcards, meaning it's possible 
that identifications will be less precise. Another downside is that if your data 
are somehow broken, say, some is missing or malformed, there are no useful 
error messages, even in the JS console. The important thing, however, is that it 
works, and it actually works pretty well. With some clever scripting and a 
cron job, you could probably regenerate this from a database if you really 
wanted.

Check out [the original code](https://github.com/jdrizin/saiks), 
[my altered code](https://github.com/jdrizin/saiks-artocarpus) which includes a 
simple way to include image popups, and my 
[conversion script](https://github.com/jdrizin/saiks-artocarpus/blob/master/charconvert.py) 
in the same repository. You can also 
[take a look at the key](http://artocarpus.biomoose.com/index.php/key/saiks/)

## Linux chroot in android
I wrote a script to mount up a debian chroot from android, but never really 
got around to using it due to the lack of a good X server limiting its 
usefulness. Code's [here](https://github.com/jdrizin/debian-android)

## This site

You can check out the source code for this site 
[on Github](https://github.com/jdrizin/respectablename) and build it with 
[Poole](https://bitbucket.org/obensonne/poole).