# Chapter 2: "Textmining" with nothing but your Unix Shell! What? Again?

## more on regex by playing SCRABBLE.

* How to play my Z tile?

```{sh}
grep 'Z' words.txt
```

* Any words begin with QU?

```{sh}
grep '^QU' words.txt
```

* Any words end with EZ?

```{sh}
grep 'EZ$' words.txt
```

* Find exact word of AXE.

```{sh}
# combining ^ and $
grep '^AXE$' words.txt
```

* Find words of A_E?

```{sh}
# special character . is any character
grep '^A.E$' words.txt
```

* Find words end with 'ABLE'?

```{sh}
# * : zero or more occurrence
grep '.*ABLE$' words.txt
# actually the same as
grep 'ABLE$' words.txt
```

* Find words end with 'FULL' but not FULL itself?

```{sh}
grep 'FULL$' words.txt
# \+ : at least one occurrence
grep '.\+FULL$' words.txt
```

* Find words with 'ANISH' with the I being optional? (matching ANISH and ANSH)

```{sh}
# \?: the previous character is optional
grep 'ANI\?SH' words.txt
```

* Find words begin with Q and then non-U vowel.

```{sh}
grep '^Q[AEIO]' words.txt
```

* Find words begin with Z and then not a vowel.

```{sh}
# Stupid method
grep '^Z[BCDFGHJKLMNPQRSTVWXYZ]' words.txt
# Smart method
# ^ inside [] means 'not'
grep '^Z[^AEIOU]' words.txt
```

* Find words begin with Z and then not a vowel, and then a vowel.

```{sh}
grep '^Z[^AEIOU][AEIOU]' words.txt
```

* Find words with at least 4 consequtive vowels.

```{sh}
# Stupid method
grep '[AEIOU][AEIOU][AEIOU][AEIOU]' words.txt
# Smart method
# exactly 4 times
grep -E '[AEIOU]{4}'
# 4 to 10 times
grep -E '[AEIOU]{4,10}'
# At least 5 times
grep -E '[AEIOU]{5,}'
```

### More on grep

You can pipe into grep, as always.

```{sh}
echo 'From: <ceo@ceo.gov.hk>' | grep 'From'
```

You can just extract the matching part.

```{sh}
echo 'From: <ceo@ceo.gov.hk>' | grep '<.\+>'
echo 'From: <ceo@ceo.gov.hk>' | grep -o '<.\+>'
echo 'From: <ceo@ceo.gov.hk>' | grep -o '<.\+>' | sed 's/[<>]//g'
```

## Interactive use versus non-interactive use

### interactive use

REPL (Read-eval-print loop)

We type in command, and then expect some output.

### Non-interactive use <- BIG IDEA OF THE DAY!!!

Commands are recorded in a file called 'shell script' and execute.

#### intuition

Try these command

```{sh}
cal
date
whoami
```

Example, create a file called `test.sh` with content

```{sh}
cal
date
whoami
```

and then try

```{sh}
bash test.sh
```

## Email address extraction from Hillary's email

Try this

```{sh}
grep '^From:.\+<.\+>' emailsample.txt 
grep '^From:.\+<.\+>' emailsample.txt | grep -o '<.*>' 
grep '^From:.\+<.\+>' emailsample.txt | grep -o '<.*>' | tr '[:upper:]' '[:lower:]' 
grep '^From:.\+<.\+>' emailsample.txt | grep -o '<.*>' | tr '[:upper:]' '[:lower:]' | sed 's/[<>]//g'
```

## Create reusable shell script

1. copy-and-paste

Create a file called `emailex.sh` and put the above command in.

Test it with `bash emailex.sh`

2. Add permission to execute

`chmod +x emailex.sh`

Test it with `./emailex.sh`

(Remember, not just `emailex.sh`, will explain later)

3. Add shebang

The shebang is a special line in the script that instructs the system which executable should be used to interpret the commands. In this case: bash

add this line to emailex.sh

```{sh}
#!/usr/bin/env bash
```

4. Remove fixed input and parameterize

We want to use our `emailex.sh` only on emailsample.txt but any email in the Hillary's email corpus.

#### The concept of variable and argument

let's create a shell script called `var.sh`

```{sh}
#!/usr/bin/env bash
pi='3.1416'
echo $pi
```

REMEMBER: declare variable with `var` and recall it with `$var`!

##### Parameterize

let's create another shell script called `arg.sh`

```{sh}
#!/usr/bin/env bash
# $1, $2... $n are the position of the argument
echo $1
echo $2
```

and run it with

```{sh}
./arg.sh down 689
./arg.sh hello world shell
```

QUESTION and Challenge #1: Look at `emailex.sh` and see which part of the program is fixed input and should be parameterized. Try it with:

```{sh}
./emailex.sh sampleemail.txt
./emailex.sh sampleemail2.txt
./emailex.sh sampleemail3.txt
./emailex.sh multimatch.txt
```

Now, we have built our first reusable shell script.

### Directory structure

```{sh}
pwd
cd /
cd ~/
cd ~/dev
cd ./pcfe
cd ..
```

### LOOPING

We can use our `emailex.sh` interactively on email files inside the hillary directory. Such as:

```{sh}
./emailex.sh ./hillary/Clinton_Email_August_Release/C05772876.txt
```

But we want to extract all emails from the hillary directory:

```{sh}
ls ./hillary
ls ./hillary/Clinton_Email_August_Release
```

find command: recursively list out the relative path of files

```{sh}
find ./hillary -type f
```

QUESTION and Challenge #2: How many files are there?

Our goal is to use `emailex.sh` to each entry from `find ./hillary -type f`.

Let's create massex.sh

```{sh}
while read fname
do
    ./emailex.sh $fname
done
```

and then

```{sh}
find ./hillary -type f | ./massex.sh
```

Press Ctrl + C to stop

Try this also

```{sh}
find ./hillary -type f | ./massex.sh | sort | uniq -c | sort -nr | head -n 50
```

Discuss what you find from the result and how to improve it.

QUESTION and Challenge #3: Modify and create an extractor of domain name from URL in Hillary's email. Modify `massex.sh` to parameterize with different extractors. Extract the most popular domain names.

### Optional: GNU parallel


