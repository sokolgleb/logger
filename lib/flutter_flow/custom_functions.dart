import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

List<String> prepareMeasurementIndicatorTypes(
    List<MeasurementIndicatorTypesRecord> indicatorTypes) {
  // Add your function code here!
  return indicatorTypes.map((el) {
    return el.name;
  }).toList();
}

int getGroupIndex(int groupIndex) {
  // Add your function code here!
  if (groupIndex == null) {
    return 0;
  }
  return groupIndex;
}

int getNextGroupIndex(int currentGroupIndex) {
  // Add your function code here!
  if (currentGroupIndex == 0) {
    return 1;
  } else {
    return currentGroupIndex - 1;
  }
}

String getCurrentDateTime(DateTime currentDateTime) {
  // Add your function code here!
  var d = currentDateTime;

  if (currentDateTime == null) {
    d = DateTime.now();
  }

  String dateSlug =
      "${d.day.toString().padLeft(2, '0')}.${d.month.toString().padLeft(2, '0')}.${d.year.toString()}, ${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}";

  return dateSlug;
}

DateTime getTimestamp(DateTime timestamp) {
  // Add your function code here!
  if (timestamp == null) {
    return DateTime.now();
  }

  return timestamp;
}

double getNumberValue(
  String type,
  double value,
) {
  // Add your function code here!
  if (type == 'Number') {
    return value;
  }

  return 0;
}

String getDefaultNumberValue(String type) {
  // Add your function code here!
  if (type == 'Number') {
    return '';
  }

  return '0';
}

String getTextValue(
  String type,
  String value,
) {
  // Add your function code here!
  if (type == 'Text') {
    return value;
  }

  return null;
}

double getSliderValue(
  String type,
  double value,
) {
  // Add your function code here!
  if (type == 'Slider') {
    return value;
  }

  return null;
}

int getRatingValue(
  String type,
  int value,
) {
  // Add your function code here!
  if (type == 'Rating') {
    return value;
  }

  return null;
}

bool getSwitchValue(
  String type,
  bool value,
) {
  // Add your function code here!
  if (type == 'Switch') {
    return value;
  }

  return null;
}

String getImageValue(
  String type,
  String value,
) {
  // Add your function code here!
  if (type == 'Image') {
    return value;
  }

  return null;
}

String getVideoValue(
  String type,
  String value,
) {
  // Add your function code here!
  if (type == 'Video') {
    return value;
  }

  return null;
}

String getHumanReadableSwitchValue(bool switchValue) {
  // Add your function code here!
  if (switchValue) {
    return 'Yes';
  }
  return 'No';
}

String getFixedDouble(double value) {
  // Add your function code here!
  if (value is int || value == value.roundToDouble()) {
    return value.toString();
  }
  return value.toStringAsFixed(2);
}

int getHumanReadableIndex(int index) {
  // Add your function code here!
  return index + 1;
}

bool isHasValue(String value) {
  // Add your function code here!
  if (value == null) {
    return false;
  }
  if (value == '') {
    return false;
  }
  return true;
}

String addValueGetDefaultNumberValue(
  bool usePreviousValue,
  double previousValue,
  int valuesCount,
  String type,
) {
  // Add your function code here!
  if (type != 'Number') {
    return '0';
  }

  if (valuesCount == null || valuesCount == 0) {
    return '';
  }

  if (usePreviousValue) {
    return previousValue.toString();
  }

  return '';
}

double addValueGetDefaultSliderValue(
  bool usePreviousValue,
  double previousValue,
) {
  // Add your function code here!

  if (usePreviousValue) {
    return previousValue;
  }

  return 5;
}

int addValueGetDefaultRatingValue(
  bool usePreviousValue,
  int previousValue,
) {
  // Add your function code here!

  if (usePreviousValue) {
    return previousValue;
  }

  return 3;
}

bool addValueGetDefaultSwitchValue(
  bool usePreviousValue,
  bool previousValue,
) {
  // Add your function code here!

  if (usePreviousValue) {
    return previousValue;
  }

  return true;
}

bool isDefCheckboxAvailable(String type) {
  // Add your function code here!
  if (type == 'Number' ||
      type == 'Slider' ||
      type == 'Rating' ||
      type == 'Switch' ||
      type == 'Time') {
    return true;
  }

  return false;
}

int getTimeValue(
  String type,
  String days,
  String hours,
  String minutes,
  String seconds,
) {
  // Add your function code here!
  if (type != 'Time') {
    return 0;
  }

  var total = 0;

  if (seconds != null && seconds != '') {
    total += int.parse(seconds);
  }

  if (minutes != null && minutes != '') {
    total += int.parse(minutes) * 60;
  }

  if (hours != null && hours != '') {
    total += int.parse(hours) * 60 * 60;
  }

  if (days != null && days != '') {
    total += int.parse(days) * 60 * 60 * 24;
  }

  return total;
}

