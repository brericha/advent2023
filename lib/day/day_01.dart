import 'package:aoc_2023/advent_day.dart';
import 'package:collection/collection.dart';
import 'package:quiver/pattern.dart';

class DayOne extends AdventDay {
  @override
  String partOne(String input) {
    final exp = RegExp(r'\D+');
    final lines = input.split('\n');
    var sum = 0;
    for (var e in lines) {
      final line = e.replaceAll(exp, '').split('');

      if (line.length == 1) {
        sum += int.parse(line.first + line.first);
      } else {
        sum += int.parse(line.first + line.last);
      }
    }
    return sum.toString();
  }

  @override
  String partTwo(String input) {
    final exps = [
      RegExp(r'\d'),
      RegExp(r'one'),
      RegExp(r'two'),
      RegExp(r'three'),
      RegExp(r'four'),
      RegExp(r'five'),
      RegExp(r'six'),
      RegExp(r'seven'),
      RegExp(r'eight'),
      RegExp(r'nine'),
    ];
    final pattern = matchAny(exps);

    final lines = input.split('\n');
    var sum = 0;

    for (var line in lines) {
      final matches = pattern.allMatches(line);
      final sorted = matches.sortedByCompare(
          (element) => element.start, (a, b) => a.compareTo(b));
      final firstMatch = sorted.first;
      final lastMatch = sorted.last;

      String firstValue = parseStringOrInt(firstMatch[0]!);
      String lastValue = parseStringOrInt(lastMatch[0]!);

      sum += int.parse('$firstValue$lastValue');
    }

    return sum.toString();
  }

  String parseStringOrInt(String value) {
    return switch (value) {
      'one' => '1',
      'two' => '2',
      'three' => '3',
      'four' => '4',
      'five' => '5',
      'six' => '6',
      'seven' => '7',
      'eight' => '8',
      'nine' => '9',
      _ => value
    };
  }
}
