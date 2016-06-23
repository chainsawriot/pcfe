# Chapter 3: File system

# [Unix conventional directory layout](https://en.wikipedia.org/wiki/Unix_filesystem#Conventional_directory_layout)

* Your home directory
  * `/home/yourusername` in Linux and `/Users/yourusername` in Mac OS X 
  * Short hand: `~/`
	* Example, Desktop: `~/Desktop`
* Current directory
  * `pwd`
  * Short hand: `./`
  * Upper level: `../`
* Absolute path and relative path
  * Absolute path: anything start from /
    * e.g. nano /home/yourusername/Desktop/test.txt
  * Relative path: anything start from your current directory
    * e.g. cd ~/ ; cd Desktop ; nano test.txt

File manipulation commands

* `cp` copy
* `mv` move, can also be used to rename
* `rm` remove file (caution: no undelete)
   * `mv rubbish.txt ~/.Trash`
* `mkdir` create directory
* `rmdir` remove empty directory
* `rm -rf` remove directory with files (caution: no undelete)

## untidying

Let's create a untidying script together to 'untidy' a tidied directory into another directory called 'rubbish'.

advance users might use:

```{sh}
mkdir rubbish ; find untidier -type f | xargs -I {} cp {} rubbish
```

## tidying

Let's create a tidying script 'tidy' a untidied directory to a tidy one.

Just listing the files, non-recursively. (Not including directories)

```{sh}
find untidier -maxdepth 1 -type f
```

Exclude certain file

```{sh}
find . -maxdepth 1 -type f | grep -v 'jmsc\.png$'
```

Exclude hidden files

```{sh}
find . -maxdepth 1 -type f | grep -v '/\.'
```

Determine the file extension of a file

```{sh}
echo 'hello.PNG' | grep -o '[0-9A-Za-z]\+$' | tr '[:upper:]' '[:lower:]'
```

Determine existence of a Dir with $ext

```{sh}
if [ -d "$ext" ]
then
    mv $1 $ext
else
    mkdir $ext
    mv $1 $ext
fi
```


## usage example

`crontab -e`

and let it tidy up your Download directory.

## PATH

