# myutil
pathの通ったところに置くことを前提としています。

基本的に例外処理はしていません。
バグだらけかと思います。
基本自分の環境で動けばいいと言う形なので、環境依存が激しいです。

- atom.ps1
	- atomを使うときのやつ
- die.rb
	- ダイス表記の期待値を求める
	- `$ "2d3+1"|die #=>5.0`
	- `$ die "2d3+1" #=>5.0`
- gs.cmd
	- gitコマンドを使えるpowershellを起動
	- 第一引数のとこにcdします
- migawari.ps1
	- フリーズとかするやつのテスト用
- myscalc.cmd
	- myscalcの起動用
- narou-voice-reader.rb
	- 前準備
		- `softalk.rb`が必要
	- なろうを読み上げる。詳しくは`narou-voice-reader -h`で
- next-commit.rb
	- 次の数字でコミットする
- nw.ps1
	- コマンドプロンプトを立ち上げて引数のコマンドを実行し、数秒後に閉じる
- rise.mp3
	- rise.ps1参照
- rise.ps1
	- 音量を25%まであげて、rise.mp3を鳴らす
	- **音量注意**
- rr.rb
	- 自作のreplです
	- ちゃんとローカル変数にも対応してます
- sign.mid
	- sign.ps1参照
- sign.ps1
	- コマンドを実行して、sign.midを鳴らす
- softalk.cmd
	- softalk.rbに引数を渡すだけ
- softalk.rb
	- 前準備
		- このフォルダにsoftalkの実行ファイルを含めた`softalk`ディレクトリを置く
	- `$ softalk "こんにちは\\nこんばんは"`だいたいこんな感じ。 
- st.cmd
	- `git status`
- stopwatch.rb
	- 実行してみたらわかる。止め方はctrl+c
- symlink.ps1
	- 第一引数にファイル名、第二引数にパスでシンボリックリンクを作る
