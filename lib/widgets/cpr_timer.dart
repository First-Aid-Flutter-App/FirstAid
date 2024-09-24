import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firstaid/notifiers/cpr_timer_notifier.dart';
import 'dart:async';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CPRTimerWidget extends ConsumerWidget {
  const CPRTimerWidget({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _compressionCount = ref.watch(cprTimerProvider);
    final _timerNotifier = ref.read(cprTimerProvider.notifier);
    final needsRescueBreaths = ref.watch(needsRescueBreathsProvider);

    if (needsRescueBreaths) {
      Future.microtask(
          () => _promptRescueBreaths(context, ref, _timerNotifier));
    }
    
    return Column(
      children: [
        const SizedBox(height: 8),

        // Compressions Counter
        Center(
          child: Text(
            'Compressions: $_compressionCount',
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),

        const SizedBox(height: 16),

        // Pulsating Heart Icon
        Center(
          child: Icon(
            Icons.favorite,
            size: 100,
            color: _compressionCount % 2 == 0
                ? Colors.red
                : Colors.grey, // Alternate colors to simulate a beat
          ),
        ),

        const SizedBox(height: 32),

        // Start/Stop Timer Button
        Center(
          child: _timerNotifier.isRunning
              ? ElevatedButton(
                  onPressed: _timerNotifier.stopTimer,
                  child: const Text(AppLocalizations.of(context)!.stopCprTimer),
                )
              : ElevatedButton(
                  onPressed: _timerNotifier.startTimer,
                  child: const Text(AppLocalizations.of(context)!.startCprTimer),
                ),
        ),
      ],
    );
  }

  Future<void> _promptRescueBreaths(BuildContext context, WidgetRef ref,
      CPRTimerNotifier timerNotifier) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(AppLocalizations.of(context)!.cprBreathPromptTitle),
          content: const Text(
              AppLocalizations.of(context)!.cprBreathPromptText),
          actions: [
            TextButton(
              child: const Text(AppLocalizations.of(context)!.continueButton),
              onPressed: () {
                Navigator.of(context).pop();
                ref.read(needsRescueBreathsProvider.notifier).state = false;
                timerNotifier.startTimer();
              },
            ),
          ],
        );
      },
    );
  }
}
