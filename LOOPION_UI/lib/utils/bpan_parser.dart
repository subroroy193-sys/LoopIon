class BpanParser {
  static Map<String, String> parse(String rawPayload) {
    final cleaned = rawPayload.trim();
    final parts = cleaned.split('|');

    final result = <String, String>{};
    for (final part in parts) {
      final keyValue = part.split(':');
      if (keyValue.length == 2) {
        result[keyValue[0].trim()] = keyValue[1].trim();
      }
    }

    return result;
  }
}
