import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Eventss {
  final String title;
  final String description;

  Eventss({required this.title, required this.description});
}

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<Eventss>> _events = {};
  DateTime? _previousSelectedDay;

  final titleController = TextEditingController();
  final descpController = TextEditingController();

  String _selectedMonth = DateFormat('MMMM').format(DateTime.now());
  int _selectedYear = DateTime.now().year;

  final List<String> monthNames = DateFormat().dateSymbols.MONTHS;

  @override
  void initState() {
    super.initState();
    loadPreviousEvents();
  }

  loadPreviousEvents() {
    _events = {
      DateTime(2022, 9, 13): [Eventss(title: "111", description: "11")],
      DateTime(2022, 9, 30): [Eventss(title: "22", description: "22")],
      DateTime(2022, 9, 20): [Eventss(title: "ss", description: "ss")]
    };
  }

  void _showAddEventDialog() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Event', textAlign: TextAlign.center),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descpController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            child: const Text('Add Event'),
            onPressed: () {
              if (titleController.text.isEmpty &&
                  descpController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Required title and description'),
                    duration: Duration(seconds: 2),
                  ),
                );
              } else {
                final selectedDate = _selectedDay ??
                    DateTime.now();
                setState(() {
                  _events[selectedDate] ??= [];
                  _events[selectedDate]!.add(
                    Eventss(
                      title: titleController.text,
                      description: descpController.text,
                    ),
                  );
                  titleController.clear();
                  descpController.clear();
                });
                Navigator.pop(context);
              }
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Buzz Calendar'),
        backgroundColor:const Color(0xFF112031),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              calendarFormat: _calendarFormat,
              focusedDay: DateTime(
                  _selectedYear, monthNames.indexOf(_selectedMonth) + 1, 1),
              firstDay: DateTime(2000),
              lastDay: DateTime(2050),
              startingDayOfWeek: StartingDayOfWeek.sunday,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
                if (_previousSelectedDay != null &&
                    isSameDay(selectedDay, _previousSelectedDay!)) {
                  setState(() {
                    _selectedDay = _previousSelectedDay;
                  });
                }
              },
              eventLoader: (date) {
                return _events[date] ?? [];
              },
              selectedDayPredicate: (date) {
                return _selectedDay != null && isSameDay(date, _selectedDay!);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0),
              child: Row(
                children: [
                  DropdownButton<String>(
                    value: _selectedMonth,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedMonth = newValue!;
                      });
                    },
                    items: monthNames.map((String month) {
                      return DropdownMenuItem<String>(
                        value: month,
                        child: Text(
                          month,
                          style:const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  DropdownButton<int>(
                    value: _selectedYear,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedYear = newValue!;
                      });
                    },
                    items: List<int>.generate(30, (int index) {
                      return DateTime.now().year - 15 + index;
                    }).map<DropdownMenuItem<int>>((int year) {
                      return DropdownMenuItem<int>(
                        value: year,
                        child: Text(
                          year.toString(),
                          style:const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            if (_selectedDay != null)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      DateFormat('MM, dd, yyyy').format(_selectedDay!),
                      style:const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ...(_events[_selectedDay!] ?? []).map(
                    (event) => ListTile(
                      leading: const Icon(
                        Icons.done,
                        color: Colors.red,
                      ),
                      title: Text('Event Title: ${event.title}'),
                      subtitle: Text('Description: ${event.description}'),
                    ),
                  ),
                ],
              ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0),
              child: Container(
                width: 360,
                height: 53,
                margin:const EdgeInsets.symmetric(
                    horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {
                    _showAddEventDialog();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor:const Color(0xFF112031),
                    backgroundColor: const Color(0xFF112031),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(
                        color: Color(0xFF112031),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Add Event',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
     ),
);
}
}
