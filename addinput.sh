#!/usr/bin/env bash

inputs=(inputs/*)

regex="example([0-9]+)"

if [[ "${#inputs[@]}" -lt 1 ]]; then
    echo "No Input directories, run `makeday.sh` to create"
    exit 1
else
    inputDir="${inputs[-1]}"
fi

echo "$inputDir"
echo "Would you like to add the input file or another example?"
read -rp "Enter I[nput]/i[nput] for input or E[xample]/e[xample] for example: " response

if [[ "${response,,}" == "i" ]]; then
    inputFile="$inputDir/input.txt"
    echo ""
    echo "This will create/modify: $inputFile"
    read -rp "Press Y/y to accept: " response
    if [[ "${response,,}" == "y" ]]; then
        nano "$inputFile"
    fi
elif [[ "${response,,}" == "e" ]]; then
    inputFiles=("$inputDir/"*)
    
    largestExample=0
    
    for input in "${inputFiles[@]}"; do
        input="${input##*/}"
        if [[ $input =~ $regex ]]; then
            if [[ "${BASH_REMATCH[1]}" -gt $largestExample ]]; then
                largestExample="${BASH_REMATCH[1]}"
            fi
        fi
    done
    
    largestExample=$(("$largestExample" + 1))
    inputFile="$inputDir/example$largestExample.txt"
    
    echo ""
    echo "This will create/modify: $inputFile"
    read -rp "Press Y/y to accept: " response
    if [[ "${response,,}" == "y" ]]; then
        nano "$inputFile"
    fi
    
else
    echo "Unrecognized Response: $response"
fi