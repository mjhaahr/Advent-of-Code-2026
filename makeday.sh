#!/usr/bin/env bash

days=(puzzles/*)

if [[ "${#days[@]}" -lt 2 ]]; then
    day=1
else
    day="${days[-2]}"
    echo "$day"
    day=$(("${day: -2}" + 1))
fi

printf -v paddedDay "%02d" "$day"

dayName="day-$paddedDay"
puzzleEntry="puzzles/$dayName"
solEntry="$puzzleEntry/solution.cpp"
inputsEntry="inputs/$dayName"

printf "Do you want to create:\n    $puzzleEntry\n    $solEntry\n    $inputsEntry\n\n"

read -rp "Press Y/y to accept: " response

if [[ "${response,,}" == "y" ]]; then
    mkdir "$puzzleEntry"
    mkdir "$inputsEntry"
    cp "puzzles/template.cpp" "$solEntry"
    
    echo ""
    echo "Would you like to open the new solution file"
    read -rp "Press Y/y to accept: " response
    if [[ "${response,,}" == "y" ]]; then
        open "$solEntry"
    fi
fi