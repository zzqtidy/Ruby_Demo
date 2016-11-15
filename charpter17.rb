#!/usr/bin/ruby -w
#_*_ coding:utf-8 _*_
#将输出结果重定向到文件时， 标准输出的内容会被写入到文件， 只有标准错误输出的内容被 输出到屏幕中
$stdout.print "这是标准输出，如果重定向到文件会写入文件中" # 标准输出
$stderr.print "这是标准错误输出，如果重定向到文件不会写入文件中"# 标准错误输出
puts
#17.1.2 文件输入 / 输出
#文件打开后需要关闭，如果使用块，则文件会在使用完成之后自动关闭。此时IO对象会被当作块变量传递给块，块执行完毕之后，块变量引用的IO对象也会自动关闭。
File.open("readme.txt", "r") do |io|
	while line=io.gets
		puts "#{line}"
	end
end

puts "不含块的IO访问文件："
io=File.open("readme.txt", "r")
while line=io.gets
	puts "第#{io.lineno}行,#{line}"
end
if !io.closed?
	puts "文件是否关闭：#{io.closed?}"
	io.close
end
puts "文件是否关闭：#{io.closed?}"
puts "使用类方法 read 可以一次性读取文件 file 的内容,在 Windows 中不能使用 File.read 方法读取像图像数据等二进制数据。 
File.read 方法使用文本模式打开文件时， 会对换行符等进行转换， 因此无法得到正确的结果。"
data = File.read("readme.txt")
puts data
puts "使用each_line:"
io2=File.open("readme.txt", "r")
io2.each_line do |l|
	puts l
end
if !io2.closed?
	puts "文件是否关闭：#{io2.closed?}"
	io2.close
end
puts "文件是否关闭：#{io2.closed?}"

puts "readlines 方法可以一次性地读取所有数据， 并返回将每行数据作为元素封装的数组"
io3=File.open("readme.txt", "r")
arr=io3.readlines
puts "删除换行符之前的散列：#{arr}"
arr.each do |l3|
	l3.chomp! #用 chmop! 方法可以很方便地删除字符串末尾的换行符
	puts l3
end
puts "删除换行符之后的散列：#{arr}"
if !io3.closed?
	puts "文件是否关闭：#{io3.closed?}"
	io3.close
end
puts "文件是否关闭：#{io3.closed?}"

#io.read(sized)读取指定大小的数据
io4=File.open("readme.txt","r")
r_count=10
puts "读取#{r_count}个字符：#{io4.read(r_count)}"
if !io4.closed?
	puts "文件是否关闭：#{io4.closed?}"
	io4.close
end
puts "文件是否关闭：#{io4.closed?}"

#-----------17.3 文件指针----------
#通过 pos 方法可以获得文件指针现在的位置。 改变文件指针的位置用 pos= 方法
File.open("readme.txt") do |l5|
	puts "1读取数据 #{l5.read(5)}"
	puts "当前指针 #{l5.pos}"
	puts "2读取数据 #{l5.read(5)}"
	l5.pos=0 #重置指针位置
	puts "3读取数据 #{l5.read(5)}"
end

#io.seek(offset, whence)
#IO::SEEK_SET 将文件指针移动到 *offset* 指定的位置
#IO::SEEK_CUR 将 *offset* 视为相对于当前位置的偏移位置来移动文件指针
#IO::SEEK_END 将 *offset* 指定为相对于文件末尾的偏移位置
puts "----------------------------------------------"
File.open("readme.txt") do |l6|
	puts "1读取数据 #{l6.read(5)}"
	puts "当前指针 #{l6.pos}"
	puts "2读取数据 #{l6.read(5)}"
	# l6.seek(1,IO::SEEK_SET)
	l6.seek(1,IO::SEEK_CUR)
	# l6.seek(1,IO::SEEK_END)
	puts "3读取数据 #{l6.read(5)}"
end

puts "----------------------------------------------"
#io.rewind将文件指针返回到文件的开头。 lineno 方法返回的行编号为 0。

File.open("readme.txt") do |l6|
	puts "1读取数据 #{l6.read(5)}"
	puts "当前指针 #{l6.pos}"
	puts "2读取数据 #{l6.read(5)}"
	l6.rewind
	puts "3读取数据 #{l6.read(5)}"
end
puts "----------------------------------------------"
#io.truncate(size)按照参数 size 指定的大小截断文件。

# io6=File.open("readme.txt")
# io6.truncate(0)
# io6.close


#open-uri
require "open-uri"
# 通过HTTP 读取数据
open("http://www.ruby-lang.org") do |io|
puts io.read # 将Ruby 的官方网页输出到控制台
end
# 通过FTP 读取数据
# url = "ftp://www.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz"
# open(url) do |io|
# open("ruby-2.0.0-p0.tar.gz", "w") do |f| # 打开本地文件
# f.write(io.read)
# end
# end

#通过 HTTP 协议时， 服务器会根据客户端的状态改变应答的内容， 比如返回中文或英语的网页等。 为了实现这个功能， 请求时就需要向服务器发送元信息
#（ meta information） 。 例如， 代码清单 17.10 中的 HTTP 头部信息 Accept-Language 就表示优先接收中文网页。 指定 HTTP 头部信息时， 会将其以散列的
#形式传递给 open 方法的第 2 个参数。
options = {
"Accept-Language" => "zh-cn, en;q=0.5",
} 
open("http://www.ruby-lang.org", options){|io|
puts io.read
}