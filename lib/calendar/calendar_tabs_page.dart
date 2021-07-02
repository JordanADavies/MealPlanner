import 'package:flutter/material.dart';
import 'package:meal_planner/calendar/pages/day_page.dart';
import 'package:meal_planner/calendar/pages/week_page.dart';

class CalendarTabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Expanded(
                child: TabBarView(
                  children: [
                    DayPage(),
                    WeekPage(),
                  ],
                ),
              ),
              Container(
                color: Theme.of(context).cardTheme.color,
                child: TabBar(
                  tabs: [
                    Tab(text: "Day"),
                    Tab(text: "Week"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
