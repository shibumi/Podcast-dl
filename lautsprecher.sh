#!/bin/zsh
#
# raumzeit.sh - Download all raumzeit podcasts
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
wget http://der-lautsprecher.de/archiv

#grep podcast-files from archive-file
cat archiv | egrep -o '(raumzeit-podcast\.de/ls[0-9][0-9][0-9][^"[:space:]]+)' > FILE

#clean up urls
sed 's/<\/a>//g' FILE > archiv
sed 's/#.*$//g' archiv > FILE
cut -d"/" -f2 FILE > archiv

#adding missing podcast files
echo "ls000-der-lautsprecher" >> archiv
echo "ls001-audioformate-feeds-itunes" >> archiv
echo "ls002-der-gute-ton" >> archiv
echo "ls003-podcast-publishing" >> archiv
echo "ls004-mischpulte" >> archiv
echo "ls005-aufnahmekonzepte" >> archiv
echo "ls006-open-source-tools" >> archiv
echo "ls007-auphonic" >> archiv
echo "ls008-bitlove" >> archiv
echo "ls009-sendungsplanung" >> archiv
echo "ls010-podlove" >> archiv


#sort everything and prepare download
cat archiv | sort -u > FILE

#clean up
rm archiv

#downloading podcast files...
for i in $(cat FILE)
do
	wget "http://meta.metaebene.me/media/lautsprecher/"$i".oga"
done


