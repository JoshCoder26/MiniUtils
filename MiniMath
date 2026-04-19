#!/bin/bash
if (( "$#" < 3 )); then
echo "You have to input at least 3 arguments (./MiniMath 1 + 2 for example)"
exit 1
fi
if (( "$#" > 3 )); then
echo "The current version of MiniMath doesn't support over 1 calculation at the time"
exit 1
fi
G1=${1/./}
TV=${1##*.}
[[ "$TV" == "$1" ]] && AC1=0 || AC1=${#TV}
G2=${3/./}
TV=${3##*.}
[[ "$TV" == "$3" ]] && AC2=0 || AC2=${#TV}
if [[ "$2" == "*" ]]; then
MAC=$((AC1 + AC2 ))
else
(( AC1 > AC2 )) && MAC=$AC1 || MAC=$AC2
TV=$((MAC -AC1))
for ((i=0; i<TV; i++)); do G1="${G1}0"; done
TV=$((MAC -AC2))
for ((i=0; i<TV; i++)); do G2="${G2}0"; done
fi
UK=$((G1 $2 G2))
if (( MAC == 0 )); then
    echo "$UK"
    exit 0
fi
PD="0000000000"
[[ $UK == -* ]] && TP="-${PD}${UK#-}" || TP="${PD}${UK}"
VR=${TP:0:${#TP}-MAC}
AR=${TP: -MAC}
OP=$(echo "$VR.$AR" | sed 's/0*\([0-9-][0-9]*\.\)/\1/')
[[ "$OP" == .* ]] && OP="0$OP"
[[ "$OP" == -.* ]] && OP="-0${OP#-}"
[[ -z "$OP" || "$OP" == "." ]] && OP="0"
echo "${OP/.-/-0.}"
exit 0
