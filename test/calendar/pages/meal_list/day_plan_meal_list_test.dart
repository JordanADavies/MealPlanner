import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meal_planner/calendar/model/day_plan.dart';
import 'package:meal_planner/calendar/pages/meal_list/day_plan_meal_card.dart';
import 'package:meal_planner/calendar/pages/meal_list/day_plan_meal_list.dart';

void main() {
  Widget _makeTestableWidget({required Widget child}) {
    return MaterialApp(home: Scaffold(body: child));
  }

  testWidgets("shows date in the format 2nd July", (WidgetTester tester) async {
    final dayPlan = DayPlan(date: DateTime(2021, 7, 2));
    final dayPlanMealList = _makeTestableWidget(
      child: DayPlanMealList(dayPlan: dayPlan),
    );

    await tester.pumpWidget(dayPlanMealList);

    expect(find.text("2nd July"), findsOneWidget);
  });

  testWidgets("shows 2 day plan meal cards when there are 2 meals",
      (WidgetTester tester) async {
    final dayPlan = DayPlan(
      date: DateTime(2021, 7, 2),
      meals: ["Spaghetti", "Toast"],
    );
    final dayPlanMealList = _makeTestableWidget(
      child: DayPlanMealList(dayPlan: dayPlan),
    );

    await tester.pumpWidget(dayPlanMealList);

    expect(find.byType(DayPlanMealCard), findsNWidgets(2));
  });
}
