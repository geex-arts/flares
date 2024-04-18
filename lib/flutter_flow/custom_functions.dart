import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

int wordLength(String word) {
  return word.length;
}

List<int> returnDays() {
  final List<int> days = [];
  for (int i = 1; i < 32; i++) {
    days.add(i);
  }

  return days;
}

List<String> returnMonths() {
  return [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
}

List<int> returnYears() {
  return [2024, 2025, 2026, 2027, 2028, 2029, 2030];
}

DateTime returnSelectedDate(
  String day,
  String month,
  String year,
  String hours,
  String minutes,
) {
  final dateString = '$day/$month/$year $hours:$minutes';
  return DateFormat('d/M/yyyy HH:mm').parse(dateString);
}

String checkDay(DateTime dateToCheck) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = DateTime(now.year, now.month, now.day - 1);

  final aDate = DateTime(dateToCheck.year, dateToCheck.month, dateToCheck.day);
  if (aDate == today) {
    return 'today';
  } else if (aDate == yesterday) {
    return 'yesterday';
  } else {
    return 'old';
  }
}

List<String> uniqueListElements(List<String> list) {
  return list.toSet().toList();
}

String capitalizeFirstLetter(String lowercaseString) {
  return toBeginningOfSentenceCase(lowercaseString)!;
}
