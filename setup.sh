#!/bin/bash

## Sources:
SOURCE="Sysetup"

## Destinations:
DESTINATION="."

## Only these directories:
ONLYDIRS=("*") #Default: ONLYDIRS=("*") All directories will be executed.

## Excludes:
EXCLUDES=(".git" ".DS_Store" "node_modules") #EXCLUDES=(".git" ".DS_Store" "node_modules" "*.mp4")

## Volume size:
VOLUMESIZE="3G"

## Tar options:
OPTIONS="-hcvf" #-h: symlinks, [-z: gzip || -j: gzip2 (more compression)] Compression using -z or -j works without `-ML`, -c: compress works with `-ML`, -v: verbose mode, -f: Allows you to specify the filename of the archive.