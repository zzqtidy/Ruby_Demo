#!/usr/bin/ruby -w
#_*_ coding:utf-8 _*_

#第11章 块
#块就是在调用方法的时候，能够与参数一起传递的多个处理的集合
#块的调用方式有以下两种形式
#11.2.3 替换部分算法
# a <=> b 的结果
# a < b 时 -1（ 比 0 小）
# a == b 时 0
# a > b 时 1（ 比 0 大）
array = ["ruby", "Perl", "PHP", "Python"]
sorted = array.sort{ |a, b| a <=> b }#按照字符排序
sorted01 = array.sort#直接调用方法按照字符排序
sorted02 = array.sort{|a,b| a.length<=>b.length}
puts sorted.to_s
puts sorted01.to_s
puts sorted02.to_s


ary = %w(
Ruby is a open source programming language with a focus
on simplicity and productivity. It has an elegant syntax
that is natural to read and easy to write
) #将字符串转化成数组

call_num = 0 # 块的调用次数
sorted = ary.sort do |a, b|
	call_num += 1 # 累加块的调用次数
	a.length <=> b.length
end
puts "排序结果 #{sorted}"
puts "数组的元素数量 #{ary.length}"
puts "调用块的次数 #{call_num}"

#使用 sort_by 方法会使排序更加有效率
sorted01 = ary.sort_by{ |item| item.length }
puts "排序结果 #{sorted01}"
puts "数组的元素数量 #{ary.length}"


#11.3定义带块的方法
#yield中传递一个参数
def total(from,to)
	result=0 #合计
	from.upto(to) do |num|
		if block_given? #如果有块的话
			result+=yield(num) #yield中接收一个参数
		else
			result+=num
		end
	end
	return result
end

puts "不调用块1..10合计：#{total(1,10)}"
puts "调用块1..10合计：#{total(1,10){|num| num**2}}" #1的二次方到10的二次方的和，块中和yield中对应，传递一个参数

#yield中传递多个参数，块变量比较多时， 多出来的块变量值为 nil， 而块变量不足时， 则不能接收参数值。
def block_args_test
	yield() # 0 个块变量
	yield(1) # 1 个块变量
	yield(1,2) # 2 个块变量
	yield(1, 2, 3) # 3 个块变量
end
puts "通过|a| 接收块变量"
block_args_test do |a|
	p [a]
end
puts
puts "通过|a, b, c| 接收块变量"
block_args_test do |a, b, c|
	p [a, b, c]
end
puts
puts "通过|*a| 接收块变量"
#通过 |*a| 接收的情况是将所有块变量整合为一个数组来接收。 这与定义方法时接收可变参数的情况非常相似
block_args_test do |*a|
	p [a]
end
puts

hash = {a: 100, b: 200, c: 300}
hash.each_with_index do |(key, value), index|
	p [key, value, index]
end


n = total(1, 10) do |num|
	if num % 2 != 0
		#如果在块中使用 redo， 程序就会返回到块的开头， 并按照相同的块变量再次执行处理。 
		#这种情况下， 块的处理结果不会返回给外部， 因此需要十分小心 redo 的用法， 注意不要使程序陷入死循环。
		next 0
	end
	puts "参与计算的值为：#{num}"
	num
end
puts "总计：#{n}" #=> 30


#在接收块的方法中执行块时， 可以使用 yield 关键字。
#而 Ruby还能把块当作对象处理。把块当作对象处理后，就可以在接收块的方法之外的其他地方执行块，或者把块交给其他方法执行。
#这种情况下需要用到 Proc 对象。 Proc 对象是能让块作为对象在程序中使用的类。 定义 Proc 对象的典型的方法是， 调用 Proc.new 方法这个带块的方法。
#在调用 Proc 对象的 call 方法之前， 块中定义的程序不会被执行。
hello = Proc.new do |name|
	puts "Hello, #{name}."
end
hello.call("World")

#把块从一个方法传给另一个方法时， 首先会通过变量将块作为 Proc 对象接收， 然后再传给另一个方法。 
#在方法定义时，如果末尾的参数使用“& 参数名”的形式，Ruby 就会自动把调用方法时传进来的块封装为 Proc 对象。
def total02(from,to,&block)
	result=0
	from.upto(to) do |num|
		if block
			result+=block.call(num) #Proc执行块的形式是block.call(num)，不是之前的yield
		else
			result+=num
		end
	end
	return result
end

puts "Proc 对象调用（无Block）：#{total02(1,10)}"
puts "Proc 对象调用（有Block）：#{total02(1,10){|num| num**2}}"

#将 Proc 对象作为块传给其他方法处理，只需在调用方法时， 用“&Proc 对象”的形式定义参数就可以了
#
def call_each(ary, &block)
	ary.each(&block)
end

arr=[1, 2, 3]
call_each(arr)  do |item| #也可以写成call_each [1, 2, 3] do |item|
	p item**2
end