import 'package:flutter/material.dart';
import 'package:flutter_e_ticket/Screens/Booked_Tickets/bookedTickets.dart';
import 'package:flutter_e_ticket/Screens/Movie_Add_ByAdmin/Add_Movie.dart';
import 'package:flutter_e_ticket/Screens/Movie_List/viewMovies.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case 'AddMovie':
        return MaterialPageRoute(builder: (_) => AddMovie());
      case '/':
        return MaterialPageRoute(builder: (_) => MovieViewPublic());
      case 'BookedTickets':
        return MaterialPageRoute(builder: (_) => BookedTickets());
    }
  }
}
