Object? readList(Map<dynamic, dynamic> json, String key) {
  final value = json[key];
  if (value is List) return value;
  if (value is Map) {
    for (final entry in value.values) {
      if (entry is List) return entry;
    }
  }
  for (final entry in json.values) {
    if (entry is List) return entry;
  }
  return null;
}

Object? readSelf(Map<dynamic, dynamic> json, String key) => json;

Object? readId(Map<dynamic, dynamic> json, String key) {
  final value = json['_id'] ?? json['id'];
  return value?.toString();
}
