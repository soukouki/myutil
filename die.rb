
def calc s
	x, y, z = s
		.match(/(\d+)d(\d+)((?:\+|-)\d+)?/)
		.captures
		.map(&:to_i)
	
	mean = ((y+1)*x/2.0)+z
	
	puts "mean:#{mean}"
	puts "max :#{x*y+z}"
	puts "min :#{x+z}"
	
	return if (y**x)>1000_0000 # このアルゴリズムの場合解析に時間がかかりすぎるため、標準偏差の計算をスキップする。
	
	dist = (1..y).to_a
		.repeated_permutation(x)
		.map{|arr|arr.inject(:+)}
		.inject({}){|hash, n|hash[n] = (hash[n]||0)+1; hash}
	
	puts "standard deviation:#{dist.map{|key, count|((key-mean)**2)*count}.inject(:+)**0.5}"
end

if ARGV[0].nil?
	calc(gets)
else
	ARGV.each{|s|calc(s)}
end
