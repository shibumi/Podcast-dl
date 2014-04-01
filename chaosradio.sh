#!/bin/zsh
#
# chaosradio.sh - Download all chaosradio podcasts
#
# Copyright (c) 2014 by Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/
#
#======================================================================
# Author: Christian Rebischke
# Email : echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d
# Github: www.github.com/Shibumi
# GPG: E2C0DC2A


for i in $(seq 1 9)
do
  wget "http://chaosradio.ccc.de/archive/chaosradio_00${i}.mp3"
  if [ $? != 0 ] 
    then 
    echo "Skip chaosradio_00${i}.mp3"
  fi
done

for i in $(seq 10 99)
do 
  wget "http://chaosradio.ccc.de/archive/chaosradio_0${i}.mp3"
  if [ $? != 0 ]
    then
    echo "Skip chaosradio_00${i}.mp3"
  fi
done

for i in $(100 172)
do 
  wget "http://chaosradio.ccc.de/archive/chaosradio_${i}.mp3"
  if [ $? != 0 ]
    then
    echo "Skip chaosradio_00${i}.mp3"
  fi
done

wget "http://chaosradio.ccc.de/chaosradio-complete.rss" -O archiv

echo "Downloading the other files..."

cat archiv | grep -o "http://chaosradio.ccc.de/archive/cr[0-9]\{3\}-[A-Za-z]*\.mp3" > LOG

for i in $(cat LOG)
do
  wget $i
done

