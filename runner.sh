#!/usr/bin/env bash
set -euo pipefail

## Expected Input Setup:
# [day#], [part# = {1,2}], [dataSet = 0 (0 for true input, 1+ for examples 1+)]

day=0
part=1
dataSet=0

case "$#" in
    1)
        # Passed in only the day - Default to Part 1, with the base input
        day=$1
        ;;
        
    2)
        # Passed in the day and Part Flag - Default to the base input
        day=$1
        [[ "$2" == "2" ]] && part=2 || part=1
        ;;
        
    3)
        # Passed in everything
        day=$1
        [[ "$2" == "2" ]] && part=2 || part=1
        dataSet=$3 
        ;;
        
    *)
        echo "Error: Expected 1-3 arguments, got $#" >&2
        exit 1
        ;;
esac

printf -v paddedDay "%02d" "$day"

inputName="input.txt"
if [[ $dataSet > 0 ]] then
    inputName="example$dataSet.txt"
fi

echo "Running Day-$paddedDay Part $part with $inputName"

path="./puzzles/day-$paddedDay"

# TODO: Add utils
compileCmd=("clang++" "-std=c++23" "-Wall" "-Icommon" "-o$path/solution.o" "$path/solution.cpp")
"${compileCmd[@]}"

inputPath="inputs/day-$paddedDay/$inputName"

runCmd=("./$path/solution.o" "$inputPath" "$part")
"${runCmd[@]}"