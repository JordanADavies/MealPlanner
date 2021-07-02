class Calendar {
  DateTime getToday() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return today;
  }

  List<DateTime> getCurrentWeek() {
    final today = getToday();
    final startOfWeek = today.subtract(Duration(days: today.weekday));
    return _getWeekDatesFromDate(startOfWeek).toList();
  }

  Iterable<DateTime> _getWeekDatesFromDate(DateTime date) sync* {
    for (var day = 0; day < DateTime.daysPerWeek; day++) {
      yield date.add(Duration(days: day));
    }
  }
}