String getHumanReadableTimeValue(int value) {
  // Add your function code here!
  var days = ((value ~/ 60) ~/ 60) ~/ 24;
  var hours = ((value - days * 60 * 60 * 24) ~/ 60) ~/ 60;
  var minutes = (value - days * 60 * 60 * 24 - hours * 60 * 60) ~/ 60;
  var seconds = value - days * 60 * 60 * 24 - hours * 60 * 60 - minutes * 60;

  var daysValue = '';
  var timeValue = '';

  if (days == 1) {
    daysValue = '$days day, ';
  } else if (days > 1) {
    daysValue = '$days days, ';
  }

  if (hours > 0 || minutes > 0 || seconds > 0) {
    if (hours > 0) {
      timeValue = '${hours.toString().padLeft(2, '0')}:';
    }
    timeValue +=
        '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  return '$daysValue$timeValue';
}

String getMinutesFromTimestamp(int value) {
  // Add your function code here!
  var days = ((value ~/ 60) ~/ 60) ~/ 24;
  var hours = ((value - days * 60 * 60 * 24) ~/ 60) ~/ 60;
  var minutes = (value - days * 60 * 60 * 24 - hours * 60 * 60) ~/ 60;
  var seconds = value - days * 60 * 60 * 24 - hours * 60 * 60 - minutes * 60;

  if (minutes == 0) {
    return '';
  }

  return minutes.toString().padLeft(2, '0');
}

String getDaysFromTimestamp(int value) {
  // Add your function code here!
  var days = ((value ~/ 60) ~/ 60) ~/ 24;
  var hours = ((value - days * 60 * 60 * 24) ~/ 60) ~/ 60;
  var minutes = (value - days * 60 * 60 * 24 - hours * 60 * 60) ~/ 60;
  var seconds = value - days * 60 * 60 * 24 - hours * 60 * 60 - minutes * 60;

  if (days == 0) {
    return '';
  }

  return days.toString().padLeft(2, '0');
}

String getSecondsFromTimestamp(int value) {
  // Add your function code here!
  var days = ((value ~/ 60) ~/ 60) ~/ 24;
  var hours = ((value - days * 60 * 60 * 24) ~/ 60) ~/ 60;
  var minutes = (value - days * 60 * 60 * 24 - hours * 60 * 60) ~/ 60;
  var seconds = value - days * 60 * 60 * 24 - hours * 60 * 60 - minutes * 60;

  if (seconds == 0) {
    return '';
  }

  return seconds.toString().padLeft(2, '0');
}

String getHoursFromTimestamp(int value) {
  // Add your function code here!
  var days = ((value ~/ 60) ~/ 60) ~/ 24;
  var hours = ((value - days * 60 * 60 * 24) ~/ 60) ~/ 60;
  var minutes = (value - days * 60 * 60 * 24 - hours * 60 * 60) ~/ 60;
  var seconds = value - days * 60 * 60 * 24 - hours * 60 * 60 - minutes * 60;

  if (hours == 0) {
    return '';
  }

  return hours.toString().padLeft(2, '0');
}

String addValueGetDefaultSecondsValue(
  bool usePreviousValue,
  int previousValue,
) {
  // Add your function code here!
  var days = ((previousValue ~/ 60) ~/ 60) ~/ 24;
  var hours = ((previousValue - days * 60 * 60 * 24) ~/ 60) ~/ 60;
  var minutes = (previousValue - days * 60 * 60 * 24 - hours * 60 * 60) ~/ 60;
  var seconds =
      previousValue - days * 60 * 60 * 24 - hours * 60 * 60 - minutes * 60;

  if (seconds == 0) {
    return '';
  }

  return seconds.toString().padLeft(2, '0');
}

String addValueGetDefaultMinutesValue(
  bool usePreviousValue,
  int previousValue,
) {
  // Add your function code here!
  var days = ((previousValue ~/ 60) ~/ 60) ~/ 24;
  var hours = ((previousValue - days * 60 * 60 * 24) ~/ 60) ~/ 60;
  var minutes = (previousValue - days * 60 * 60 * 24 - hours * 60 * 60) ~/ 60;
  var seconds =
      previousValue - days * 60 * 60 * 24 - hours * 60 * 60 - minutes * 60;

  if (minutes == 0) {
    return '';
  }

  return minutes.toString().padLeft(2, '0');
}

String addValueGetDefaultHoursValue(
  bool usePreviousValue,
  int previousValue,
) {
  // Add your function code here!
  var days = ((previousValue ~/ 60) ~/ 60) ~/ 24;
  var hours = ((previousValue - days * 60 * 60 * 24) ~/ 60) ~/ 60;
  var minutes = (previousValue - days * 60 * 60 * 24 - hours * 60 * 60) ~/ 60;
  var seconds =
      previousValue - days * 60 * 60 * 24 - hours * 60 * 60 - minutes * 60;

  if (hours == 0) {
    return '';
  }

  return hours.toString().padLeft(2, '0');
}

String addValueGetDefaultDaysValue(
  bool usePreviousValue,
  int previousValue,
) {
  // Add your function code here!
  var days = ((previousValue ~/ 60) ~/ 60) ~/ 24;
  var hours = ((previousValue - days * 60 * 60 * 24) ~/ 60) ~/ 60;
  var minutes = (previousValue - days * 60 * 60 * 24 - hours * 60 * 60) ~/ 60;
  var seconds =
      previousValue - days * 60 * 60 * 24 - hours * 60 * 60 - minutes * 60;

  if (days == 0) {
    return '';
  }

  return days.toString().padLeft(2, '0');
}

bool isHasImage(String value) {
  // Add your function code here!
  if (value == null || value == '') {
    return false;
  }

  return true;
}

bool isHasParentGroup(DocumentReference parentGroup) {
  // Add your function code here!
  if (parentGroup == null) {
    return false;
  }

  return true;
}
