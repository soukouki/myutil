
begin
	start = Time.now
	count = 0
	loop do
		puts count
		sleep 1
		count += 1
	end
rescue  Interrupt
	puts Time.now-start
end