/*
 * Copyright (c) 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

/// A class extending DateTime to provide additional time management functionality.
///
/// The TimeManager class is derived from the DateTime class and includes a
/// method to add specific days.
class TimeManager extends DateTime {
  /// Constructs a TimeManager instance with the specified [dateTime].
  TimeManager(DateTime dateTime) : super(dateTime.year, dateTime.month, dateTime.day);

  /// Constructs a TimeManager instance with the current date and time.
  TimeManager.now() : super.now();

  /// Adds the specified number of days and returns a new TimeManager instance.
  ///
  /// The [daysToAdd] parameter specifies the number of days to add. If [daysToAdd]
  /// is positive, it advances the date; if negative, it goes back in time.
  TimeManager addDays(int daysToAdd) {
    int year = this.year;
    int month = this.month;
    int day = this.day;

    while (daysToAdd != 0) {
      if (daysToAdd > 0) {
        // Forward days
        int daysInMonth = DateTime(year, month + 1, 0).day;
        if (day + daysToAdd <= daysInMonth) {
          day += daysToAdd;
          daysToAdd = 0;
        } else {
          daysToAdd -= daysInMonth - day + 1;
          day = 1;
          if (month == 12) {
            month = 1;
            year++;
          } else {
            month++;
          }
        }
      } else {
        // Backward days
        if (day > -daysToAdd) {
          day += daysToAdd;
          daysToAdd = 0;
        } else {
          daysToAdd += day;
          if (month == 1) {
            month = 12;
            year--;
          } else {
            month--;
          }
          int daysInMonth = DateTime(year, month + 1, 0).day;
          day = daysInMonth;
        }
      }
    }

    return TimeManager(DateTime(year, month, day));
  }

  /// Returns a string representation of the date without the time.
  ///
  /// This method extracts the first 10 characters from the DateTime's string
  /// representation, effectively removing the time component.
  String removeHours() {
    return toString().substring(0, 10);
  }

  int getDay() {
    return day;
  }
}
