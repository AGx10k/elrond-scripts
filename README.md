# elrond-scripts
1. put your nodes to _nodes.sh (see exmaple)
2. run:
```
### sorted by shard
./elrond-check-multi.sh | sort  -n -t , -k 1 < check.txt

### sorted by accepted blocks
./elrond-check-multi.sh | sort  -n -t , -k 1 < check.txt
```
