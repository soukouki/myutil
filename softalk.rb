
# 実行する際は、改行を`\\n`にすること
`start #{File.expand_path(File.dirname(__FILE__))}/softalk/softalk.exe "/W:#{ARGV[0].dup.force_encoding("cp932").gsub("\\n"){"。".encode("cp932")}}"`
