# ./elrond-check-multi.sh - just pull stats from multiple nodes
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

sample output:
```
#### sort by name (column 9, d for dictionary order)
# ./elrond-check-multi.sh 9d
erd_shard_id  erd_count_accepted_blocks  erd_count_leader  erd_is_syncing  erd_node_type  erd_nonce  erd_current_round  erd_synchronized_round  NAME                        addr
1             6                          6                 0               "validator"    1313       1601               1600                    ELROND_HZ_aga1-nbg          78.46.150.247:8080
4             5                          5                 0               "validator"    1330       1601               1599                    ELROND_HZ_aga2-nbg          78.46.205.94:8080
0             7                          7                 0               "validator"    1280       1601               1600                    ELROND_HZ_aga3-fsn          78.47.217.221:8080
-1            12                         12                0               "validator"    1327       1601               1599                    ELROND_HZ_aga4-fsn          78.47.218.79:8080
2             11                         11                0               "validator"    1273       1601               1600                    ELROND_HZ_aga5-hel          95.216.185.120:8080
3             7                          7                 0               "validator"    1287       1601               1600                    ELROND_HZ_aga6-hel          95.216.211.142:8080

#### sort by by accepted blocks (column 2)
./elrond-check-multi.sh 2,2
erd_shard_id  erd_count_accepted_blocks  erd_count_leader  erd_is_syncing  erd_node_type  erd_nonce  erd_current_round  erd_synchronized_round  NAME                        addr
4             6                          6                 0               "validator"    1393       1672               1671                    ELROND_HZ_aga2-nbg          78.46.205.94:8080
0             8                          8                 0               "validator"    1337       1672               1671                    ELROND_HZ_aga3-fsn          78.47.217.221:8080
1             8                          8                 0               "validator"    1373       1672               1670                    ELROND_HZ_aga1-nbg          78.46.150.247:8080
3             8                          8                 0               "validator"    1341       1672               1670                    ELROND_HZ_aga6-hel          95.216.211.142:8080
-1            12                         12                0               "validator"    1386       1672               1671                    ELROND_HZ_aga4-fsn          78.47.218.79:8080
2             13                         13                0               "validator"    1336       1672               1671                    ELROND_HZ_aga5-hel          95.216.185.120:8080
```
