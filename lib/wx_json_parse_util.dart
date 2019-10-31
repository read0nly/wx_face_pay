// ignore: slash_for_doc_comments
/**
 * @Author: read0nly
 * @GitHub: https://github.com/read0nly
 * @Email: nj.readonly@gmailcom
 * @Description:
 * @Date: 2019/10/31
 */

class WXJsonParseUtil {
  static int parseInt(dynamic value, {int defaultValue}) {
    if (value == null) {
      return defaultValue;
    }
    if (value is int) {
      return value;
    }
    if (value is num) {
      return value.toInt();
    }
    if (value is String) {
      return int.tryParse(value);
    }
    return defaultValue;
  }

  static double parseDouble(dynamic value, {double defaultValue}) {
    if (value == null) {
      return defaultValue;
    }
    if (value is double) {
      return value;
    }
    if (value is num) {
      return value.toDouble();
    }
    if (value is String) {
      return double.tryParse(value);
    }
    return defaultValue;
  }

  static List<T> parseList<T>(dynamic value, T Function(dynamic) itemHandler) {
    if (value == null || value is! List) {
      return [];
    }

    List<T> result = [];
    try {
      result = (value as List).map((e) => itemHandler(e)).toList();
    } catch (_) {}
    return result;
  }
}
