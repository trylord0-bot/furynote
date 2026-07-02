import 'package:fury_note/l10n/app_localizations.dart';
import 'package:intl/intl.dart';

extension AppLocalizationsFormatting on AppLocalizations {
  String formatInteger(num value) {
    return NumberFormat.decimalPattern(localeName).format(value);
  }

  String formatDecimal(num value, {int digits = 1}) {
    final formatter = NumberFormat.decimalPattern(localeName)
      ..minimumFractionDigits = digits
      ..maximumFractionDigits = digits;
    return formatter.format(value);
  }

  String formatPercent(num fraction) {
    return NumberFormat.percentPattern(localeName).format(fraction);
  }

  String formatKrw(num amount) {
    return NumberFormat.simpleCurrency(
      locale: localeName,
      name: 'KRW',
    ).format(amount);
  }

  String formatShortDate(DateTime value) {
    return DateFormat.yMd(localeName).format(value);
  }

  String formatDateTime(DateTime value) {
    return DateFormat.yMd(localeName).add_jm().format(value);
  }

  String formatMonth(DateTime value) {
    return DateFormat.yMMMM(localeName).format(value);
  }

  String formatMonthDay(DateTime value) {
    return DateFormat.Md(localeName).format(value);
  }

  String formatTime(DateTime value) {
    return DateFormat.jm(localeName).format(value);
  }

  String formatByteCount(int bytes) {
    if (bytes < 1024) {
      return dataSizeBytes(formatInteger(bytes));
    }

    final kb = bytes / 1024;
    if (kb < 1024) {
      return dataSizeKilobytes(formatDecimal(kb));
    }

    return dataSizeMegabytes(formatDecimal(kb / 1024));
  }

  String formatRelativeTime(DateTime value) {
    final diff = DateTime.now().difference(value);
    if (diff.inMinutes < 1) {
      return relativeTimeJustNow;
    }
    if (diff.inMinutes < 60) {
      return relativeTimeMinutesAgo(diff.inMinutes);
    }
    if (diff.inHours < 24) {
      return relativeTimeHoursAgo(diff.inHours);
    }
    return relativeTimeDaysAgo(diff.inDays);
  }

  String categoryName(String key) {
    return switch (key) {
      'family' => family,
      'romance' => romance,
      'work' => work,
      'people' => people,
      'driving' => driving,
      'custom' => other,
      _ => key,
    };
  }

  String categoryDisplay(String key) {
    return switch (key) {
      'family' => '👨‍👩‍👧 $family',
      'romance' => '💕 $romance',
      'work' => '💼 $work',
      'people' => '🧑 $people',
      'driving' => '🚗 $driving',
      'custom' => '➕ $other',
      _ => '➕ $key',
    };
  }
}
