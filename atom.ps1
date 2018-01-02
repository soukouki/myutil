
$atom = (join-path $home "\AppData\Local\atom\bin\atom.cmd")

$path = $ARGS[0]

if($path -eq $null) {
	echo "引数がない場合ため、現在のディレクトリを開きます"
	start $atom (pwd)
} elseif(Test-Path $path) {
	echo "指定されたパスが存在するため、それを開きます"
	start $atom $path
} elseif($path.contains("*")) {
	$find = ls $path
	echo "パスに`*`が入っているため、検索して開きます" ("結果 : "+$find)
	start $atom $find
} else {
	echo "現在存在しないフォルダを開きます"
	start $atom (Join-Path $path (Split-Path $path -leaf))
}
