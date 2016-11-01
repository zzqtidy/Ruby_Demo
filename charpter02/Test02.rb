#!/usr/bin/ruby -w
#_*_ coding:utf-8 _*_


#第11章 块
#块就是在调用方法的时候，能够与参数一起传递的多个处理的集合
#块的调用方式有以下两种形式

[1,2,3,4,5].each do |e|
	puts "块的第一种调用方式：#{e}"
end

[1,2,3,4,5].each{|e| puts "块的第二种调用方式：#{e}"}
["Zhang San","Li Si","Wang Wu"].each_with_index{|obj,inx| puts "块的第二种调用方式：[#{inx},#{obj}]"}

#Hash循环
outcome={:参加费用=>1000,:挂件费用=>2000,:材料费用=>890}
outcome.each{|key,value| puts "key=#{key},value=#{value}"}

#hash还可以用一个参数（类似于数组的形式）来循环访问hash中的key和value
outcome.each{|p| puts "#{p[0]}=#{p[1]}"}

#File文件读取数据，each_line读取一行，另外还有each_char读取一个字符,each_byte读取一个字节。而其他对象中也有类似的each_xx的方法。
file=File.open("../readme.txt")
file.each_line{|line| puts "第一种形式读取一行数据,此方式操作完毕要关闭文件：#{line}"}
file.close

file1=File.open("../readme.txt")
file1.each_line do |line|
	puts "第二种形式读取文件中一行,此方式操作完毕要关闭文件：#{line}"
end
file1.close

File.open("../readme.txt") do |file2|
	file2.each_line do |line|
		puts "第三种形式读取文件中一行,此方式操作完毕不需要关闭文件：#{line}"
	end
end

file3=File.open("../readme.txt")
begin
	file3.each_line do |line|
		puts "第四种形式读取文件中一行,此方式操作完毕不需要关闭文件：#{line}"
	end
rescue Exception => e
	puts "读取文件异常:"+e.message
	file3.close
end

