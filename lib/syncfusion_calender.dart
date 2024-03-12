import 'package:flutter/material.dart';
import 'package:flutter_application_23/slider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  // final CalendarController _calendarController = CalendarController();

  // @override
  // initState() {
  //   _calendarController.displayDate = DateTime(2022, 02, 05);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.month,
      // controller: _calendarController,
      showDatePickerButton: true,
      monthViewSettings: const MonthViewSettings(
          showTrailingAndLeadingDates: false, dayFormat: 'EEE'),
      // monthCellBuilder: monthCellBuilder,
      dataSource: MeetingDataSource(getAppointments()),
    );
  }

  Widget monthCellBuilder(BuildContext context, MonthCellDetails details) {
    return Column(
      children: [
        Text(details.date.day.toString()),
        IconButton(
          icon: Icon(Icons.date_range),
          onPressed: () {
            print("tapped");
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const MySliderPage(),
              ),
            );
          },
        )
      ],
    );
  }
}

List<Appointment> getAppointments() {
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  DateTime startTime = DateTime(2024, 03, 5, 9, 0, 0);
  DateTime endTime = startTime.add(const Duration(hours: 2));

  meetings.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'Board Meeting',
      color: Colors.red,
      recurrenceRule: 'FREQ=DAILY;COUNT=10',
      isAllDay: false));

  startTime = DateTime(2024, 03, 5, 5, 0, 0);
  endTime = startTime.add(const Duration(hours: 2));

  meetings.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'Board Meeting',
      color: Colors.red,
      recurrenceRule: 'FREQ=DAILY;COUNT=10',
      isAllDay: false));

  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}


// selectionDecoration: const BoxDecoration(
//   image: DecorationImage(
//     image: NetworkImage(
//         'https://www.bing.com/ck/a?!&&p=07dba5fd3c2b6701JmltdHM9MTcwOTg1NjAwMCZpZ3VpZD0yMmI5ZGU0OS04NWY4LTYwNDItMDc1Zi1jZWUzODFmODYyYWUmaW5zaWQ9ODYyOA&ptn=3&ver=2&hsh=3&fclid=22b9de49-85f8-6042-075f-cee381f862ae&psq=SVG+image+URL&u=a1aHR0cHM6Ly93d3cub25saW5ld2ViZm9udHMuY29tL2ljb24vMjg2NjMz&ntb=1'), // Replace with your image URL
//     fit: BoxFit.cover, // Adjust the fit as needed
//   ),
// ),
//initialDisplayDate: DateTime(2021, 03, 01, 08, 30),
//initialSelectedDate: DateTime(2021, 03, 01, 08, 30),