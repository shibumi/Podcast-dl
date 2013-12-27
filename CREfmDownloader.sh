#!/bin/sh
#
# CREfmDownloader.sh - Download all cre.fm podcasts
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
wget http://cre.fm/archiv

#grep podcast-files from archive-file
cat archiv | egrep -o '(cre\.fm/cre[0-9][0-9][0-9][^"[:space:]]+)' > FILE

#clean up urls
sed 's/<\/a>//g' FILE > archiv
sed 's/#.*$//g' archiv > FILE
cut -d"/" -f2 FILE > archiv

#adding missing podcast-files
echo "cre001" >> archiv
echo "cre002" >> archiv
echo "cre007" >> archiv
echo "cre008" >> archiv
echo "cre009" >> archiv

#sort everything and prepare download
cat archiv | sort -u > FILE

#clean up
rm archiv

#downloading podcast-files...
for i in $(cat FILE)
do
	wget "http://meta.metaebene.me/media/cre/"$i".oga"
done

