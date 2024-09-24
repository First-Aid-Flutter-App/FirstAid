import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firstaid/providers/situation_provider.dart';

class FirstAidStepsNotifier extends StateNotifier<List<bool>> {
  static final Map<String, List<bool>> _stepState = {};

  FirstAidStepsNotifier(String id, int length) : super(_stepState[id] ?? List<bool>.filled(length, false));

  void toggleStep(String id, int index) {
    state = [
      for (int i = 0; i < state.length; i++) 
        if (i == index) !state[i] else state[i],
    ];
    _stepState[id] = state;
  }
}

final firstAidStepsProvider = StateNotifierProvider.family<FirstAidStepsNotifier, List<bool>, String>(
  (ref, id) {
    final length = ref.read(situationProvider(id)).steps.length;
    return FirstAidStepsNotifier(id, length);
  },
);