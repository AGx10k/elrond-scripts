#!/bin/bash
case "$#" in
        2)
                sortKEYS="-k $1 -k $2"
        ;;
        1)
                sortKEYS="-k $1"
        ;;
        0)
                sortKEYS=""
        ;;
        *)
                echo "Illegal number of parameters"
                echo usage:
                echo $0 [sort_KEYDEF1] [sort_KEYDEF2]
                exit 1
esac


if [ -s _nodes.sh ]; then
        source _nodes.sh
else
        echo _nodes.sh not found!
        exit 3
fi

(
for i in "${nodes[@]}"; do
        name=$(awk -F, '{print$1}' <<< "$i")
        addr=$(awk -F, '{print$2}' <<< "$i")
        curlout=$(curl -s "${addr}/node/status")
        if [ $? -gt 0 ]; then
                echo "$i,ERROR curl"
        else
                shard=$(jq -r '.details.erd_shard_id' <<< "$curlout")
                if [ "$shard" -eq "4294967295" ]; then
                        shard="-1"
                fi
                echo "$shard,"$(jq -r '[.details | .erd_count_accepted_blocks  // "-" , .erd_count_leader // "-" , .erd_is_syncing // "-", .erd_node_type // "-", .erd_nonce // "-", .erd_current_round // "-" , .erd_synchronized_round // "-", .erd_consensus_state // "-", .erd_num_connected_peers // "-", .erd_fork_choice_count // "-" ]| @csv' <<< "$curlout")",$i"
        fi
done
) | sort -n -t , ${sortKEYS} \
  | sed '1 i\shard,blocks,count_leader,syncing,node_type,nonce,cur_round,synced_round,consensus_state,peers,fork_choice,NAME,addr' \
  | column -t -s,
