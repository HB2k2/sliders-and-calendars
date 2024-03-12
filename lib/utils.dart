import 'dart:collection';

import 'package:table_calendar/table_calendar.dart';

final kEvents = LinkedHashMap<DateTime, List<int>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

Map<DateTime, List<int>> _kEventSource = {};

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

final kToday = DateTime.now();
final kTomorrow = DateTime(kToday.year, kToday.month, kToday.day+1);
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

void addOrUpdateEvent(DateTime date) {
  if (_kEventSource.containsKey(date)) {
     // Add event to existing list
  } else {
    _kEventSource[date] = [2]; // Create a new list for this date
  }
}