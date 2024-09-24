import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirstAidStepsNotifier extends StateNotifier<List<bool>> {
  FirstAidStepsNotifier(int length) : super(List<bool>.filled(length, false));

  void toggleStep(int index) {
    state = [
      for (int i = 0; i < state.length; i++) 
        if (i == index) !state[i] else state[i],
    ];
  }
}

final firstAidStepsProvider =
  StateNotifierProvider.family<FirstAidStepsNotifier, List<bool>, int>(
    (ref, length) => FirstAidStepsNotifier(length));