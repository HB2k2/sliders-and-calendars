// import 'package:flutter/material.dart';
// import 'package:flutter_application_23/syncfusion_calender.dart';
// import 'package:flutter_application_23/slider.dart';
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Calender(),
//       // MySliderPage(),
//     );
//   }
// }

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';

import 'pages/events_example.dart';

Map<DateTime, List<int>> _kEventSource = {};

void main() {
  final kToday = DateTime.now();
  final kTomorrow = DateTime(kToday.year, kToday.month, kToday.day + 1);
  final DateTime kFirstDay =
      DateTime(kToday.year, kToday.month - 3, kToday.day);
  final DateTime kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  if (_kEventSource.containsKey(kToday)) {
    _kEventSource[kToday]!.add(1);
  } else {
    _kEventSource[kToday] = [1];
    _kEventSource[kToday]!.add(2);
  }

  final kEvents = LinkedHashMap<DateTime, List<int>>(
    equals: isSameDay,
    hashCode: getHashCode,
  )..addAll(_kEventSource);

  initializeDateFormatting().then((_) => runApp(MyApp(
        kEvents: kEvents,
        kFirstDay: kFirstDay,
        kLastDay: kLastDay,
      ))); // Pass kEvents to MyApp
}

class MyApp extends StatelessWidget {
  final Map<DateTime, List<int>> kEvents;
  final DateTime kFirstDay;
  final DateTime kLastDay; // Define kEvents as an instance variable
  const MyApp(
      {super.key,
      required this.kEvents,
      required this.kFirstDay,
      required this.kLastDay}); // Constructor to receive kEvents

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TableCalendar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartPage(
        kEvents: kEvents,
        kFirstDay: kFirstDay,
        kLastDay: kLastDay,
      ), // Pass kEvents to StartPage
    );
  }
}

class StartPage extends StatefulWidget {
  final Map<DateTime, List<int>> kEvents;
  final DateTime kFirstDay;
  final DateTime kLastDay;
  const StartPage(
      {super.key,
      required this.kEvents,
      required this.kFirstDay,
      required this.kLastDay}); // Constructor to receive kEvents

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TableCalendar Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            ElevatedButton(
              child: const Text('Events'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => TableEventsExample(
                          kEvents: widget.kEvents,
                          kFirstDay: widget.kFirstDay,
                          kLastDay: widget.kLastDay,
                        )), // Pass kEvents to TableEventsExample
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
