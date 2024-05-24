import 'package:note_app/Class/notes.dart';
import 'package:note_app/Class/users.dart';

List<User> lstUsers = [
  User(
    username: "Anouar",
    password: "123",
    Notes: [
      Note(
        title: "Note 1",
        content: "Content 1",
        date: DateTime.now(),
      ),
      /* Note(
        title: "Note 2",
        content: "Content 2",
        date: DateTime.now(),
      ),*/
    ],
  ),
];
