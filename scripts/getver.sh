#!/bin/ash
#copyright by monlor
monlorpath=$(uci -q get monlor.tools.path)
[ $? -eq 0 ] && source "$monlorpath"/scripts/base.sh || exit

logsh "【Tools】" "获取版本更新脚本启动..."
logger -s -t "【Tools】" "获取更新插件列表"
rm -rf /tmp/applist.txt
wgetsh $monlorpath/config/applist.txt $monlorurl/config/applist_"$xq".txt
if [ $? -ne 0 ]; then
	[ "$model" == "arm" ] && applist="applist.txt"
	[ "$model" == "mips" ] && applist="applist_mips.txt"
	wgetsh $monlorpath/config/applist.txt $monlorurl/config/"$applist"
	[ $? -ne 0 ] && logsh "【Tools】" "获取失败，检查网络问题！"
fi
logger -s -t "【Tools】" "获取工具箱版本信息"
rm -rf /tmp/version
rm -rf /tmp/version.tar.gz
wgetsh /tmp/version.tar.gz $monlorurl/version.tar.gz
[ $? -ne 0 ] && logsh "【Tools】" "获取版本号信息失败！请稍后再试"
tar -zxvf /tmp/version.tar.gz -C /tmp > /dev/null 2>&1
rm -rf /tmp/version.tar.gz
