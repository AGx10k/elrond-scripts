# ./elrond-check-multi.sh - just pull stats from multiple nodes
0. add your host to iptables like this: `iptables -I INPUT -s YOUR_IP/32 -p tcp -m multiport --dports _NODE_RPC_PORT_ -j ACCEPT`
1. put your nodes to `_nodes.sh` (see `_nodes.sh.example`)
2. run:

sort by name (column 11, d for dictionary order, see `man sort`):
```
#### sort by shard
# ./elrond-check-multi.sh 1,1 
shard  blocks  count_leader  syncing  node_type    nonce  cur_round  synced_round  consensus_state           peers  fork_choice  NAME        addr
-1     48      49            0        "validator"  27265  31230      31229         "participant"             349    9            AGx4        78.47.218.79:8080
0      182     183           0        "validator"  26653  31230      31229         "not in consensus group"  317    11           AGx3        78.47.217.221:8080
1      180     180           0        "validator"  26769  31230      31229         "not in consensus group"  348    11           AGx1        78.46.150.247:8080
2      177     177           0        "validator"  26837  31230      31229         "participant"             314    11           AGx5        95.216.185.120:8080
3      183     183           0        "validator"  27236  31230      31229         "participant"             333    14           AGx6        95.216.211.142:8080
4      187     187           0        "validator"  27923  31230      31229         "not in consensus group"  328    4            AGx2        78.46.205.94:8080
```
sort by by count_leader (column 3) and then by accepted_blocks (column 2):
```
# ./elrond-check-multi.sh 3,3 2,2
shard  blocks  count_leader  syncing  node_type    nonce  cur_round  synced_round  consensus_state           peers  fork_choice  NAME        addr
-1     48      49            0        "validator"  27274  31239      31238         "participant"             350    9            AGx4        78.47.218.79:8080
2      177     177           0        "validator"  26845  31239      31238         "not in consensus group"  316    11           AGx5        95.216.185.120:8080
1      180     180           0        "validator"  26774  31239      31238         "participant"             350    11           AGx1        78.46.150.247:8080
0      182     183           0        "validator"  26660  31239      31238         "participant"             318    11           AGx3        78.47.217.221:8080
3      183     183           0        "validator"  27242  31239      31237         "not in consensus group"  335    14           AGx6        95.216.211.142:8080
4      188     188           0        "validator"  27932  31239      31238         "not in consensus group"  329    4            AGx2        78.46.205.94:8080
```
