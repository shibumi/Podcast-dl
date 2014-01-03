#!/bin/zsh
#
# logbuch-netzpolitik.sh - Download all logbuch-netzpolitik podcasts
#
# Copyright (c) 2013 by Christian Rebischke <Chris.Rebischke@gmail.com>
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
# Email : Chris.Rebischke@gmail.com
# Github: www.github.com/Shibumi
# GPG: E2C0DC2A

#Download archive-file
wget http://logbuch-netzpolitik.de/archiv

#grep podcast-files from archive-file
echo $(cat ./archiv | sed "s/^M/\n/g" | grep '<a href="http://logbuch-netzpolitik.de/lnp' | sed "s/^.*>\(.*\)<\/a>.*/\1/g") > LOG

#clean up urls
cat LOG | sed "s/LNP/\nLNP/g" > archiv
cat archiv | tr [:upper:] [:lower:] > LOG
cat LOG | sed "s/ /-/g" > archiv
cat archiv | sed "s/ü/ue/g" > LOG
cat LOG | sed "s/ä/ae/g" > archiv
cat archiv | sed "s/\!//g" > LOG
cat LOG | sed "s/\[1\]/1/g" > archiv
cat archiv | sed "s/ó/o/g" > LOG
cat LOG | sed "s/l&#8217;/l-/g" > archiv
cat archiv | sed "s/&#8217;//g" > LOG
sed -i '1d' LOG 
cat LOG | rev | cut -c 2- | rev > archiv
cat archiv | sed "s/,//g" > LOG
cat LOG | sed "s/\.//g" > archiv
cat archiv | sed "s/ß/ss/g" > LOG

#clean up
rm archiv

#downloading podcast files...
for i in $(cat LOG)
do
	wget "http://meta.metaebene.me/media/lnp/"$i".oga"
done

