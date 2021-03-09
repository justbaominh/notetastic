class Note {
  String id;
  String title;
  String content;

  Note({
    this.title = "Untitled",
    this.content,
  }) {
    id = DateTime.now().toString();
  }
}
