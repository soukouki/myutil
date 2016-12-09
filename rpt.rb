
n_max = (ARGV[0]||"10").to_i

program = $stdin.gets.chomp

(1..n_max).each do |n|
	p [n, eval(program)]
end
