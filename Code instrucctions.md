# Code instrucctions:

1. `setups.sh` is imported into `starts.sh`.
2. The number of directories to compress is got with: `SIZE=${#ONLYTHESEDIRS[*]}` to use it with: `${ONLYTHESEDIRS[j]}`
3. The content of the `.resume` file is taken to verify from what directory is necesary to start the compression.
4. `BAN=false` is set, to set it as `true` when the loop `for i in "$DIRSOURCES"/*;` reaches the directory to start to compression.
5. `printf "n $DIRDESTINATION/$NAME-%02d.tar\n" {2..74} |` Pipe the `tar` command allowing to excecute the `-ML $VOLUMESIZE` automatically without asking in console for the user interaction.