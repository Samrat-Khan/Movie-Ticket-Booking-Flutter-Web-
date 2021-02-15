import 'package:flutter/material.dart';
import 'package:flutter_e_ticket/Screens/Movie_Add_ByAdmin/Add_Movie.dart';

class AdminProfile extends StatefulWidget {
  @override
  _AdminProfileState createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: AddMovie(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("Header"),
            ),
            ListTile(
              title: Text('Add Movie'),
              leading: Icon(Icons.movie),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Public View'),
              leading: Icon(Icons.view_compact_outlined),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Booked Ticket'),
              leading: Icon(Icons.sticky_note_2),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
