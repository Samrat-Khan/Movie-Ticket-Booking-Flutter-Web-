import 'package:flutter/material.dart';
import 'package:flutter_e_ticket/CommonWidgets/appBar.dart';
import 'package:flutter_e_ticket/CommonWidgets/appDrawer.dart';

class BookedTickets extends StatefulWidget {
  @override
  _BookedTicketsState createState() => _BookedTicketsState();
}

class _BookedTicketsState extends State<BookedTickets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      extendBodyBehindAppBar: true,
      drawer: drawer(context: context),
      backgroundColor: Colors.pinkAccent,
      body: Center(
        child: Text("Booked Tickets"),
      ),
    );
  }
}
