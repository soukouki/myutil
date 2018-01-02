
line = 1
i = nil
bin = binding
loop{
	print "> "
	i = gets.chomp
	break if i=="\x04"
	begin
		puts eval(i, bin, "(repl)", line)
	rescue StandardError, LoadError => e
		puts e.class
		puts e
	end
	line += 1
}
