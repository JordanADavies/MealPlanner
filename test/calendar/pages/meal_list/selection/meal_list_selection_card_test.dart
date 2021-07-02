import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meal_planner/calendar/pages/meal_list/selection/meal_list_selection_card.dart';

void main() {
  Widget _makeTestableWidget({required Widget child}) {
    return MaterialApp(home: Scaffold(body: child));
  }

  testWidgets("tapping add calls the onSelected callback",
      (WidgetTester tester) async {
    var onSelectedCalled = false;
    final mealListSelectionCard = _makeTestableWidget(
      child: MealListSelectionCard(
        meal: "Spaghetti",
        onSelected: () => onSelectedCalled = true,
      ),
    );

    await tester.pumpWidget(mealListSelectionCard);
    expect(onSelectedCalled, false);
    await tester.tap(find.text("Add"));

    expect(onSelectedCalled, true);
  });
}
