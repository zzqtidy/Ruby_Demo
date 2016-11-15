#!/usr/bin/ruby -w
#_*_ coding:utf-8 _*_
#第14章 字符串类
moji = "字符串"
str1 = "那也是#{moji}"
puts str1 #=> "那也是字符串"
str2 = ' 那也是#{moji}'
puts str2 #=> "那也是\#{moji}"
puts "#使用 %Q 相当于用 " " 创建字符串， 使用 %q 则相当于用 ' ' 创建字符串。"
desc = %Q{Ruby 的字符串中也可以使用'' 和""。 }
str = %q|Ruby said, 'Hello world!'|
puts desc,str
puts "#Here Document方式创建长字符串，<< 是主要的创建符号，有点类似C#中的@语法糖"
1.times do |i|
2.times do |j|
print(<<"EOB")
i: #{i},j: #{j},i+j = #{i+j}
EOB
end
end

print(a=<<"info") #也可以写成print(<<"info") 
章="111",里="gsgf"
info

puts (<<-"INFO") #加上一个“-”后面对应的INFO可以缩进，结束标识符就没有必要卸载表首了
章="111",里="gsgf"
	INFO

#使用`命令`可以调用linux或者windows的命令
puts "用`命令`查看当前版本号：",`ruby --version`

#虽然 printf 方法与 sprintf 方法都不是 String 类的方法， 但在处理字符串时会经常用到它们。
n = 123
printf("%d\n", n)
printf("%4d\n", n)
printf("%04d\n", n)

n = "Ruby"
printf("Hello,%s!\n", n)
printf("Hello,%8s!\n", n)
printf("Hello,%-8s!\n", n)

#字符串连接可以用+，concat，<<，但是+会生成新的字符串，而concat，<<则会改变原有对象，不会生成新的字符串
puts "hello,"+"world"
puts "hello,".concat("world")
puts "hello,"<<"world"

#chop 方法与 chop! 方法会删除字符串行末的任何字符， chomp 方法与 chomp! 方法则只在行末为换行符时才将其删除。
str = "abcde" # 没有换行符的情况
newstr = str.chop
p newstr #=> "abcd"
newstr = str.chomp
p newstr #=> "abcde"
str2 = "abcd\n" # 有换行符的情况
newstr = str2.chop
p newstr #=> "abcd"
newstr = str2.chomp
p newstr #=> "abcd"

#index正向指定查找字符串的起始位置，rindex则反向查找;include?是否包含
str=%"zhang san is good"
puts "index('san') = #{str.index("san")}"
puts "包含zhang?：#{str.include?("zhang")}"

p "ABCDE".tr("B", "b") #=> "AbCDE"
p "ABCDE".tr("A-E", "1-5") #=> "12345"

