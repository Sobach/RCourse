R iRL 3
========================================================
author: Alexander Tolmach
date: May 2015

## Data aggregating and reshaping

Homework answers
========================================================
incremental:true

1. Visitors:

   **13 614**
2. Views: 

  **27 303**
3. Female/Male Ratio: 

   **0.25**
4. Most active agegroup: 

   **21-24**

Homework-1
========================================================


```r
setwd('~/Documents/RCourse')
readLines('vkontakte_group.csv', n=3)
```

```
[1] "\"Date\",\"Criterion\",\"Parameter 1\",\"Parameter 2\",\"Value\""
[2] "\"15.04.2015\",\"views\",\"\",\"\",996"                          
[3] "\"15.04.2015\",\"visitors\",\"\",\"\",494"                       
```

Homework-2
========================================================


```r
df <- read.csv('vkontakte_group.csv', header=T)
head(df)
```

```
        Date Criterion Parameter.1 Parameter.2 Value
1 15.04.2015     views                           996
2 15.04.2015  visitors                           494
3 15.04.2015    gender           F               106
4 15.04.2015    gender           M               300
5 15.04.2015       age        1-18                34
6 15.04.2015       age       18-21                73
```

Homework-3,4
========================================================


```r
df$Date <- as.Date(df$Date, format='%d.%m.%Y')
df <- df[df$Date >= as.Date('2015-03-01') & df$Date <= as.Date('2015-03-31'), ]
summary(df$Date)
```

```
        Min.      1st Qu.       Median         Mean      3rd Qu. 
"2015-03-01" "2015-03-08" "2015-03-16" "2015-03-15" "2015-03-24" 
        Max. 
"2015-03-31" 
```

Homework-5
========================================================


```r
sum(df$Value[df$Criterion=='visitors'])
```

```
[1] 13614
```

```r
sum(df$Value[df$Criterion=='views'])
```

```
[1] 27303
```

Homework-extra-1
========================================================


```r
female <- sum(df$Value[df$Criterion=='gender' & df$Parameter.1 == 'F'])
female
```

```
[1] 2115
```

```r
male <- sum(df$Value[df$Criterion=='gender' & df$Parameter.1 == 'M'])
male
```

```
[1] 8441
```

```r
female/male
```

```
[1] 0.2505627
```

Homework-extra-2
========================================================


```r
age <- df[df$Criterion == 'age', ]
age.aggr <- aggregate(age$Value, by=list(age$Parameter.1), FUN='sum')
age.aggr[order(age.aggr$x, decreasing=TRUE), ]
```

```
  Group.1    x
3   21-24 1499
2   18-21 1469
4   24-27 1449
1    1-18 1291
5   27-30 1188
6   30-35 1017
7   35-45  927
8     45+  734
```

Aggregating
========================================================

Let's start with homework-extra-2: we have already loaded dataframe, selected filtered it to march-only dates. Let's select age-only variables to separate data.frame. 

```r
age <- df[df$Criterion == 'age', c('Date', 'Parameter.1', 'Value')]
head(age, 3)
```

```
           Date Parameter.1 Value
1251 2015-03-31        1-18    33
1252 2015-03-31       18-21    44
1253 2015-03-31       21-24    49
```

Aggregating
========================================================

Now I need to summarize one variable according to another.

Long story: we can split our dataframe into groups


```r
ages.list <- split(age$Value, factor(as.character(age$Parameter.1)))
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

Aggregating
========================================================

Fast story: specify parameter, you want to aggregate, specify index variable, and a function

* Parameter: `df$Value`
* Index var: `df$Parameter.1`
* Function: `sum()`


```r
aggregate(age$Value, by=list(age$Parameter.1), FUN='sum')
```

```
  Group.1    x
1    1-18 1291
2   18-21 1469
3   21-24 1499
4   24-27 1449
5   27-30 1188
6   30-35 1017
7   35-45  927
8     45+  734
```

Homework
========================================================

1. Load VK dataset, recode Data column as dates, select only march records.
2. Select only visitors data (you can create new data.frame for it).
3. Use `weekdays()` function to create new variable, based on data - weekday factor variable.
4. Using `aggregate()` calculate average number of visitors during different weekdays.
