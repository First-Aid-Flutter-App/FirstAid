import 'package:firstaid/screens/user_information_screen.dart';
import 'package:flutter/material.dart';
import '../models/situation.dart';
import 'first_aid_steps_screen.dart';
import '../widgets/situation_card.dart';
import 'package:firstaid/providers/situation_provider.dart';

class SituationSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Aid Situations'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyInfoScreen(),
                )
              );
            }, 
            icon: const Icon(Icons.info_outline),
            iconSize: 35,
          )
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemCount: situations.length,
        itemBuilder: (context, index) {
          return SituationCard(
            situation: situations[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FirstAidStepsScreen(id: situations[index].text),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
