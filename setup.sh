#!/bin/bash

## Sources:
SOURCE="Sysetup"

## Destinations:
DESTINATION="."

## Only these directories:
ONLYDIRS=("*") #Default: ONLYDIRS=("*") All directories will be executed.

## Excludes:
EXCLUDES=(".git" ".DS_Store" "node_modules")

## Volume size:
VOLUMESIZE="3G"

## Tar options:
OPTIONS="-hcvf" #-h: symlinks, [-z: gzip || -j: gzip2 (more compression)] Compression works without `-ML`, -c: compress, -v: verbose mode, -f: Allows you to specify the filename of the archive.