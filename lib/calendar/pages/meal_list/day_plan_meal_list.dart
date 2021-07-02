import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meal_planner/calendar/calendar_bloc.dart';
import 'package:meal_planner/calendar/model/day_plan.dart';
import 'package:meal_planner/calendar/pages/meal_list/day_plan_meal_card.dart';
import 'package:meal_planner/calendar/pages/meal_list/selection/meal_list_selection_page.dart';
import 'package:provider/provider.dart';

class DayPlanMealList extends StatelessWidget {
  final DayPlan dayPlan;

  const DayPlanMealList({Key? key, required this.dayPlan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 12.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          SizedBox(height: 8.0),
          if (dayPlan.meals != null) ..._buildMeals(),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            _formatDate(dayPlan.date),
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        TextButton(
          child: Text("Add meal"),
          onPressed: () => _addMeal(context),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    final suffix = _getDaySuffix(date.day);
    final dateFormatter = DateFormat("d'${suffix}' MMMM");
    return dateFormatter.format(date);
  }

  String _getDaySuffix(int day) {
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  void _addMeal(BuildContext context) async {
    final pageRoute = MaterialPageRoute(
      fullscreenDialog: true,
      builder: (_) => MealListSelectionPage(),
    );
    final selectedMeal = await Navigator.of(context).push(pageRoute);
    if (selectedMeal == null) {
      return;
    }
    final calenderBloc = Provider.of<CalendarBloc>(context, listen: false);
    calenderBloc.addMealToDate(date: dayPlan.date, meal: selectedMeal);
  }

  Iterable<Widget> _buildMeals() =>
      dayPlan.meals!.map((meal) => DayPlanMealCard(meal: meal));
}
