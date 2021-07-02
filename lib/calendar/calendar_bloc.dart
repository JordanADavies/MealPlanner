import 'package:meal_planner/calendar/model/day_plan.dart';
import 'package:meal_planner/calendar/utils/calendar.dart';
import 'package:rxdart/rxdart.dart';

class CalendarBloc {
  final Calendar _calendar;

  DateTime? _cachedSelectedDate;
  final BehaviorSubject<DayPlan> _selectedDaysPlan;
  List<DayPlan>? _cachedWeeklyDayPlans;
  final BehaviorSubject<List<DayPlan>> _weeklyDayPlans;

  CalendarBloc({Calendar? calendar})
      : _calendar = calendar ?? Calendar(),
        _selectedDaysPlan = BehaviorSubject<DayPlan>(),
        _weeklyDayPlans = BehaviorSubject<List<DayPlan>>() {
    final weekDates = _calendar.getCurrentWeek();
    _cachedWeeklyDayPlans =
        weekDates.map((date) => DayPlan(date: date)).toList();
    _cachedSelectedDate = _calendar.getToday();
    _refreshWeeklyPlans();
    _refreshSelectedDaysPlan();
  }

  ValueStream<DayPlan> get selectedDaysPlan => _selectedDaysPlan.stream;

  ValueStream<List<DayPlan>> get weeklyDayPlans => _weeklyDayPlans.stream;

  void dispose() {
    _selectedDaysPlan.close();
    _weeklyDayPlans.close();
  }

  void _refreshWeeklyPlans() {
    _cachedWeeklyDayPlans!
        .sort((left, right) => left.date.compareTo(right.date));
    _weeklyDayPlans.add(_cachedWeeklyDayPlans!);
  }

  void _refreshSelectedDaysPlan() {
    _selectedDaysPlan.add(_cachedWeeklyDayPlans!
        .firstWhere((dayPlan) => dayPlan.date == _cachedSelectedDate));
  }

  void changeSelectedDate({required DateTime date}) {
    _cachedSelectedDate = date;
    _refreshSelectedDaysPlan();
  }

  void addMealToDate({required DateTime date, required String meal}) {
    final dayPlan =
        _cachedWeeklyDayPlans!.firstWhere((dayPlan) => dayPlan.date == date);
    final updatedMeals = [
      if (dayPlan.meals != null) ...dayPlan.meals!,
      meal,
    ];
    final updatedDayPlan = DayPlan(
      date: dayPlan.date,
      meals: updatedMeals,
    );
    _cachedWeeklyDayPlans!.remove(dayPlan);
    _cachedWeeklyDayPlans!.add(updatedDayPlan);
    _refreshWeeklyPlans();
    _refreshSelectedDaysPlan();
  }
}
