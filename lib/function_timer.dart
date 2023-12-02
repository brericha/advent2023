class FunctionTimer {
  FunctionTimer();

  final _stopwatch = Stopwatch();

  void start() {
    _stopwatch.reset();
    _stopwatch.start();
  }

  String stop() {
    _stopwatch.stop();

    final elapsed = _stopwatch.elapsed;
    if (elapsed.inMilliseconds == 0) {
      return ('${elapsed.inMicroseconds}µs');
    }
    return '${_stopwatch.elapsed.inMilliseconds}ms';
  }
}
