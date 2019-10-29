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
