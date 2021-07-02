import 'package:flutter/material.dart';

class DayPlanMealCard extends StatelessWidget {
  final String meal;

  const DayPlanMealCard({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 12.0,
        ),
        child: Text(
          meal,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}
