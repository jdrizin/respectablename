#!/bin/sh

poole.py --build

rsync -avz output/ biomoose:/home/josh/www/respectablename/
