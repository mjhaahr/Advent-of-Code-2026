# Advent of Code 2025

Repo for my entries for [Advent of Code 2025](https://adventofcode.com/2025/about)

All are solved in C++23

## Usage

To run, use the provided `runner.sh` script:

```
./runner.sh [day#] [part# = 1] [dataSet = 0]
# day#: Sets the day to run
# part#: Sets which part to run (defaults to 1 unless 2 is entered)
# dataSet: Which data set to use, 0 (or any negative) is puzzle input, 1+ is for examples 1+
# data sets are stored in the inputs/day-# dir
```

To create a new day, use the provided `makeday.sh` script, which will create the puzzle and input file directories and creates (and optionally opens) the `solution.cpp` file.

To add an input to the most recent day, use the provided `addinput.sh` script, which asks whether you'd like to add the input file or an example file and then opens it with `nano`
