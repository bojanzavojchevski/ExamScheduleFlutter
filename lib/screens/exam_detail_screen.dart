import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../utils/time_format.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;
  const ExamDetailScreen({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final past = TimeFmt.isPast(exam.dateTime);
    final remain = TimeFmt.until(exam.dateTime);

    return Scaffold(
      appBar: AppBar(title: const Text('Детали за испит')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(exam.subject,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.event),
                const SizedBox(width: 8),
                Text('${TimeFmt.date(exam.dateTime)}  ·  ${TimeFmt.time(exam.dateTime)}'),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.meeting_room),
                const SizedBox(width: 8),
                Expanded(child: Text(exam.rooms.join(', '))),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: past
                    ? Colors.grey.shade300
                    : Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(past ? Icons.check_circle : Icons.hourglass_bottom),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      past ? 'Испитот е поминат.' : 'Преостанува: $remain',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: FilledButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Назад'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
