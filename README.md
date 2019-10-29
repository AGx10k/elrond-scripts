# ./elrond-check-multi.sh - just pull stats from multiple nodes
0. add your host to iptables like this: `iptables -I INPUT -s YOUR_IP/32 -p tcp -m multiport --dports _NODE_RPC_PORT_ -j ACCEPT`
1. put your nodes to _nodes.sh (see example)
2. run:
```
### sorted by shard (field 1) and then by erd_count_accepted_blocks (field 2)
./elrond-check-multi.sh 1,1 2,2

### sorted by accepted blocks
./elrond-check-multi.sh 2,2

### not sorted
./elrond-check-multi.sh
```

sort by name (column 11, d for dictionary order):
```
# ./elrond-check-multi.sh 11d
shard  blocks  count_leader  syncing  node_type    nonce  cur_round  synced_round  consensus_state           peers  NAME        addr
1      9       9             0        "validator"  1658   2002       2001          "not in consensus group"  918    AGx1        78.46.150.247:8080
4      11      11            0        "validator"  1678   2002       2001          "not in consensus group"  920    AGx2        78.46.205.94:8080
0      9       9             0        "validator"  1609   2002       2001          "participant"             913    AGx3        78.47.217.221:8080
-1     14      14            0        "validator"  1664   2002       2001          "participant"             918    AGx4        78.47.218.79:8080
2      14      14            0        "validator"  1607   2002       2001          "participant"             917    AGx5        95.216.185.120:8080
3      10      10            0        "validator"  1533   2002       1992          "participant"             918    AGx6        95.216.211.142:8080
```
sort by by count_leader (column 3) and then by accepted_blocks (column 2):
```
# ./elrond-check-multi.sh 3,3 2,2
shard  blocks  count_leader  syncing  node_type    nonce  cur_round  synced_round  consensus_state           peers  NAME        addr
1      9       9             0        "validator"  1735   2086       2085          "not in consensus group"  914    AGx1        78.46.150.247:8080
3      10      10            0        "validator"  1569   2086       2085          "participant"             911    AGx6        95.216.211.142:8080
0      11      11            0        "validator"  1682   2086       2085          "not in consensus group"  910    AGx3        78.47.217.221:8080
4      11      11            0        "validator"  1750   2086       2085          "not in consensus group"  918    AGx2        78.46.205.94:8080
2      14      14            0        "validator"  1670   2086       2085          "participant"             916    AGx5        95.216.185.120:8080
-1     15      15            0        "validator"  1731   2086       2085          "participant"             913    AGx4        78.47.218.79:8080
```
