#!/bin/ash
#copyright by monlor
monlorpath=$(uci -q get monlor.tools.path)
[ $? -eq 0 ] && source "$monlorpath"/scripts/base.sh || exit

appname=aria2
[ "$xq" != "R3" ] && rm -rf /tmp/$appname/lib