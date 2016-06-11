# Preface

Please evaluate if you really need this workshop. If you have many "yes" to the following questions, you can safely skip this workshop.

1. You know what `ls` is.
2. You know how to write a shell script.
3. You have a github account.
4. You have a github repo in your github account.
5. You know what a function is.
6. You know how to write a function in R.
7. You know how to write a commandline program in R.

# Chapter 1: "Textmining" with nothing but your Unix Shell!

GUI is great, but Unix Shell is greater! Use Unix Shell!

## Preparation

* Access to Unix Shell (Linux - any favour, Mac OS X)
* I will guide you how to install git and R
* Optional: zsh, oh my zsh
* A text editor

### Quick guide to your Unix Shell

```{sh}
ls
man ls
ls -lart
ls ~/
```

Our data

```{sh}
cd inaugural
ls
ls -lart
less 2013-Obama.txt
cd ../
```

press q to quit `less`

`cd`, `ls` and `less` is all you need to know right now.

### Redirection

What you see on the screen is called STDOUT (Standard output). You can redirect what you see on screen to a file.

```{sh}
ls ./inaugural
ls ./inaugural > inaug_list.txt
ls
less inaug_list.txt
rm inaug_list.txt
```

NOTE: There is no undelete for `rm`!

Now you know 3 commands: `ls`, `less` and `rm`

#### > and >>

`>>` is appending.

```{sh}
ls ./inaugural > inaug_list.txt
less inaug_list.txt
ls ~/ > inaug_list.txt
less inaug_list.txt
ls ./inaugural >> inaug_list.txt
less inaug_list.txt
rm inaug_list.txt
```

More on [redirection](https://en.wikipedia.org/wiki/Redirection_(computing)).

### Piping

Puting the text output of one command as the text input of another command with `|`.

```{sh}
ls ./inaugural | less
man wc
wc -l ./inaugural/2013-Obama.txt
ls ./inaugural | wc -l
```

Explain to yourself what is the meaning of the last command.

Now you know 4 commands: `ls`, `less`, `rm` and `wc`.

## Unix philosophy

> This is the Unix philosophy: Write programs that do one thing and do it well. Write programs to work together. Write programs to handle text streams, because that is a universal interface.

- Doug Mcllroy

More on [Unix philosophy](https://en.wikipedia.org/wiki/Unix_philosophy).

In summary:

1. Do one thing (`ls`, `less`, `rm` and `wc` have only one single purpose) 
2. Chain tools together by redirecting / piping
3. TEXT STREAMS!

### Text stream modification (usually with REGEX)

Which last name of president has the most number of inaugural addresses?

```{sh}
echo 'HKOSCON2016'
echo 'HKOSCON2016' | sed 's/[0-9]/he/g'
echo 'HSOSCON2016' | sed 's/[0-9]//g'
ls ./inaugural | sed 's/[0-9]//g'
ls ./inaugural | sed 's/[0-9\-]//g'
ls ./inaugural | sed 's/[0-9\-]//g' | sed 's/\.txt$//g'
ls ./inaugural | sed 's/[0-9\-]//g' | sed 's/\.txt$//g' | sort
ls ./inaugural | sed 's/[0-9\-]//g' | sed 's/\.txt$//g' | sort | uniq
ls ./inaugural | sed 's/[0-9\-]//g' | sed 's/\.txt$//g' | sort | uniq -c
ls ./inaugural | sed 's/[0-9\-]//g' | sed 's/\.txt$//g' | sort | uniq -c | sort -nr
ls ./inaugural | sed 's/[0-9\-]//g' | sed 's/\.txt$//g' | sort | uniq -c | sort -nr | head -n 20
```
