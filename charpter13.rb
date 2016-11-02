#!/usr/bin/ruby -w
#_*_ coding:utf-8 _*_
# 第13章 数组类

#数组
#数组两种普遍的创建方式
arr1=['张三','李四',123]
puts arr1

arr2 = Array.new #默认0个值
arr3 = Array.new(5)#默认5个值，每个值为nil
arr4 = Array.new(5,1)#默认5个值，每个值为1

#另外%w可以将字符串转成字符串数组，可以省略引号
arr5 = %w(my name is zzq)
puts arr5.to_s

#2.0之后利用%i可以将字符串转化成symbol（符号）数组
arr6 = %i(my name is lili)
puts arr6.to_s