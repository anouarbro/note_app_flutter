class Note {
  String? title;
  String? content;
  DateTime? date;
  bool? isFavorite;
  bool? isArchive;

  Note({
    required this.title,
    required this.content,
    required this.date,
    this.isArchive = false,
    this.isFavorite = false,
  });

  @override
  String toString() {
    return 'Title: $title\nContent: $content\nDate: $date';
  }
}
