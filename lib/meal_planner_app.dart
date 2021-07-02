import 'package:flutter/material.dart';
import 'package:meal_planner/calendar/calendar_bloc.dart';
import 'package:meal_planner/calendar/calendar_tabs_page.dart';
import 'package:meal_planner/themes.dart';
import 'package:provider/provider.dart';

class MealPlannerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: defaultTheme,
      home: Provider(
        create: (_) => CalendarBloc(),
        child: CalendarTabsPage(),
      ),
    );
  }
}
