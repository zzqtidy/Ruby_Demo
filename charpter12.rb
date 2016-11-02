#!/usr/bin/ruby -w
#_*_ coding:utf-8 _*_

#Ruby 也可以处理有理数和复数。 表示有理数用 Rational 类， 表示复数用 Complex 类。
#
#Rational 对象用“Rational( 分子 , 分母 )”的形式定义

a=Rational(1,4) #代表1/4
b=Rational(2,5) #代表1/4
c=a+b
puts "分数：c=#{c}"
puts "小数：c=#{c.to_f}"
puts
#Complex 对象用“Complex( 实数 , 虚数 )”的形式定义。 以下是计算复数 2i 的 2 次幂的例子：
c = Complex(0, 2) ** 2
puts "复数 2i 的 2 次幂:#{c}" #=> (-4+0i)

#除法
#除了 / 和 % 以外， 数值对象中还有一些与除法相关的方法。
#x.div(y)
#返回 x 除以 y 后的商的整数。
p 5.div(2) #=> 2
p 5.div(2.2) #=> 2

#x.quo(y)
#返回 x 除以 y 后的商， 如果 x、 y 都是整数则返回 Rational 对象。
p 5.quo(2) #=> (5/2)
p 5.quo(2.2) #=> 2.2727272727272725

#x.modulo(y)
#与 x % y 等价。
#x.divmod(y)
#将 x 除以 y 后的商和余数作为数组返回。 商是将 x / y 的结果去掉小数点后的部分而得到的值。 余数的符号与 y 的符号一致， 余数的值为 x % y 的结果。
#假设有运算式如下，
#ans = x.divmod(y)
#这时， 下面的等式是成立的。
#x == ans[0] * y + ans[1]
p 10.divmod(3.5) #=> [2, 3.0]
p 10.divmod(-3.5) #=> [-3, -0.5]

#x.remainder(y)
#返回 x 除以 y 的余数， 结果的符号与 x 的符号一致。
p 10.remainder(3.5) #=> 3.0
p 10.remainder(-3.5) #=> 3.0

#另外， 除数为 0 时， Integer 类会返回错误， 而 Float 类则会返回 Infinity（ 无限大） 或者 NaN（ Not a Number） 。 如果再用这两个值进行运算， 那
#么结果只会返回 Infinity 或者 NaN。 程序把输入的数据直接用于运算的时候， 除数有可能会为 0， 我们应当注意避免这样的情况发生。
#p 1 / 0 #=> 错误（ ZeroDivisionError）
p 1 / 0.0 #=> Infinity
p 0 / 0.0 #=> NaN

#我们还可以将数值转换为 Rational 对象和 Complex 对象， 分别使用 to_r 和 to_c 方法， 如下所示。
p 1.5.to_r #=> (3/2)
p 1.5.to_c #=> (1.5+0i)

#随机数
p Random.rand #=> 0.13520495197709
p Random.rand(100) #=> 31
p Random.rand(100) #=> 84

#程序不能生成真正的随机数， 只能通过某种算法生成看起来像随机数的值， 这样的随机数称为模拟随机数。 生成模拟随机数需要以某个值为基础， 这个值称
#为随机数的种子。 模拟随机数终究只是通过计算得到的数值， 只要随机数的种子一样， 那么得到值就有可能重复出现。 使用 Random.new 方法初始化随机数
#生成器， 然后再使用 Random#rand 方法， 就可以对 Random 对象指定随机数种子， 从而生成随机数。
r1 = Random.new(1) # 初始化随机数组
p [r1.rand, r1.rand]
#=> [0.417022004702574, 0.7203244934421581]
r2 = Random.new(1) # 再次初始化随机数组
p [r2.rand, r2.rand]
#=> [0.417022003702574, 0.7203244934421581]
#
#Random.new 方法不指定参数的情况下， 则会用随机生成的随机数种子初始化 Random 对象， 因此每次得到的随机数组也会不一样。
r1 = Random.new
p [r1.rand, r1.rand]
#=> [0.49452535392946817, 0.34141702823098863]
r2 = Random.new
p [r2.rand, r2.rand]
#=> [0.9464262066747281, 0.01911968591048996]

#近似值误差
a=0.1+0.2
b=0.3
puts a==b
puts a<=>b
puts "a>b" if a<=>b
