R iRL 3
========================================================
author: Alexander Tolmach
date: May 2015

## Data aggregating and reshaping - 2

Homework answers - task1
========================================================
|Group.1   |      x|
|:---------|------:|
|Friday    | 434.50|
|Monday    | 434.20|
|Saturday  | 444.50|
|Sunday    | 456.80|
|Thursday  | 439.25|
|Tuesday   | 432.80|
|Wednesday | 430.50|

***

Code - in file `homework2.R` on GitHub

Homework answers - task2
========================================================

|   |Group.1                          |x           |
|:--|:--------------------------------|:-----------|
|7  |Wizard_Completed                 |       8.0  |
|2  |FreePaidTransfer                 |     471.0  |
|5  |TrialActivation                  |    1573.5  |
|9  |kl1091ndafs-IAP                  |   35878.5  |
|6  |TrialPaidTransfer                |  527329.0  |
|4  |Renew                            | 2517657.0  |
|1  |Find_More_About_Premium_Features | 3633414.0  |
|3  |Premium_Features_Click           | 7867056.0  |
|8  |kl1091ndafr-IAP                  |32094196.0  |

Aggregate: What had happened?
========================================================

We have splitted our data.frame into pieces, and for every piece calculated some value.

But we can face to more complicated processing task.

Then we will iterate over every element/row.

## Loops will help us.

Loops
========================================================

* `for()` - iterate over sequence
* `while()` - iteration with condition testing
* `repeat()` - infinite loop (equal to `while(TRUE)`)

  To exit loop use `break`

for() loop
========================================================

Most common used type of loop

We have a sequence (the simpliest way - sequence is used to assign index):


```r
for(i in 1:10){
  print(i)
}
```

```
[1] 1
[1] 2
[1] 3
[1] 4
[1] 5
[1] 6
[1] 7
[1] 8
[1] 9
[1] 10
```

for() loop
========================================================

For loop is valid not only for indexes:


```r
names <- c('Alice', 'Bob', 'Carol', 'Dave')
for(name in names){
  print(paste('My name is', name))
}
```

```
[1] "My name is Alice"
[1] "My name is Bob"
[1] "My name is Carol"
[1] "My name is Dave"
```

for() loop
========================================================

It is possible to nest for loops inside one another:


```r
tdf <- data.frame(age = c(21,20,35,14), names = c('Alice', 'Bob', 'Carol', 'Dave'))
for(i in 1:nrow(tdf)){
  for(j in 1:ncol(tdf)){
    print(tdf[i, j])
  }
}
```

```
[1] 21
[1] Alice
Levels: Alice Bob Carol Dave
[1] 20
[1] Bob
Levels: Alice Bob Carol Dave
[1] 35
[1] Carol
Levels: Alice Bob Carol Dave
[1] 14
[1] Dave
Levels: Alice Bob Carol Dave
```

Condition testing
========================================================


```r
if(<condition1>){
  ## do something
} else {
  ## do something else
}
```


```r
if(<condition1>){
  ## do something
} else if(<condition2>) {
  ## do something else
} else {
  ## do something absolutely different
}
```

Let's return to VK data.frame
========================================================




```r
head(visitors)
```

```
           Date Criterion Value  Weekday
1248 2015-03-31  visitors   410  Tuesday
1326 2015-03-30  visitors   437   Monday
1415 2015-03-29  visitors   451   Sunday
1496 2015-03-28  visitors   462 Saturday
1579 2015-03-27  visitors   455   Friday
1662 2015-03-26  visitors   433 Thursday
```

Imagine, that we conducted an ad campaign for our group during March 10-20. I need to know average number of visits during campaign and without it.

Example
========================================================

It's possible to solve our task using `aggregate`, but let's use more clear way with `for()` loop.


```r
no.ad <- data.frame()
during.ad <- data.frame()
for(i in 1:nrow(visitors)){
  if(visitors$Date[i] >= as.Date('2015-03-10') & visitors$Date[i] <= as.Date('2015-03-20')){
    during.ad <- rbind(during.ad, visitors[i, ])
  } else {
    no.ad <- rbind(no.ad, visitors[i, ])
  }
}
```

Example
========================================================

And here is the answer:


```r
mean(during.ad$Value)
```

```
[1] 427.8182
```

```r
mean(no.ad$Value)
```

```
[1] 445.4
```

while() loop
========================================================


```r
i <- 0
while(i < 5){
  print(i)
  i <- i + 1
}
```

```
[1] 0
[1] 1
[1] 2
[1] 3
[1] 4
```

Don't forget to code index evaluation! Or you will get infinite loop! Or don't think too much about these loops.

apply
========================================================

`apply()` is a general function which is used to evaluate any arbitrary (often anonymous) function over the margins of an array

There is a bunch of functions:

* `apply()` - most general apply fucntion
* `lapply()` - loop over a list and evaluate function on each element
* `sapply()` - same as lapply, but tries to simplify returned list
* `mapply()` - multivariate version of lapply
* `tapply()` - apply a function over subsets of a vector

apply
========================================================

