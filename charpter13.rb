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

#使用to_a方法，如果是hash数组，那么会将将散列中的各键、 值作为一个数组， 然后再把这样的数组放到一个大数组中。
color_table = {black: "#000000", white: "#FFFFFF"}
puts color_table.to_a.to_s

#使用号或者空白间隔的字符串使用 split 方法， 也可以创建数组
column = "2013/05/30 22:33 foo.html proxy.example.jp"
puts column.split(" ").to_s
puts column.split().to_s

#集合中&，|，+，-，索引
a1=['a','b','c','f','i','j']
a2=['b','c','d']
puts "数组 & 运算符结果：#{a1&a2}" #得到两个数组中相同的项目
puts "数组 | 运算符结果：#{a1|a2}" #得到两个数组合并之后的结果，没有重复项
puts "数组 + 运算符结果：#{a1+a2}" #得到两个数组合并之后的结果，有重复项(形成新数组)
puts "数组 concat 结果：#{a1.concat(a2)}" #得到两个数组合并之后的结果，有重复项(破坏之前的数组)
puts "数组 - 运算符结果：#{a1-a2}" #去掉第一个数组在第二个数组中的相同元素
puts "数组a1[1,2] 获取：#{a1[1,2]}" #从第几个元素开始，一共获取几个
puts "数组a1[1..5] 获取：#{a1[1..5]}" #获取第一个到第五个
puts "数组a1.values_at(1,2,5) 获取：#{a1.values_at(1,2,5)}" #获取第1,2,5个元素a1.values_at(1,2)

#表 13.1 操作数组开头与末尾的元素的方法

puts"#              对数组开头的元素的操作             对数组末尾的元素的操作
#追加元素         unshift                                             push
#删除元素         shift                                                 pop
#引用元素         first                                                  last"

a3=[1,2,3,4,5,6]
puts "对数组进行FIFO（先进先出）和LIFO（先进后出）操作"
puts "a3原始值：#{a3}"
a3.unshift(0)
puts "a3.unshift(0)   #{a3}"
a3.push(7)
puts "a3.push(7)   #{a3}"

puts "a3.first()   ##{a3.first()}-----#{a3}"
puts "a3.pop()   #{a3.pop()}-----#{a3}"
puts "a3.push()  和 a3<<0  #{a3.push()}-----#{a3}  ------  #{a3<<0}"

