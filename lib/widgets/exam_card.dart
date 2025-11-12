import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../utils/time_format.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;
  const ExamCard({super.key, required this.exam, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final past = TimeFmt.isPast(exam.dateTime);
    final scheme = Theme.of(context).colorScheme;
    final bg = past ? scheme.surfaceContainerHigh : scheme.primaryContainer;    

    return Card(
      color: bg,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 0.5,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap, 
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(past ? Icons.check_circle : Icons.schedule,
                  color: past ? Colors.grey[700] : scheme.primary),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(exam.subject,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.event, size: 18),
                        const SizedBox(width: 6),
                        Text(TimeFmt.date(exam.dateTime)),
                        const SizedBox(width: 12),
                        const Icon(Icons.access_time, size: 18),
                        const SizedBox(width: 6),
                        Text(TimeFmt.time(exam.dateTime)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.meeting_room, size: 18),
                        const SizedBox(width: 6),
                        Expanded(child: Text(exam.rooms.join(', '))),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.chevron_right, color: scheme.onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }
}
