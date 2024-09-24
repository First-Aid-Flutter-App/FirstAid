import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firstaid/notifiers/first_aid_steps_notifier.dart';

class FirstAidStepsScreen extends ConsumerWidget {
  final List<String> steps;

  const FirstAidStepsScreen({super.key, required this.steps});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _checked = ref.watch(firstAidStepsProvider(steps.length));
    final _stepsNotifier = ref.read(firstAidStepsProvider(steps.length).notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('First Aid Steps'),
      ),
      body: ListView.builder(
        itemCount: steps.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Checkbox(
                value: _checked[index],
                onChanged: (bool? value) {
                  _stepsNotifier.toggleStep(index);
                },
              ),
              title: Text(steps[index]),
            ),
          );
        },
      ),
    );
  }
}