#! /bin/bash

if [[ $# != 1 ]]; then
    echo "Usage: $0 inputfile"
fi

infile=$1
outfile=$(echo $outfile | sed 's/\..*/.avi/')

mencoder -mc 0 -noskip -vf expand=:::::16/9,scale=720:480,hqdn3d,harddup -ovc xvid -oac mp3lame -xvidencopts fixed_quant=3.8:me_quality=6:noqpel:nogmc:trellis:chroma_me:chroma_opt:hq_ac:vhq=4:lumi_mask:max_key_interval=300:quant_type=mpeg:max_bframes=2:closed_gop:nopacked:profile=asp5:autoaspect:bvhq=1 -lameopts vbr=2:q=6:aq=2 -o $outfile $infile
