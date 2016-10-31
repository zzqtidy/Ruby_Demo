#!usr/bin/ruby -w
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
outcome.each{|p| puts "#{p[0]}=#{p[1]}"}

#File文件读取数据

file=File.open("../readme.txt")
file.each_line{|line| puts "读取一行数据：#{line}"}
file.close