import 'dart:io';

/// Read an AoC input file as a String. Input files should be placed in the
/// input directory in the project root. Do not pad day numbers with 0's e.g
/// day 3 would be day3.txt and day 12 would be day12.txt.
Future<String> loadInputForDay(int day) async =>
    File('input/day$day.txt').readAsString();
