import 'package:flutter/material.dart';
import '../data/mock_exams.dart';
import '../utils/time_format.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatelessWidget {
  final String appTitle;
  const ExamListScreen({super.key, required this.appTitle});

  @override
  Widget build(BuildContext context) {
    final sorted = [...mockExams]..sort((a, b) => a.dateTime.compareTo(b.dateTime));
    final total = sorted.length;
    final pastCount = sorted.where((e) => TimeFmt.isPast(e.dateTime)).length;

    final bottomInset = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(appTitle),
      ),

      body: ListView.separated(
        padding: EdgeInsets.fromLTRB(16, 16, 16, bottomInset + 80), // <—
        itemCount: sorted.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, i) {
          final exam = sorted[i];
          return ExamCard(
            exam: exam,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ExamDetailScreen(exam: exam)),
              );
            },
          );
        },
      ),
      
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.list_alt),
                const SizedBox(width: 8),
                Text('Вкупно: $total'),
                const Spacer(),
                const Icon(Icons.history),
                const SizedBox(width: 6),
                Text('Поминати: $pastCount'),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
