# Backup script.
----

```bash
   ____             __             
  / __/_ _____ ___ / /___ _____ _/|
 _\ \/ // (_-</ -_) __/ // / _ > _<
/___/\_, /___/\__/\__/\_,_/ .__//  
    /___/                /_/       
> Software development company.
```

----

### Backups using Tar an archiving utility.

[Tar Manual](http://www.gnu.org/software/tar/manual)

[Tar Repository](https://savannah.gnu.org/git/?group=tar)

[Tar Repository](https://git.savannah.gnu.org/cgit/tar.git)

----
## Instructions:

1. Set the following variables in the file: `setups.sh`: 
   * `SOURCE` **Type:** String. **Path** to the directory to be packaged. Each **level 1** subdirectory will be packaged into a tarball independly. If it's desired to pack all data in an **unique** tarball then select a super directory and choose only the subdirectory to pack setting the variable `ONLYDIRS`
     * `SOURCE="/path/to/dir"`
   * `DESTINATION` **Type:** String. **Path** to the drive to store the tarballs.
     * `DESTINATION="/path/to/drive"`
   * `ONLYDIRS` **Type:** Array, each value of this array is a string with the path to the directories which be only included in the backup. The backup will be executed only for these directories. The default value set for all directories is: `ONLYDIRS=("*")` **These paths must be set for only the next level of `SOURCE`**
     * `ONLYDIRS=("/path/to/dir01" "/path/to/dir02")`
   * `EXCLUDES` **Type:** Array. **Paths**, **patterns** or **dirs/files names** to exclude in the backup. **These paths can be in all level directories**
     * `EXCLUDES=(".git" ".DS_Store" "node_modules")`.
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

1. If the compression proccess is suspended, the script starts from the last level 1 subdirectory executed.

----