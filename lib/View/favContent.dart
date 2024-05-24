import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
// ignore: depend_on_referenced_packages
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:note_app/Class/notes.dart';
import 'package:note_app/Class/users.dart';
import 'package:note_app/View/editContent.dart';
import 'package:note_app/View/listContent.dart';
import 'package:note_app/View/signIn.dart';

// ignore: must_be_immutable
class FavNote extends StatefulWidget {
  User connectedUser;
  FavNote({super.key, required this.connectedUser});

  @override
  State<FavNote> createState() => _FavNotePageState();
}

class _FavNotePageState extends State<FavNote> {
  Future<void> handRefresh() async {
    return await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
        ),
        actions: [
          IconButton(
            hoverColor: Colors.transparent,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignIn(),
                ),
              );
            },
            icon: Icon(
              MdiIcons.logout,
              color: const Color(0xFF803D3B),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 50,
                    child: Image(image: AssetImage('assets/images/logo.png')),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                MdiIcons.home,
                color: const Color(0xFF803D3B),
              ),
              title: const Text(
                'Accueil',
                style: TextStyle(
                  color: Color(0xFF803D3B),
                  fontSize: 20,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotesList(
                      connectedUser: widget.connectedUser,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                MdiIcons.star,
                color: const Color(0xFF803D3B),
              ),
              title: const Text(
                'Favoris',
                style: TextStyle(
                  color: Color(0xFF803D3B),
                  fontSize: 20,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                MdiIcons.archive,
                color: const Color(0xFF803D3B),
              ),
              title: const Text(
                'Archives',
                style: TextStyle(
                  color: Color(0xFF803D3B),
                  fontSize: 20,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: LiquidPullToRefresh(
        borderWidth: 4,
        color: const Color(0xFFFFFBFE),
        backgroundColor: const Color(0xFF803D3B),
        // height: MediaQuery.of(context).size.height,
        height: 200,
        springAnimationDurationInMilliseconds: 250,
        animSpeedFactor: 3,
        showChildOpacityTransition: true,
        onRefresh: handRefresh,
        child: ListView.builder(
          itemCount: widget.connectedUser.Notes?.length,
          itemBuilder: (context, index) {
            Note? userNote =
                widget.connectedUser.Notes?.elementAt(index) as Note;
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Slidable(
                key: ValueKey(userNote.title),
                startActionPane: ActionPane(
                  motion: const DrawerMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        // do something
                      },
                      backgroundColor: Colors.green,
                      icon: MdiIcons.archivePlus,
                    ),
                    SlidableAction(
                      onPressed: (context) {
                        // do something
                      },
                      backgroundColor: Colors.blue,
                      icon: MdiIcons.starPlus,
                    ),
                  ],
                ),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        // do something
                      },
                      backgroundColor: Colors.red,
                      icon: MdiIcons.delete,
                    ),
                  ],
                ),
                child: ListTile(
                  leading: const Icon(
                    Icons.notes_rounded,
                    color: Colors.white,
                  ),
                  title: Text(
                    userNote.title ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Text(
                    'Dernière modification: ${userNote.date.toString().substring(0, 16)}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  /* trailing: IconButton(
                    hoverColor: Colors.transparent,
                    icon: Icon(
                      MdiIcons.deleteEmpty,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          widget.connectedUser.Notes?.removeAt(index);
                        },
                      );
                    },
                  ), */
                  onTap: () async {
                    Note? updatedContent = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NoteEditor(
                          title: userNote.title ??
                              '', // Add the required 'title' argument
                          content: userNote.content ?? '',
                          date: userNote.date ?? DateTime.now(),
                        ),
                      ),
                    );
                    if (updatedContent != null) {
                      setState(
                        () {
                          widget.connectedUser.Notes?.elementAt(index).title =
                              updatedContent.title;
                          widget.connectedUser.Notes?.elementAt(index).content =
                              updatedContent.content;
                          widget.connectedUser.Notes?.elementAt(index).date =
                              DateTime.now();
                        },
                      );
                    }
                  },
                  tileColor: const Color(0xFFE4C59E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF803D3B),
        child: Icon(
          MdiIcons.noteEdit,
          color: Colors.white,
        ),
        onPressed: () async {
          Note? newNotes = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NoteEditor(
                title: '',
                content: '',
                date: DateTime.now(),
              ),
            ),
          );
          if (newNotes != null) {
            setState(
              () {
                widget.connectedUser.Notes ??= [];
                widget.connectedUser.Notes?.add(newNotes);
              },
            );
          }
        },
      ),
    );
  }
}
