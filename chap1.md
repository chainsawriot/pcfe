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

