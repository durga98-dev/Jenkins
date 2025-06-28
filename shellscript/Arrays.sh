#!/bin/bash

Toys=("Tom" "Jerry" "Duck" "Elephant")

#index starts from 0 and size is 4

echo "First Toy name is: ${Toys[0]}"
echo "All toys are: ${Toys[@]}"

# for i in ${Toys[@]}
# do
# End=$i
# done
# echo "Priniting all toy names: $End "