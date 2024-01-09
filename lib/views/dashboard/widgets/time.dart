import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common/constants.dart';

class CalendarTimer extends StatefulWidget {
  const CalendarTimer({super.key});

  @override
  _CalendarTimerState createState() => _CalendarTimerState();
}

class _CalendarTimerState extends State<CalendarTimer> {
  late Stream<DateTime> dateTimeStream;

  @override
  void initState() {
    super.initState();
    dateTimeStream =
        Stream.periodic(const Duration(seconds: 1), (_) => DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
      stream: dateTimeStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          DateTime now = snapshot.data!;
          String formattedTime = DateFormat('HH:mm').format(now);
          String formattedDate = DateFormat('dd.MM.yyyy').format(now);

          return Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Row(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_month),
                        const SizedBox(width: 5),
                        Text(formattedDate),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Row(
                      children: [
                        const Icon(Icons.access_alarm),
                        const SizedBox(width: 5),
                        Text(formattedTime),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.notifications),
                  ],
                ),
              ),
            ],
          );
        } else {
          return const CircularProgressIndicator(); // Show a loading indicator while waiting for the first data
        }
      },
    );
  }
}
