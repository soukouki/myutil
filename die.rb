
x, y, z = gets
	.chomp
	.match(/(\d+)d(\d+)((\+|-)\d+|)/)
	.captures
	.take(3)
	.map{|a|(a!="")? a.to_i : 0}

puts [0.0, *(1..y)].inject(&:+)/y*x+z
