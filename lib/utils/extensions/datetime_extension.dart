extension DateTimeExt on DateTime? {
  String get timeDifference {
    if (this == null) return "0 Seconds ago";
    var today = DateTime.now();
    var diff = today.difference(this!);
    if (diff.inSeconds < 60)
      return "${diff.inSeconds} Seconds ago";
    else if (diff.inMinutes < 60)
      return "${diff.inMinutes} Minutes ago";
    else if (diff.inHours < 24)
      return "${diff.inHours} Hours ago";
    else if (diff.inDays < 7)
      return "1 week ago";
    else
      return "${diff.inDays % 7} Weeks ago";
  }
}
