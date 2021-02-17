import 'package:flutter/material.dart';
import 'package:flutter_e_ticket/Screens/Booked_Tickets/bookedTickets.dart';
import 'package:flutter_e_ticket/Screens/Movie_Add_ByAdmin/Add_Movie.dart';
import 'package:flutter_e_ticket/Screens/Movie_List/viewMovies.dart';

Drawer drawer({BuildContext context}) {
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text("Header"),
        ),
        ListTile(
          title: Text('All Movies'),
          leading: Icon(Icons.view_compact_outlined),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, "/", arguments: MovieViewPublic());
          },
        ),
        ListTile(
          title: Text('Add Movie'),
          leading: Icon(Icons.movie),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, "AddMovie", arguments: AddMovie());
          },
        ),
        ListTile(
          title: Text('Booked Ticket'),
          leading: Icon(Icons.sticky_note_2),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, "BookedTickets",
                arguments: BookedTickets());
          },
        ),
      ],
    ),
  );
}
