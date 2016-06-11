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

## More on grep

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



find . -type f
grep '^From:.\+<.\+>' ./HRCEmail_SeptemberWeb/C05785536.txt | grep -o '<.*>' | tr '[:upper:]' '[:lower:]' | sed 's/[<>]//g'
