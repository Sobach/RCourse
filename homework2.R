# -*- coding: utf-8 -*-
setwd('~/Documents/RCourse')

# 1. Load VK dataset, recode Data column as dates, select only march records.
readLines('vkontakte_group.csv', 3)
df <- read.csv('vkontakte_group.csv', header=T)
head(df)
df$Date <- as.Date(df$Date, format='%d.%m.%Y')
df <- df[df$Date>=as.Date('2015-03-01') & df$Date<as.Date('2015-04-01'), ]

# 2. Select only visitors data (you can create new data.frame for it).
visitors <- df[df$Criterion=='visitors', ]

# 3. Use `weekdays()` function to create new variable, based on data - weekday factor variable.
visitors$Weekday <- weekdays(visitors$Date)

# 4. Using `aggregate()` calculate average number of visitors during different weekdays.
result <- aggregate(visitors$Value, by=list(visitors$Weekday), mean)
result

# Starred task: appsflyer average from install to event time
readLines('com_kms_free.csv', 3)
df <- read.csv('com_kms_free.csv')
df <- df[, c('Install.Time', 'Event.Time', 'Event.Name')]
head(df)
df$Install.Time <- as.POSIXlt(df$Install.Time, format='%Y-%m-%d %T')
df$Event.Time <- as.POSIXlt(df$Event.Time, format='%Y-%m-%d %T')
df$Time.Diff <- df$Event.Time - df$Install.Time
result <- aggregate(df$Time.Diff, by=list(df$Event.Name), median)
result <- result[order(result$x), ]
result


library(knitr)
kable(result, format='markdown')
