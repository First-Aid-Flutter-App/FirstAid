import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

class CPRRescueBreathsEvent implements Exception {}

class CPRTimerNotifier extends StateNotifier<int> {
  Timer? _timer;
  bool isRunning = false;
  final double bpm;
  final StateController<bool> needsRescueBreaths;

  CPRTimerNotifier(this.bpm, this.needsRescueBreaths) : super(0);

  void startTimer() {
    if (!isRunning) {
      isRunning = true;
      state = 0;
      _timer = Timer.periodic(Duration(milliseconds: (60000 / bpm).round()),
          (timer) {
        state += 1;
        if (state == 30) {
          stopTimer();
          needsRescueBreaths.state = true;
        }
      });
    }
  }

  void stopTimer() {
    _timer?.cancel();
    isRunning = false;
    state = 0;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final cprTimerProvider = StateNotifierProvider<CPRTimerNotifier, int>((ref) {
  final needsRescueBreaths = ref.read(needsRescueBreathsProvider.notifier);
  return CPRTimerNotifier(110, needsRescueBreaths);
});

final needsRescueBreathsProvider = StateProvider<bool>((ref) => false);
