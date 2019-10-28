# ./elrond-check-multi.sh - just pull stats from multiple nodes
1. put your nodes to _nodes.sh (see example)
2. run:
```
### sorted by shard
./elrond-check-multi.sh | (read -r; printf "%s\n" "$REPLY"; sort -n -t , -k 1)  | less -R

### sorted by accepted blocks
./elrond-check-multi.sh | (read -r; printf "%s\n" "$REPLY"; sort -n -t , -k 2)  | less -R
```
