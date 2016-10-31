#!/usr/bin/ruby -w
#_*_ coding:utf-8 _*_

#
# 第二章练习：便利的对象

#2.1 数组 --创建用[]
#语法：[var1,var2,var3……]
name=["zhang san","li si"]
name.each do |e|
	puts "name is #{e}"
end
name[0]="wang wu"
puts puts "name[0] is #{name[0]}"
#数组可以动态添加，不必指定长度
name[2]="zhao liu"
name.each do |e|
	puts "name is #{e}"
end	
#数组可以支持不同类型的元素
dif_var=[1,"name",0.902]
puts "数组dif_var的大小为：#{name.size}"
dif_var.each do |e|
	puts "var is #{e}"
end

#2.2 散列 --创建用{},key和value之间用=>连接，各对key=>value之间用逗号隔开
# 语法1：{key1=>value1,key2=>value2,……}  通用写法
# 语法2：{key1:value1,key2:value2……}     当key为symbol的时候 
#散列（Hash）是提供键值对的一种数据结构，ruby中，一般是用字符串或者符号作为key

#符号（symbol），创建符号，只需要在标识符前面加上：就可以了，符号和字符串用来表示文本的
#1、但是，相同的符号是同一个对象，而相同的字符串不是一个对象
#2、处理符号比处理字符串，可以占用更少的资源
#3、符号和字符串之间可以互换（通过to_sym和to_s）

puts "aa符号转换成字符串：#{:aa.to_s}"
puts "aa字符串转换成符号：#{"aa".to_sym}"

#由于散列中key值只需要判断key的值是否相等，所以用符号效率户更好
#用符号创建散列
address={:name=>"张三",:pingyin=>"zhang san",:postal=>"123456"}
#当用符号作为key时，还可以按照下面的方式来写，但是访问的时候key必须为symbol的正确格式
address1={name:"张三",pingyin:"zhang san",postal:"123456"}
puts address[:name]
puts address1[:pingyin]

#散列循环

address1.each do |key,value|
	puts "key=#{key},value=#{value}"
end

#2.3正则表达式
#在Ruby中，正则表达式可以很方便进行字符串的处理。
#
#
#
str1="RUBY"
str2="RUBY"

class<<str1
	def hello
		p "hell0,#{self}"
	end
end

str1.hello


class String
	def hello
		p "hell0,#{self}"
	end 
end

str3="ruby"
str3.hello

puts FileTest.exist?("E:/Ruby")
puts FileTest.size("E:/Ruby")


#include 可以帮助我们突破继承的限制， 通过模块扩展类的功能； 而 extend 则可以帮助我们跨过类， 直接通过模块扩展对象的功能。
#也就是说，如果是类，用include包含模块，如果是对象，则用extend来扩展对象的功能
module HelloModule
	Version="1.0"
	def hello(name)
		p "hello,#{name}"
	end
	#指定hello方法为模块函数，如果没有这一句，后面不能以模块名.方法名的形式调用，只能在模块内部和包含模块的上下文中调用。
	#如果要将方法公开给模块外部使用，那么需要为方法加上module_function:
	module_function:hello 
end
p HelloModule::Version
HelloModule.hello("zzq")

include HelloModule #Mix-in 方式将模块中方法和常量引用进来
hello("fff") #如果没有定义与模块方法相同的函数和常量，可以省略模块名
p Version

module Editon
	def edtion(n)
		"#{self}版本#{n}"
	end
end

str4="Ruby 基础教程"
str4.extend(Editon)
puts str4.edtion(2.1)

#extend可以为类追加类方法，而include可以为方法追加实例方法
module ClassMethods
	def cmethod
		p "class method"
	end
end

module InstanceMethods
	def imethod
		p "instance method"
	end
end

class Myclass
	#使用extend定义类方法
	extend ClassMethods
	#使用include定义实例方法
	include InstanceMethods	
end

Myclass.cmethod #调用类方法
Myclass.new.imethod #调用实例方法
puts "Myclass是否 include?(InstanceMethods):",Myclass.include?(InstanceMethods)
p "Myclass include?(ClassMethods):",Myclass.include?(ClassMethods)


#网络编程的简单应用
require "net/http"
require "uri"

url = URI.parse("http://www.ruby-lang.org/ja/")
p url.scheme
p url.host
p url.port
p url.path
p url.to_s
http = Net::HTTP.start(url.host,url.port)
doc = http.get(url.path)
puts "解析：",doc


#一些便利赋值写法

item = nil # 设定 item 的初始值
ary=['aaa',888]


if ary # ary 不是 nil 或者 false 时
	item = ary[0] # 将 ary[0] 赋值给 item
end

puts item

item=ary&&ary[1]#这一句是以上if语句的缩写，前提是item和ary提前被定义
puts item


#异常处理
n=Integer("sss")rescue 0 #rescue关键字，该段代码的意思是，把字符串转成数字，如果转换异常，则最终值为0
puts n


begin
	begin   #try
		str='fgggg'
		nn=Integer(str)
	rescue Exception => e  #catch
		puts e.message
		nn=0
		raise '字符串无法转换成数字'  #throw
		
	ensure #finally
		puts nn
	end
rescue Exception => e
	puts e.message
end


