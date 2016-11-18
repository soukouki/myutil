# encoding: UTF-8

commit_msg = `git log -1 --pretty=format:"%s"`.to_i
puts `git add . && git commit -m #{commit_msg+1}`
