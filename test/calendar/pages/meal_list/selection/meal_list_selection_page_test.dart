import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meal_planner/calendar/pages/meal_list/selection/meal_list_api.dart';
import 'package:meal_planner/calendar/pages/meal_list/selection/meal_list_selection_card.dart';
import 'package:meal_planner/calendar/pages/meal_list/selection/meal_list_selection_page.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'meal_list_selection_page_test.mocks.dart';

@GenerateMocks([MealListApi])
void main() {
  Widget _makeTestableWidget({required Widget child}) {
    return MaterialApp(home: Scaffold(body: child));
  }

  testWidgets("shows 2 meal list selection cards when meal list api returns 2 meals", (WidgetTester tester) async {
    final mockMealListApi = MockMealListApi();
    when(mockMealListApi.fetchMealList()).thenReturn(["Spaghetti", "Toast"]);
    final mealListSelectionPage = _makeTestableWidget(
      child: MealListSelectionPage(api: mockMealListApi),
    );

    await tester.pumpWidget(mealListSelectionPage);

    expect(find.byType(MealListSelectionCard), findsNWidgets(2));
  });
}
