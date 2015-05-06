R iRL 2
========================================================
author: Alexander Tolmach
date: April 2015

## Data types

Basic operators
========================================================

Assignment


```r
var <- c(1,2,3,4)
names(var) <- c('first', 'second', 'third', 'fourth')
var
```

```
 first second  third fourth 
     1      2      3      4 
```

Comment

```r
# This is a comment 
# nothing happens
```

Basic operators
========================================================

Explicit printing

```r
print(pi)
```

```
[1] 3.141593
```

Objects
========================================================

Everything in R is an object. Every object belongs to it's class.

* character


```r
var <- 'Hello, world!'
```

* numeric/integer

```r
var1 <- 5.143
var2 <- 10L # Specify L to get integer
```

* logical

```r
var <- FALSE
```

Objects
========================================================

Custom object classes:
* factor

  For categorial variables. Has levels scale. It's character var with levels.
  
* date/time objects

  Main objects: POSIXlt/POSIXct/Date. It's numeric var with formatting.

* functions

Factors
========================================================

Better than numbers: 
* self-describing
* treated specially by functions like `lm()`

Issues:
* self-apearing
* Missings due to factor-levels

So:


```r
options(stringsAsFactors=FALSE)
```

Date/time
========================================================

* POSIXct: seconds since UNIX epoch
* POSIXlt: list of day, month, year, hour, minute, second, etc.
* Date: days since UNIX epoch

POSIXlt most convinient wrapper - it has vars like `sec`, `min`, `hour`, `mday`, `year`, etc.


```r
?POSIXlt
```

Functions on object classes
========================================================

Get class


```r
class('Hello')
```

```
[1] "character"
```

```r
class(pi)
```

```
[1] "numeric"
```

```r
class(Sys.Date())
```

```
[1] "Date"
```

Functions on object classes
========================================================

Transform class


```r
as.character(pi)
```

```
[1] "3.14159265358979"
```

```r
as.Date('2015-05-01')
```

```
[1] "2015-05-01"
```

```r
as.numeric(Sys.Date())
```

```
[1] 16560
```

Special values
========================================================

Special cases of numbers:
* `Inf` - Infinity:


```r
1/0
```

```
[1] Inf
```

* `NaN` - Not a number:


```r
0/0
```

```
[1] NaN
```

Special values
========================================================

NA - values - missing values

Have class: NA numeric, NA character

`is.na(x)` - function to test NA's, `is.nan(x)` is also possible

NaN is NA (always), but converse is not true 

Object attributes
========================================================

names, dimnames, class, length, etc.


```r
names(iris)
```

```
[1] "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width" 
[5] "Species"     
```

```r
class(pi)
```

```
[1] "numeric"
```

```r
length(iris$Species)
```

```
[1] 150
```

Object sequences
========================================================


```r
s1 <- 1:10
s1
```

```
 [1]  1  2  3  4  5  6  7  8  9 10
```

```r
s2 <- rep(1, 10)
s2
```

```
 [1] 1 1 1 1 1 1 1 1 1 1
```

```r
s3 <- c(10, 9, 1, 3)
s3
```

```
[1] 10  9  1  3
```

Object sequences
========================================================

* vector: 

  main sequence type (all elements are of the same type), not an object itself

* list: 

  special sequence type (elements may be of different type), and special type of object

* data.frame: 

  list of vectors - table with data

Vector
========================================================

Vector notation


```r
v <- c(1, 2, 3, 4, 5)
```

Single variable is just a vector of length 1


```r
is.vector(5)
```

```
[1] TRUE
```

Vector itself is not a class


```r
class(v)
```

```
[1] "numeric"
```

Vector
========================================================

Class of vector will be updated in case of higher level variable.


```r
v <- c(1, 2, 3)
class(v)
```

```
[1] "numeric"
```

```r
v <- append(v, 'Hello')
class(v)
```

```
[1] "character"
```

```r
v
```

```
[1] "1"     "2"     "3"     "Hello"
```

Matrix
========================================================

Matrix is a multidimensional vector

```r
m <- 1:10
dim(m) <- c(2, 5)
m
```

```
     [,1] [,2] [,3] [,4] [,5]
[1,]    1    3    5    7    9
[2,]    2    4    6    8   10
```

List
========================================================

List can contain elements of different classes.


```r
l <- list(df = head(iris, 2), v = 1:10)
l
```

