#!/bin/bash


printf '%s\n' "## This file provides the default APT repositories for Parrot Security
## These repositories are used to fetch new software and system updates

###############################
## Default Parrot Repository ##
###############################
## The 'parrot' repository provides all the Parrot software considered
## stable and tested.
##
## the main suite provides the base system plus all the software released
## under a free and open source license compatible with the Debian guidelines.
##
## the contrib suite provides additional free software that depends on third
## party software not provided by the main suite. it usually means that such
## packages depend on non-free software.
##
## the non-free suite provides additional packages that don't comply with
## the Debian Free Software Guidelines. They are mostly proprietary software.
deb https://deb.parrot.sh/parrot parrot main contrib non-free

######################
## Security Updates ##
######################
## The 'parrot-security' repository provides time sensitive security updates
## that have to be delivered to end users as fast as possible
##
## this repo should always be enabled in your system
##
## we strongly recommend to NOT use mirrors for this repo, but only
## access security updates from our official domains or CDNs.
##
## a mirror server could take too much time to fetch an important update,
## leaving you without security updates for a timespan outside of our control
deb https://deb.parrot.sh/direct/parrot parrot-security main contrib non-free

###############
## Backports ##
###############
## The stable repository contains software that is considered stable the day of
## the release. such packages receive only security and stability updates that
## don't introduce new features and don't drop old ones.
##
## the 'backports' repository provides feature updates to many packages, and
## even external software that was originally excluded from the stable release.
##
## disable it if you prefer stability and reliability over bleeding edge features
deb https://deb.parrot.sh/parrot parrot-backports main contrib non-free

#######################
## Updates / Testing ##
#######################
## The 'parrot-updates' repository provides updates before they are made available
## to 'parrot'. this repo is mostly meant to be used by developers and beta testers 
## to extensively test updates before they are migrated to the main repository
##
## we suggest not to enable it, as it may introduce untested bugs and make the
## system unstable. updates are delivered as fast as possible (within a week)
## so you are not missing anything important with this disabled (unless you are a dev)
#deb https://deb.parrot.sh/parrot parrot-updates main contrib non-free


##############################
## Source Code Repositories ##
##############################
## These repositories provide the debian source artifacts of the packages
## in the corresponding repos in the form of dsc files and the corresponding
## tarballs
##
## you only need these repositories if you intend to download the source code
## of a package and re-compile it yourself with debian-compliant build tools
#deb-src https://deb.parrot.sh/parrot parrot main contrib non-free
#deb-src https://deb.parrot.sh/parrot parrot-security main contrib non-free
#deb-src https://deb.parrot.sh/parrot parrot-backports main contrib non-free
#deb-src https://deb.parrot.sh/parrot parrot-updates main contrib non-free



##########################################################
## How to configure mirror servers for faster downloads ##
##########################################################
## The Parrot system is configured by default to use the central
## parrot archive directors. The Parrot directors are special servers that
## collect all the requests of the users and redirect them to the nearest
## download server available for the user who made the request.
##
## The Parrot Mirror Network is secured by centralized digital signatures
## and the mirrors can't inject fake updates. If an evil mirror tries to inject
## a fake package, Parrot OS will automatically refuse to download and install it.
##
## To configure a mirror, you have to replace the original URL with the URL
## Provided by the mirror
##
## Example:
## If you live in Italy and you want to take advantage of the GARR mirror,
## Replace
##  deb https://deb.parrot.sh/parrot parrot main contrib non-free
## With
##  deb https://parrot.mirror.garr.it/mirrors/parrot parrot main contrib non-free
##
## IMPORTANT NOTES:
## do NOT use mirrors for the parrot-security repository. use them
## exclusively for 'parrot', 'parrot-backports' and 'parrot-updates'
##
## LIST:
## A full and updated list of official mirrors is available here:
##      https://www.parrotsec.org/docs/mirrors-list.html
##
##

##########################
## Some popular mirrors ##
##########################
## This is a non-comprehensive, and not-updated list of mirrors
## that we leave here a a quick reference. some of them are
## worldwide, meaning that they have several nodes around the world
## and the fastest one is picked automatically (CDN).
## others are tight to a specific region of the world.

## Worldwide - Parrot - automatically redirects to the best mirrors available
#deb https://deb.parrot.sh/parrot/ parrot main contrib non-free

## Worldwide - Parrot - core servers with no redirection
#deb https://deb.parrot.sh/direct/parrot/ parrot main contrib non-free

## Wordlwide - Bunny CDN - Uses the Bunny CDN platform
#deb https://bunny.deb.parrot.sh/parrot/ parrot main contrib non-free

## Wordlwide - Aliyun - Uses the AlibabaCloud mirrors behind their worldwide CDN
#deb deb https://mirrors.aliyun.com/parrot parrot main contrib non-free

## US Massachussetts - SIPB MIT University
#deb http://mirrors.mit.edu/parrot/ parrot main contrib non-free

## US California - OCF Berkekey University
#deb https://mirrors.ocf.berkeley.edu/parrot/ parrot main contrib non-free

## US Virginia - Leaseweb
#deb https://mirror.wdc1.us.leaseweb.net/parrot parrot main contrib non-free

## Germany - Halifax RWTH-Aachen University
#deb https://ftp.halifax.rwth-aachen.de/parrotsec/ parrot main contrib non-free

## Italy - GARR Consortium
#deb https://parrot.mirror.garr.it/mirrors/parrot/ parrot main contrib non-free

## Netherlands - Nluug
#deb https://ftp.nluug.nl/os/Linux/distr/parrot/ parrot main contrib non-free

## Russia - Yandex
#deb https://mirror.yandex.ru/mirrors/parrot/ parrot main contrib non-free

## Brazil - Sao Paulo University
#deb http://sft.if.usp.br/parrot/ parrot main contrib non-free

## Singapore - 0x
#deb https://mirror.0x.sg/parrot/ parrot main contrib non-free

## China - USTC University
#deb http://mirrors.ustc.edu.cn/parrot parrot main contrib non-free


## We strongly invite you to visit https://www.parrotsec.org/docs/mirrors-list.html
## to find the mirror that better fits your needs" |
  sudo tee /etc/apt/sources.list.d/parrot.list
  


curl -fsSL https://deb.parrot.sh/parrot/keyring.gpg |
  sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/parrot-archive-keyring.gpg
