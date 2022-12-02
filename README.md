# Backup script.

----

```bash
   ____             __             
  / __/_ _____ ___ / /___ _____ _/|
 _\ \/ // (_-</ -_) __/ // / _ > _<
/___/\_, /___/\__/\__/\_,_/ .__//  
    /___/                /_/       
> Systems development company.
```

----

This script creates safety backups of data using Tar an archiving utility.


## Instructions:

1. Set the following variables in the file: `setups.sh` **Always use abusolete paths.** No slash `/` at the end in the paths:
   * `SOURCE` **Type:** String. **Path** to the directory to be packaged. Each **level 1** subdirectory will be packaged into a tarball independly. If it's desired to pack all data in an **unique** tarball then select a super directory and choose only the subdirectory to pack setting the variable `ONLYDIRS`
     * `SOURCE="/path/to/dir"`
   * `DESTINATION` **Type:** String. **Path** to the drive to store the tarballs.
     * `DESTINATION="/path/to/drive"`
   * `ONLYDIRS` **Type:** Array, each value of this array is a string with the path to the directories which be only included in the backup. The backup will be executed only for these directories. The default value set for all directories is: `ONLYDIRS=("*")` **These paths must be set for only the next level of `SOURCE`**
     * `ONLYDIRS=("/path/to/dir01" "/path/to/dir02")`
   * `EXCLUDES` **Type:** Array. **Paths**, **patterns** or **dirs/files names** to exclude in the backup. **These paths can be in all level directories**
     * `EXCLUDES=(".git" ".DS_Store" "node_modules" "*.mp4")`.
   * `OPTIONS` **Type:** String. Tar options: -h: symlinks, [-z: gzip || -j: gzip2 (more compression)] Compression works without `-ML`, -c: compress, -v: verbose mode, -f: Allows you to specify the filename of the archive. 
     * `OPTIONS="-hcjvf"`
   * `VOLUMESIZE` **Type:** String. Maximum size of each tarball. Is integer value followed by the suffix.
     * `VOLUMESIZE="IntegerSuffix"`
 
      The following suffixes alter this behavior:

       Suffix|Units|Byte Equivalent
       :---|:---:|---:
       b|Blocks|size x 512
       B|Kilobytes|size x 1024
       c|Bytes|size
       G|Gigabytes|size x 1024^3
       K|Kilobytes|size x 1024
       k|Kilobytes|size x 1024
       M|Megabytes|size x 1024^2
       P|Petabytes|size x 1024^5
       T|Terabytes|size x 1024^4
       w|Words|size x 2   

2. Execute the script `./start.sh`

## Features:

1. In the progress of the data copying process if the compression proccess is suspended, the script starts from the last first level subdirectory executed.

## Code instrucctions:

1. `setups.sh` is imported into `starts.sh`.
2. The number of directories to compress is got with: `SIZE=${#ONLYTHESEDIRS[*]}` to use it with: `${ONLYTHESEDIRS[j]}`
3. The content of the `.resume` file is taken to verify from what directory is necesary to start the compression.
4. `BAN=false` is set, to set it as `true` when the loop `for i in "$DIRSOURCES"/*;` reaches the directory to start to compression.
5. `printf "n $DIRDESTINATION/$NAME-%02d.tar\n" {2..74} |` Pipe the `tar` command allowing to excecute the `-ML $VOLUMESIZE` automatically without asking in console for the user interaction.

## TODO:

1. In an evolutionary stage make backups of complete websites using existing tools or creating new ones.

## Dependencies:

1. [Tar Manual](http://www.gnu.org/software/tar/manual), [Tar Repository](https://savannah.gnu.org/git/?group=tar), [Tar Repository](https://git.savannah.gnu.org/cgit/tar.git)

## External links, resources, citations, notes, related or similars projects:

### Own:

1. Search engine, bot and scrapper.

### Outsider: 

1. https://archivebox.io/

----