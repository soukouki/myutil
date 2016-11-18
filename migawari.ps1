
$command = $ARGS -join " "
Invoke-Expression "start powershell {$command; echo '10秒後に閉じます';sleep 10}"