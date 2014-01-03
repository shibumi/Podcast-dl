#!/bin/zsh
#
# newz-of-the-world.sh - Download all newz-of-the-world.com podcasts
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
wget http://newz-of-the-world.com/archive

#grep podcast-files from archive-file
cat archive | egrep -o '(metaebene\.me/media/newz/newz[0-9][0-9][0-9].*\.jpg)' > FILE

#clean up urls
cut -d"/" -f4 FILE > archive
cut -d"." -f1 archive > FILE

#sort everything and prepare download
cat FILE | sort -u > archive
cat archive > FILE
#clean up
rm archive
#downloading podcast files...
for i in $(cat FILE)
do
	wget "http://meta.metaebene.me/media/newz/"$i".oga"
done

