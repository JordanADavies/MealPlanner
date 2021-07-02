import 'package:quiver/collection.dart';
import 'package:quiver/core.dart';

class DayPlan {
  final DateTime date;
  final List<String>? meals;

  DayPlan({required this.date, this.meals});

  @override
  bool operator ==(Object other) {
    return other is DayPlan &&
        date == other.date &&
        listsEqual(meals, other.meals);
  }

  @override
  int get hashCode => hash2(date, meals);
}
