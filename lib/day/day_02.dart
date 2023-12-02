import 'package:aoc_2023/advent_day.dart';

class DayTwo extends AdventDay {
  @override
  String partOne(String input) {
    const redLimit = 12;
    const greenLimit = 13;
    const blueLimit = 14;
    final lines = input.split('\n');
    final games = lines.map((e) => DiceGame.parse(e));

    return games
        .fold<int>(
          0,
          (value, game) =>
              value +
              (game.isPossible(
                blueLimit: blueLimit,
                redLimit: redLimit,
                greenLimit: greenLimit,
              )
                  ? game.id
                  : 0),
        )
        .toString();
  }

  @override
  String partTwo(String input) {
    final lines = input.split('\n');
    final games = lines.map((e) => DiceGame.parse(e));

    return games.fold<int>(0, (value, game) => value + game.power()).toString();
  }
}

class DiceGame {
  const DiceGame({
    required this.id,
    required this.games,
  });

  final int id;
  final List<(int red, int green, int blue)> games;

  factory DiceGame.parse(String input) {
    final id = int.parse(input.split(' ')[1].replaceAll(':', ''));
    final rawGames = input.split(':')[1].split(';');
    final games = <(int, int, int)>[];

    for (final game in rawGames) {
      int red = 0;
      int green = 0;
      int blue = 0;
      final colors = game.split(',');
      for (final color in colors) {
        final quantity = int.parse(color.trim().split(' ')[0]);
        if (color.contains('red')) {
          red = quantity;
        } else if (color.contains('green')) {
          green = quantity;
        } else if (color.contains('blue')) {
          blue = quantity;
        }
      }

      games.add((red, green, blue));
    }

    return DiceGame(id: id, games: games);
  }

  bool isPossible({
    required int redLimit,
    required int greenLimit,
    required int blueLimit,
  }) {
    for (final game in games) {
      if (game.$1 > redLimit || game.$2 > greenLimit || game.$3 > blueLimit) {
        return false;
      }
    }
    return true;
  }

  int power() {
    var red = 0;
    var green = 0;
    var blue = 0;

    for (final game in games) {
      if (game.$1 > red) red = game.$1;
      if (game.$2 > green) green = game.$2;
      if (game.$3 > blue) blue = game.$3;
    }

    return red * green * blue;
  }
}
