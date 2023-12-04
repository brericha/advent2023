import 'package:aoc_2023/day/day_02.dart';
import 'package:aoc_2023/function_timer.dart';
import 'package:aoc_2023/input_loader.dart';
import 'package:test/test.dart';

Future<void> main() async {
  final timer = FunctionTimer();
  final input = await loadInputForDay(2);
  final day = DayTwo();

  test('part one', () {
    timer.start();
    print('Part one: ${day.partOne(input)}');
    print('Part one complete in ${timer.stop()}');
  });

  test('part two', () {
    timer.start();
    print('Part two: ${day.partTwo(input)}');
    print('Part two complete in ${timer.stop()}');
  });
}
