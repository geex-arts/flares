import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

int wordLength(String word) {
  return word.length;
}

List<int> returnDays(int number) {
  final List<int> days = [];
  for (int i = 1; i < number + 1; i++) {
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

List<AiWishStruct> mergeTwoListsAIWishes(
  List<AiWishStruct> currentAIWishes,
  List<AiWishStruct> newAIWishes,
) {
  currentAIWishes.addAll(newAIWishes);

  return currentAIWishes;
}

DateTime returnSelectedDate(
  String day,
  String month,
  String year,
  String hours,
  String minutes,
  String hourMarker,
) {
  final dateString = '$day/$month/$year $hours:$minutes $hourMarker';
  return DateFormat('d/M/yyyy h:mm a').parse(dateString);
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

List<AiWishStruct> jsonArrayToDataType(List<dynamic> apiWishesAIResult) {
  List<AiWishStruct> listOfStruct = [];
  for (var item in apiWishesAIResult) {
    listOfStruct.add(AiWishStruct.fromMap(item));
  }
  return listOfStruct;
}

List<String> mergeTwoListsStrings(
  List<String> feelingsNames,
  List<String> customNames,
) {
  feelingsNames.addAll(customNames);

  return feelingsNames;
}

String stringToImagePath(String stringImage) {
  return stringImage;
}

bool? checkIfIListContains(
  AiCategoryRow currentCategory,
  List<AiCategoryRow> selectedCategories,
) {
  return selectedCategories.contains(currentCategory);
}
