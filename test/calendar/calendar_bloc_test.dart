import 'package:flutter_test/flutter_test.dart';
import 'package:meal_planner/calendar/calendar_bloc.dart';
import 'package:meal_planner/calendar/model/day_plan.dart';
import 'package:meal_planner/calendar/utils/calendar.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'calendar_bloc_test.mocks.dart';

@GenerateMocks([Calendar])
void main() {
  test("selectedDaysPlan emits day plan with same date as today on init", () {
    final mockCalendar = MockCalendar();
    final day1 = DateTime(2021, 7, 1);
    final day2 = DateTime(2021, 7, 2);
    final day3 = DateTime(2021, 7, 3);
    final day4 = DateTime(2021, 7, 4);
    final day5 = DateTime(2021, 7, 5);
    final day6 = DateTime(2021, 7, 6);
    final day7 = DateTime(2021, 7, 7);
    when(mockCalendar.getCurrentWeek())
        .thenReturn([day1, day2, day3, day4, day5, day6, day7]);
    when(mockCalendar.getToday()).thenReturn(day1);

    final calendarBloc = CalendarBloc(calendar: mockCalendar);

    expect(calendarBloc.selectedDaysPlan, emits(DayPlan(date: day1)));
  });

  test("weeklyDayPlans emits day plan for each day of week on init", () {
    final mockCalendar = MockCalendar();
    final day1 = DateTime(2021, 7, 1);
    final day2 = DateTime(2021, 7, 2);
    final day3 = DateTime(2021, 7, 3);
    final day4 = DateTime(2021, 7, 4);
    final day5 = DateTime(2021, 7, 5);
    final day6 = DateTime(2021, 7, 6);
    final day7 = DateTime(2021, 7, 7);
    when(mockCalendar.getCurrentWeek())
        .thenReturn([day1, day2, day3, day4, day5, day6, day7]);
    when(mockCalendar.getToday()).thenReturn(day1);

    final calendarBloc = CalendarBloc(calendar: mockCalendar);

    expect(
        calendarBloc.weeklyDayPlans,
        emits([
          DayPlan(date: day1),
          DayPlan(date: day2),
          DayPlan(date: day3),
          DayPlan(date: day4),
          DayPlan(date: day5),
          DayPlan(date: day6),
          DayPlan(date: day7),
        ]));
  });

  test(
      "changeSelectedDate with date changes the day plan emitted from selectedDaysPlan to match the date passed in",
      () {
    final mockCalendar = MockCalendar();
    final day1 = DateTime(2021, 7, 1);
    final day2 = DateTime(2021, 7, 2);
    final day3 = DateTime(2021, 7, 3);
    final day4 = DateTime(2021, 7, 4);
    final day5 = DateTime(2021, 7, 5);
    final day6 = DateTime(2021, 7, 6);
    final day7 = DateTime(2021, 7, 7);
    when(mockCalendar.getCurrentWeek())
        .thenReturn([day1, day2, day3, day4, day5, day6, day7]);
    when(mockCalendar.getToday()).thenReturn(day1);

    final calendarBloc = CalendarBloc(calendar: mockCalendar);
    calendarBloc.changeSelectedDate(date: day7);

    expect(calendarBloc.selectedDaysPlan, emits(DayPlan(date: day7)));
  });

  test(
      "addMealToDate adds meal to day plan emitted from both selectedDaysPlan and weeklyDayPlans",
      () {
    final mockCalendar = MockCalendar();
    final day1 = DateTime(2021, 7, 1);
    final day2 = DateTime(2021, 7, 2);
    final day3 = DateTime(2021, 7, 3);
    final day4 = DateTime(2021, 7, 4);
    final day5 = DateTime(2021, 7, 5);
    final day6 = DateTime(2021, 7, 6);
    final day7 = DateTime(2021, 7, 7);
    when(mockCalendar.getCurrentWeek())
        .thenReturn([day1, day2, day3, day4, day5, day6, day7]);
    when(mockCalendar.getToday()).thenReturn(day1);

    final calendarBloc = CalendarBloc(calendar: mockCalendar);
    calendarBloc.addMealToDate(date: day1, meal: "Spaghetti");

    expect(calendarBloc.selectedDaysPlan,
        emits(DayPlan(date: day1, meals: ["Spaghetti"])));
    expect(
        calendarBloc.weeklyDayPlans,
        emits([
          DayPlan(date: day1, meals: ["Spaghetti"]),
          DayPlan(date: day2),
          DayPlan(date: day3),
          DayPlan(date: day4),
          DayPlan(date: day5),
          DayPlan(date: day6),
          DayPlan(date: day7),
        ]));
  });
}
