import '../models/exam.dart';

DateTime _d(int addDays, int h, int m)
{
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day + addDays, h, m);
}

final List<Exam> mockExams = 
[
  Exam(subject: 'Мобилни информациски системи', dateTime: _d(2, 9, 0), rooms: ['Лаб 1', 'Лаб 2']),
  Exam(subject: 'Бази на податоци',             dateTime: _d(-3, 12, 0), rooms: ['Лаб 1', 'Лаб 2', 'Лаб 138']),
  Exam(subject: 'Веројатност и статистика',     dateTime: _d(5, 14, 0),  rooms: ['АМФ']),
  Exam(subject: 'Интегрирани системи',          dateTime: _d(1, 10, 30), rooms: ['Лаб 138']),
  Exam(subject: 'HCI',                          dateTime: _d(9, 9, 0),   rooms: ['Лаб 1', 'Лаб 2', 'Лаб 117']),
  Exam(subject: 'Администрација на системи',    dateTime: _d(-1, 16, 0), rooms: ['Лаб 117']),
  Exam(subject: 'Економија за ИКТ инженери',    dateTime: _d(12, 11, 0), rooms: ['Лаб 138', 'Лаб 117']),
  Exam(subject: 'ИНСССИОК',                     dateTime: _d(3, 8, 0),   rooms: ['Лаб 200В']),
  Exam(subject: 'Мултимедиски системи',         dateTime: _d(15, 13, 0), rooms: ['Лаб 117']),
  Exam(subject: 'Напредно програмирање',        dateTime: _d(7, 9, 30),  rooms: ['Лаб 1', 'Лаб 2']),
];