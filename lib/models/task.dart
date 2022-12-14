enum TypeTask {
  High,
  Medium,
  Slow,
}

class Task {
  String id;
  String title;
  DateTime date;
  int status;
  TypeTask tipe;

  Task({
    this.id,
    this.title,
    this.date,
    this.status,
    this.tipe,
  });
}
