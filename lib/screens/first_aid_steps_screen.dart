import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firstaid/notifiers/first_aid_steps_notifier.dart';
import 'package:firstaid/providers/situation_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final firstAidStepsStateProvider =
    ChangeNotifierProvider.autoDispose((ref) => FirstAidStepsState());

class FirstAidStepsState extends ChangeNotifier {
  Stopwatch stopwatch = Stopwatch();
  Timer? timer;

  FirstAidStepsState() {
    stopwatch.start();
    timer =
        Timer.periodic(Duration(seconds: 1), (Timer t) => notifyListeners());
  }

  void stop() {
    stopwatch.stop();
    timer?.cancel();
    notifyListeners();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}

class FirstAidStepsScreen extends ConsumerWidget {
  final String id;

  FirstAidStepsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final situation = ref.watch(situationProvider(id));
    final _checked = ref.watch(firstAidStepsProvider(id));
    final _stepsNotifier = ref.read(firstAidStepsProvider(id).notifier);
    final _firstAidStepsState = ref.watch(firstAidStepsStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocalizations.of(context)?.firstAidSteps ?? 'First Aid Steps'),
      ),
      body: ListView.builder(
        itemCount: situation.steps.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Checkbox(
                value: _checked[index],
                onChanged: (bool? value) {
                  _stepsNotifier.toggleStep(id, index);
                  if (index == situation.steps.length - 1 && value == true) {
                    _firstAidStepsState.stop();
                  }
                },
              ),
              title: Text(situation.steps[index]),
            ),
          );
        },
      ),
      bottomNavigationBar: Text(
        'Elapsed time: ${_firstAidStepsState.stopwatch.elapsed.inSeconds} seconds',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
