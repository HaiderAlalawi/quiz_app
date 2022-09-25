import 'package:computiqquizapp/app_tools/services.dart';
import 'package:computiqquizapp/homeScreen/tools/edit_button.dart';
import 'package:computiqquizapp/homeScreen/tools/lets_start_button.dart';
import 'package:computiqquizapp/homeScreen/tools/team_number_show.dart';
import 'package:flutter/material.dart';

class TeamStartRow extends StatelessWidget {
  const TeamStartRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 3,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Theme.of(context).colorScheme.secondary),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                EditTeamNumber(pressed: () => Services.decreaseTeam(), myIcon: Icons.remove),
                const TeamNumberShow(),
                EditTeamNumber(pressed: () => Services.increaseTeam(), myIcon: Icons.add),
              ],
            ),
          ),
          const LetsStartButton(),
        ],
      ),
    );
  }
}