Result of apply function is similar to what for-loop does. But there is a stong belief, that `apply` is faster than `for` loop.
Anyway, often it's more beautiful and neat.


```r
is.ad <- function(x){
  x[1] >= as.Date('2015-03-10') & x[1] <= as.Date('2015-03-20')
}
visitors$ad <- apply(visitors, 1, is.ad)
visitors$ad
```

```
 [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[12]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[23] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
```

lapply
========================================================

Remember?




```r
names(ages.list)
```

```
[1] "1-18"  "18-21" "21-24" "24-27" "27-30" "30-35" "35-45" "45+"  
```

```r
sum(ages.list[['1-18']])
```

```
[1] 1291
```

lapply
========================================================

Let's iterate over the list:


```r
lapply(ages.list, sum)
```

```
$`1-18`
[1] 1291

$`18-21`
[1] 1469

$`21-24`
[1] 1499

$`24-27`
[1] 1449

$`27-30`
[1] 1188

$`30-35`
[1] 1017

$`35-45`
[1] 927

$`45+`
[1] 734
```

sapply
========================================================

**s** stands for *simplify*


```r
sapply(ages.list, sum)
```

```
 1-18 18-21 21-24 24-27 27-30 30-35 35-45   45+ 
 1291  1469  1499  1449  1188  1017   927   734 
```

sapply
========================================================

Could be useful, when you have a huge data.frame, and need to get column classes


```r
sapply(df, class)
```

```
       Date   Criterion Parameter.1 Parameter.2       Value 
     "Date"    "factor"    "factor"    "factor"   "integer" 
```

tapply
========================================================

Why t? I don't know. Actually, here is simplified version of `aggregate()`


```r
head(visitors, 3)
```

```
           Date Criterion Value Weekday    ad
1248 2015-03-31  visitors   410 Tuesday FALSE
1326 2015-03-30  visitors   437  Monday FALSE
1415 2015-03-29  visitors   451  Sunday FALSE
```

```r
tapply(visitors$Value, visitors$ad, mean)
```

```
   FALSE     TRUE 
445.4000 427.8182 
```

But `aggregate()` could be used for multiple columns (even data.frames) and with multiple indexes.

Homework-1
========================================================

## Using VK-stat-table, calculate average number of visits and views on weekends, and on working days.

Main steps:

* Load data.frame, recode Date var and filter to march only values.
* Select only views and visitors data.
* Construct weekday var
* Using `apply()` construct weekend-or-not variable
* Use aggregate with two index vars (visitors or views, and weekend or not)

Wide and long data
========================================================
type: section

* Wide data has a column for each variable.

* Long data has a column for variable description.

Let's prepare
========================================================


```r
install.packages("reshape2")
```


```r
library(reshape2)
```

Here is our long data
========================================================


```r
long <- df[df$Date == as.Date('2015-03-01') & df$Criterion == 'gender_age', c('Parameter.1', 'Parameter.2', 'Value')]
long
```

```
     Parameter.1 Parameter.2 Value
3761           F        1-18     7
3762           F       18-21    10
3763           F       21-24    11
3764           F       24-27     9
3765           F       27-30     4
3766           F       30-35     3
3767           F       35-45     6
3768           F         45+     4
3769           M        1-18    42
3770           M       18-21    39
3771           M       21-24    39
3772           M       24-27    49
3773           M       27-30    29
3774           M       30-35    20
3775           M       35-45    34
3776           M         45+    24
```

And here is we transforming it to wide
========================================================

```r
wide <- acast(long, formula = Parameter.2 ~ Parameter.1, value.var='Value')
wide
```

```
       F  M
1-18   7 42
18-21 10 39
21-24 11 39
24-27  9 49
27-30  4 29
30-35  3 20
35-45  6 34
45+    4 24
```

And back to long
========================================================

```r
long.again <- melt(wide)
long.again
```

```
    Var1 Var2 value
1   1-18    F     7
2  18-21    F    10
3  21-24    F    11
4  24-27    F     9
5  27-30    F     4
6  30-35    F     3
7  35-45    F     6
8    45+    F     4
9   1-18    M    42
10 18-21    M    39
11 21-24    M    39
12 24-27    M    49
13 27-30    M    29
14 30-35    M    20
15 35-45    M    34
16   45+    M    24
```

Summary
========================================================

### Long to Wide:

`acast()` or `dcast()`

What's for:

* Simplify data representation
* Try to use it in views/visitors homework before aggregate step

***

### Wide to Long:

`melt()`

What's for:
* Useful for plotting (later)

Homework-2
========================================================

## Using VK-stat-table, build overall (summary) wide age-gender distribution table.

Main steps:

* Load data.frame, recode Date var and filter to march only values.
* Select only joint age_gender stat.
* Aggregate overall number of visitors during month for every age-gender group.
* Convert long data.frame to wide, using `acast()` function.

Homework-3
========================================================

## Using VK-data, construct table, where rows would be dates, and columns would be: Visitors, Views, Reach, Reach_Subscribers

Save this data.frame.

No hints.

Good luck  :)
