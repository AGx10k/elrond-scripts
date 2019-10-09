#!/bin/bash
if [ -s _nodes.sh ]; then
        source _nodes.sh
else
        echo _nodes.sh not found!
        exit 1
fi

echo "erd_shard_id,erd_count_accepted_blocks,erd_count_leader,erd_is_syncing,erd_node_type,erd_nonce,erd_current_round,erd_synchronized_round,NAME,addr"

for i in "${nodes[@]}"; do
        name=$(awk -F, '{print$1}' <<< "$i")
        addr=$(awk -F, '{print$2}' <<< "$i")
        curlout=$(curl -s "${addr}/node/status")
        if [ $? -gt 0 ]; then
                echo "$i,ERROR curl"
        else
                shard=$(jq -r '.details.erd_shard_id' <<< "$curlout")
                if [ "$shard" -eq "4294967295" ]; then
                        shard="M"
                fi
                echo "$shard,"$(jq -r '[.details | .erd_count_accepted_blocks, .erd_count_leader, .erd_is_syncing, .erd_node_type, .erd_nonce, .erd_current_round, .erd_synchronized_round ]| @csv' <<< "$curlout")",$i"
        fi
done
