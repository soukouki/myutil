
# いつか、`2d6/2`や`1d3*3`に対応する
	# memo:`dist.length`の部分とか全部改修が必要
def calc s
	x, y, z = s
		.match(/(\d+)d(\d+)((?:\+|-)\d+)?/)
		.captures
		.map(&:to_i)
	
	puts "#{x}d#{y}#{(z.negative?)? z : "+#{z}"}"
	
	# このアルゴリズムの場合、分布の解析に時間がかかりすぎるため、分布の計算をスキップする。
	if (y**x)<1000_0000
		dist = (1..y).to_a
			.repeated_permutation(x)
			.map{|arr|arr.inject(:+)}
			.inject({}){|hash, n|hash[n] = (hash[n]||0)+1; hash}
		
		non_z_mean = (y+1)*x/2.0
		patterns_count = dist.values.inject(:+)
		
		puts dist.map{|key, value|"#{(key+z).to_s.rjust((dist.length+x+z-1).to_s.length)}:#{"%5.2f" % (value.to_f/patterns_count*100)}%"}
		puts "standard deviation:#{((dist.map{|key, count|((key-non_z_mean)**2)*count}.inject(:+)/patterns_count)**0.5).round(2)}"
	end
	
	mean = ((y+1)*x/2.0)+z
	
	puts "mean:#{mean}"
	puts "max :#{x*y+z}"
	puts "min :#{x+z}"
end

if ARGV[0].nil?
	calc(gets)
else
	ARGV.each{|s|calc(s)}
end
