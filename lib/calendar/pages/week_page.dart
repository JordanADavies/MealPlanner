import 'package:flutter/material.dart';
import 'package:meal_planner/calendar/calendar_bloc.dart';
import 'package:meal_planner/calendar/model/day_plan.dart';
import 'package:meal_planner/calendar/pages/meal_list/day_plan_meal_list.dart';
import 'package:provider/provider.dart';

class WeekPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final calendarBloc = Provider.of<CalendarBloc>(context);
    return StreamBuilder(
      stream: calendarBloc.weeklyDayPlans,
      builder: (_, AsyncSnapshot<List<DayPlan>> snapshot) {
        if (snapshot.hasData) {
          return ListView(
            padding: const EdgeInsets.only(top: 20.0),
            children: snapshot.data!
                .map((dayPlan) => DayPlanMealList(dayPlan: dayPlan))
                .toList(),
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
