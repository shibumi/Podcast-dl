#!/bin/zsh
#
# alternativlos.sh - Download all alternativlos podcasts
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


n=1
for i in $(seq 0 29)
do
	wget "http://alternativlos.cdn.as250.net/alternativlos-${n}.ogg"
	let "n++"
done

