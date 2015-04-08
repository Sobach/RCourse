R iRL 2
========================================================
author: Alexander Tolmach
date: April 2015

## Data types

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
[1] 16532
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

Indexed by double brackets. Every list element is a vector (often of length 1)

Data.frame
========================================================

List of vectors: used to store tabular data

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
