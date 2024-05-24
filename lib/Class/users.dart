import 'package:note_app/Class/notes.dart';

class User {
  String? username;
  String? password;
  List<Note>? Notes;

  User({
    required this.username,
    required this.password,
    this.Notes,
  });

  @override
  String toString() {
    return 'Username: $username\nPassword: $password\nNotes: $Notes';
  }
}
