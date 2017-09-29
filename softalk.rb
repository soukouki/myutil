
# 実行する際は、改行を`\\n`にすること

softalk_path = File.expand_path(File.dirname(__FILE__))+"/softalk/softalk.exe"

softalk_args =
	if ARGV[0].nil?
		""
	else
		text = ARGV[0].dup.force_encoding("cp932").gsub("\\n"){"。".encode("cp932")}
		"/W:"+text
	end

Thread.new{`start #{softalk_path} #{softalk_args}`}
