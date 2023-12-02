import 'package:aoc_2023/day/day_01.dart';
import 'package:aoc_2023/function_timer.dart';
import 'package:aoc_2023/input_loader.dart';
import 'package:test/test.dart';

Future<void> main() async {
  final timer = FunctionTimer();
  final input = await loadInputForDay(1);
  final day = DayOne();

  test('part one', () {
    timer.start();
    print(day.partOne(input));
    print('Part 1 completed in ${timer.stop()}');
  });

  test('part two', () {
    timer.start();
    print(day.partTwo(input));
    print('Part 2 completed in ${timer.stop()}');
  });
}