#13.6.2 从数组中删除元素
puts "根据某些条件从数组中删除元素。a.compact   a.compact!
从数组 a 中删除所有 nil 元素。 compact 方法会返回新的数组， compact! 则直接替换原来的数组。 compact! 方法返回的是删除 nil 元素后的 a， 但是如果什么都没有删除的话就会返回 nil。"
a = [1, nil, 3, nil, nil]
a.compact!
p a #=> [1, 3]
puts "#a.delete(x) 从数组 a 中删除 x 元素。"
a = [1, 2, 3, 2, 1]
a.delete(2)
p a #=> [1, 3, 1]
puts "#a.delete_at(n) 从数组中删除 a[n] 元素。"
a = [1, 2, 3, 4, 5]
a.delete_at(2)
p a #=> [1, 2, 4, 5]
puts "#a.delete_if{|item| … }
#a.reject{|item| … }
#a.reject!{|item| … }
判断数组 a 中的各元素 item， 如果块的执行结果为真， 则从数组 a 中删除 item。 delete_if 和 reject! 方法都是具有破坏性的方法。"
a = [1, 2, 3, 4, 5]
a.delete_if{|i| i > 3}
p a #=> [1, 2, 3]
puts "#a.slice!(n)
#a.slice!(n..m)
#a.slice!(n, len)
删除数组 a 中指定的部分， 并返回删除部分的值。 slice! 是具有破坏性的方法。"
a = [1, 2, 3, 4, 5]
p a.slice!(1, 2) #=> [2, 3]
p a #=> [1, 4, 5]
puts "#a.uniq
#a.uniq!
删除数组 a 中重复的元素。 uniq! 是具有破坏性的方法。"
a = [1, 2, 3, 4, 3, 2, 1]
a.uniq!
p a #=> [1, 2, 3, 4]
puts "#a.shift删除数组 a 开头的元素， 并返回删除的值。"
a = [1, 2, 3, 4, 5]
a.shift #=> 1
p a #=> [2, 3, 4, 5]
puts "#a.pop删除数组 a 末尾的元素， 并返回删除的值。"
a = [1, 2, 3, 4, 5]
a.pop #=> 5
p a #=> [1, 2, 3, 4]
#13.6.3 替换数组元素
puts "将数组元素替换为别的元素的方法中， 也分为带 ! 的和不带 ! 的方法， 前者是具有破坏性的会改变接收者对象值的方法， 后者则是直接返回新数组的方法。
#a.collect{|item| … }
#a.collect!{|item| … }
#a.map{|item| … }
#a.map!{|item| … }
将数组 a 的各元素 item 传给块， 并用块处理过的结果创建新的数组。 从结果来看， 数组的元素个数虽然不变， 但由于经过了块处理， 因此数组的元素和之前会不一样。"
a = [1, 2, 3, 4, 5]
a.collect!{|item| item * 2}
p a #=> [2, 4, 6, 8, 10]
puts "#a.fill(value)
#a.fill(value, begin)
# a.fill(value, begin, len)
# a.fill(value, n..m)
将数组 a 的元素替换为 value。 参数为一个时， 数组 a 的所有元素值都会变为 value。 参数为两个时， 从 begin 到数组末尾的元素值都会变为 value。 
参数为三个时， 从 begin 开始 len 个元素的值会变为 value。 另外， 当第 2 个参数指定为 [n..m] 时， 则指定范围内的元素值都会变为 value。"
p [1, 2, 3, 4, 5].fill(0) #=> [0, 0, 0, 0 ,0]
p [1, 2, 3, 4, 5].fill(0, 2) #=> [1, 2, 0, 0, 0]
p [1, 2, 3, 4, 5].fill(0, 2, 2) #=> [1, 2, 0, 0, 5]
p [1, 2, 3, 4, 5].fill(0, 2..3) #=> [1, 2, 0, 0, 5]
puts "#a.flatten
#a.flatten!
#平坦化数组 a。 所谓平坦化是指展开嵌套数组， 使嵌套数组变为一个大数组。"
a = [1, [2, [3]], [4], 5]
a.flatten!
p a #=> [1, 2, 3, 4, 5]
puts "a.reverse
#a.reverse!
#反转数组 a 的元素顺序。"
a = [1, 2, 3, 4, 5]
a.reverse!
p a #=> [5, 4, 3, 2, 1]
puts "#a.sort
#a.sort!
#a.sort{|i, j| … }
#a.sort!{|i, j| … }
#对数组 a 进行排序。 排序方法可以由块指定。 没有块时， 使用 <=> 运算符比较。"
a = [2, 4, 3, 5, 1]
a.sort!
p a 
puts "#a.sort_by{|i| … }
#对数组 a 进行排序。 根据块的运行结果对数组的所有元素进行排序。"
a = [2, 4, 3, 5, 1]
p a.sort_by{|i| -i } #=> [5, 4, 3, 2, 1]


#数组循环
puts "方式1"
a=[1,2,3,4,5,6,7]
for i in 0..5 
	puts a[i]
end
puts "方式"
a.each do |e|
	puts e
end
puts "方式3"

a.each_with_index do |e,i|
	puts "[index=#{i},element=#{e}]"
end
ary1 = [1, 2, 3, 4, 5]
ary2 = [10, 20, 30, 40, 50]
ary3 = [100, 200, 300, 400, 500]
result = []
ary1.zip(ary2, ary3) do |a, b, c| #zip 方法会将接收器和参数传来的数组元素逐一取出， 而且每次都会启动块。 参数可以是一个也可以是多个。
	result << a + b + c
end
p result #=> [111, 222, 333, 444, 555]

ary1 = [1, 2, 3, 4, 5]
ary2 = [10, 20, 30, 40, 50]
ary3 = [100, 200, 300, 400, 500]
i = 0
result = []
while i<ary1.length
	result<<ary1[i]+ary2[i]+ary3[i]
	i+=1
end
p result #=> [111, 222, 333, 444, 555]