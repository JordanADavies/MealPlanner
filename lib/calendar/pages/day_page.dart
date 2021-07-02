import 'package:flutter/material.dart';
import 'package:meal_planner/calendar/calendar_bloc.dart';
import 'package:meal_planner/calendar/model/day_plan.dart';
import 'package:meal_planner/calendar/pages/meal_list/day_plan_meal_list.dart';
import 'package:meal_planner/calendar/utils/calendar.dart';
import 'package:provider/provider.dart';

class DayPage extends StatelessWidget {
  final Calendar _calendar;

  DayPage({Key? key, Calendar? calendar})
      : _calendar = calendar ?? Calendar(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final calendarBloc = Provider.of<CalendarBloc>(context);
    return StreamBuilder(
      stream: calendarBloc.selectedDaysPlan,
      builder: (BuildContext context, AsyncSnapshot<DayPlan> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildChangeDateButton(context, snapshot.data!.date),
              SizedBox(height: 12.0),
              Expanded(
                child: _buildDayPlan(context, snapshot.data!),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildChangeDateButton(BuildContext context, DateTime selectedDate) {
    return TextButton(
      child: Text("Change date"),
      onPressed: () => _changeDate(context, selectedDate),
    );
  }

  void _changeDate(BuildContext context, DateTime selectedDate) async {
    final currentWeek = _calendar.getCurrentWeek();
    final date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: currentWeek.first,
      lastDate: currentWeek.last,
    );
    if (date == null) {
      return;
    }

    final calendarBloc = Provider.of<CalendarBloc>(context, listen: false);
    calendarBloc.changeSelectedDate(date: date);
  }

  Widget _buildDayPlan(BuildContext context, DayPlan dayPlan) {
    return SingleChildScrollView(
      child: DayPlanMealList(dayPlan: dayPlan),
    );
  }
}
