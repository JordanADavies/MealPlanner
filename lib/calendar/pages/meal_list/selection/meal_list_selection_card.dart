import 'package:flutter/material.dart';

class MealListSelectionCard extends StatelessWidget {
  final String meal;
  final Function() onSelected;

  const MealListSelectionCard({
    Key? key,
    required this.meal,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 12.0,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                meal,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            TextButton(
              child: Text("Add"),
              onPressed: onSelected,
            ),
          ],
        ),
      ),
    );
  }
}
