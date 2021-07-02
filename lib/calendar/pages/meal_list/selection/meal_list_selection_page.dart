import 'package:flutter/material.dart';
import 'package:meal_planner/calendar/pages/meal_list/selection/meal_list_api.dart';
import 'package:meal_planner/calendar/pages/meal_list/selection/meal_list_selection_card.dart';

class MealListSelectionPage extends StatelessWidget {
  final MealListApi _api;

  const MealListSelectionPage({Key? key, MealListApi? api})
      : _api = api ?? const MealListApi(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final meals = _api.fetchMealList();
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        title: Text(
          "Add meal",
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: meals
              .map((meal) => MealListSelectionCard(
                    meal: meal,
                    onSelected: () => Navigator.of(context).pop(meal),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
