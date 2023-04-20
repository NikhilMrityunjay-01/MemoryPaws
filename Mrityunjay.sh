#!/bin/bash
HOPE="com.your.packagename"

function hook {
HOPE=$1
}

function edit_dword {
    pid=$(su -c pidof $HOPE)
    addr=$(grep "$1" /proc/$pid/maps | awk '{ print $1 }' | cut -d'-' -f1 | awk 'NR==1{print}')
    echo "Base address of $1: $addr"

DECIMAL_SUM=$(( 16#$addr + 16#$2 ))
SUM=$(( $DECIMAL_SUM & 0xFFFFFFFF ))
HEX_SUM=$(printf "%X\n" $SUM | sed 's/^F*//')
HEX_SUM="0x$HEX_SUM"
echo $HEX_SUM

value=$(printf '%08x' $3 | sed -r 's/(..)(..)(..)(..)/\\x\4\\x\3\\x\2\\x\1/g')
echo -ne "$value" | dd of=/proc/$pid/mem bs=1 seek=$HEX_SUM conv=notrunc 2>/dev/null
}

function edit_hex {
    pid=$(su -c pidof $HOPE)
    addr=$(grep "$1" /proc/$pid/maps | awk '{ print $1 }' | cut -d'-' -f1 | awk 'NR==1{print}')
    echo "Base address of $1: $addr"

    DECIMAL_SUM=$(( 16#$addr + 16#$2 ))
    HEX_SUM=$(printf "%X\n" $DECIMAL_SUM | sed 's/^F*//')
    HEX_SUM="0x$HEX_SUM"
    echo $HEX_SUM

    value=$(echo -n "$3" | sed 's/ //g' | sed 's/../\\x&/g')
    echo -ne "$value" | dd of=/proc/$pid/mem bs=1 seek=$HEX_SUM conv=notrunc 2>/dev/null
}


function edit_qword {
    pid=$(su -c pidof $HOPE)
    addr=$(grep "$1" /proc/$pid/maps | awk '{ print $1 }' | cut -d'-' -f1 | awk 'NR==1{print}')
    echo "Base address of $1: $addr"

    DECIMAL_SUM=$(( 16#$addr + 16#$2 ))
    SUM=$(( $DECIMAL_SUM & 0xFFFFFFFFFFFFFFFF ))
    HEX_SUM=$(printf "%X\n" $SUM | sed 's/^F*//')
    HEX_SUM="0x$HEX_SUM"
    echo $HEX_SUM

    value=$(printf '%016x' $3 | sed -r 's/(..)(..)(..)(..)(..)(..)(..)(..)/\\x\8\\x\7\\x\6\\x\5\\x\4\\x\3\\x\2\\x\1/g')
    echo -ne "$value" | dd of=/proc/$pid/mem bs=1 seek=$HEX_SUM conv=notrunc 2>/dev/null
}

echo -e "\e[6;1;33m \n       Made by : @Nikhil_Mrityunjay | @Akatsukix1 \n \e[0m"