```
$df
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa

$v
 [1]  1  2  3  4  5  6  7  8  9 10
```

Data.frame
========================================================

List of vectors: used to store tabular data

Main data type for analysis purposes


```r
head(iris)
```

```
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
```

Subseting
========================================================

Three possible options:

* `[` - returns same class, as original. Multiple selection possible.
* `[[` - extracts single element of a list (or data.frame).
* `$` - almost same as `[[` - used to extract single element by name.

Slicing [...]
========================================================


```r
v <- c(1,2,3,4,5,6,7)
```

Numerical or logical index could be used.


```r
v[3:5]
```

```
[1] 3 4 5
```

```r
v[v < 4]
```

```
[1] 1 2 3
```

Logical vectors
========================================================

Extremly useful


```r
v < 4
```

```
[1]  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
```

Complex logical structures could be used


```r
& - AND
| - OR
! - NOT
== - EQUAL TO
```

Slicing multidimensional objects
========================================================


```r
x <- matrix(1:6, 2, 3)
x
```

```
     [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6
```

```r
x[2, 2]
```

```
[1] 4
```

```r
x[, 3]
```

```
[1] 5 6
```

Subsetting lists
========================================================


```r
x <- list(var1 = 1:10, var2 = FALSE)
x[1]
```

```
$var1
 [1]  1  2  3  4  5  6  7  8  9 10
```

```r
x[[1]]
```

```
 [1]  1  2  3  4  5  6  7  8  9 10
```

```r
x$var1
```

```
 [1]  1  2  3  4  5  6  7  8  9 10
```

Removing NA's
========================================================


```r
x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
x[!bad]
```

```
[1] 1 2 4 5
```

```r
x[!is.na(x)]
```

```
[1] 1 2 4 5
```

Look also on `complete.cases()` function

```r
complete.cases(airquality)
```


Vectorized operations
========================================================

Operations executed in parallel


```r
x <- 1:10
y <- 6:15
x + y
```

```
 [1]  7  9 11 13 15 17 19 21 23 25
```

```r
x / y
```

```
 [1] 0.1666667 0.2857143 0.3750000 0.4444444 0.5000000 0.5454545 0.5833333
 [8] 0.6153846 0.6428571 0.6666667
```

Code become easier

Reading and writing data
========================================================

* `read.table` / `read.csv` - reading tabular data
* `readLines` - reading any character data
* `source` - reading .R code files

?read.table
========================================================

* `file` - filename
* `header` - T/F
* `sep` - column separator
* `quote` - quote sign
* `dec` - decimal sign
...

Aliases: read.csv, read.csv2, read.delim, read.delim2

Example
========================================================


```r
setwd('~/Documents/RCourse')
readLines('g_analytics.csv', n=10)
```

```
 [1] "# ----------------------------------------"
 [2] "# All Web Site Data"                       
 [3] "# Audience Overview"                       
 [4] "# 20150320-20150419"                       
 [5] "# ----------------------------------------"
 [6] ""                                          
 [7] "Day Index,Sessions"                        
 [8] "3/20/15,0"                                 
 [9] "3/21/15,0"                                 
[10] "3/22/15,0"                                 
```

```r
df <- read.csv('g_analytics.csv', header=T, skip=6)
```

Example
========================================================


```r
tail(df, 3)
```

```
   Day.Index Sessions
30   4/18/15     2212
31   4/19/15     1612
32              54314
```

```r
df <- df[complete.cases(df), ]
df$date <- as.Date(df$Day.Index, format='%m/%d/%y')
df[df$date > as.Date('2015-04-15'),]
```

```
   Day.Index Sessions       date
28   4/16/15     8863 2015-04-16
29   4/17/15     5262 2015-04-17
30   4/18/15     2212 2015-04-18
31   4/19/15     1612 2015-04-19
NA      <NA>       NA       <NA>
```

Homework
========================================================
Go to https://github.com/Sobach/RCourse

File `vkontakte_group.csv` - is an export stats file from our VK community.

1. Use `readLines()` to understand, what separators and quotes are used.
2. Use right `read.table` option to read file.
3. Use `as.Date` function to recode date object.
4. Slice data.frame to march only data.
5. Compute overall number of visitors and views during march (`?sum`).

Homework
========================================================

## Extra: 

1. Compute female/male ratio for march visitors.
2. What age group is most active?
