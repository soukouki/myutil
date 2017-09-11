require "open-uri"

def get_text uri, cookie
	str = open(uri, {"Cookie"=>cookie}).readlines.join("").force_encoding("UTF-8")
	"サブタイトル:"+str.match(/<p class="novel_subtitle">(.*?)<\/p>/)[1]+"\n"+
	(str.match(/<div id="novel_honbun" class="novel_view">(.*?)<\/div>/m)[1]
		.gsub(/(<br \/>|\n)+/){"\n"})
end

if(ARGV[0]=="-h" || ARGV[0].nil?)
	puts "narou-voice-reader [ncode] [start(int)] [domain(||ncode.syosetu.com)] [cookie(sample:over18=yes;bbb=def)]"
else
	ncode = ARGV[0]
	start = ARGV[1].to_i
	domain = ARGV[2]||"ncode.syosetu.com"
	cookie = ARGV[3]||""
	loop do
		puts uri = "http://#{domain}/#{ncode}/#{start}/"
		str = get_text(uri, cookie)
		loop do
			# コマンドラインの文字数制限が8192文字のため、5000文字+次の改行までで区切って実行する。
			# もちろん8192文字以上改行のない文章だと動かないが、そのような文章が来てから考える。
			piece_str = (str.length>5000)? str.match(/((.|\n){5000}.*?\n)/)[1] : str
			str = str[piece_str.length..-1]
			`softalk "#{piece_str.gsub("\n"){"\\n"}}"`
			break if str.length==0
		end
		puts str
		puts "push enter."
		STDIN.gets
		start += 1
	end
end
