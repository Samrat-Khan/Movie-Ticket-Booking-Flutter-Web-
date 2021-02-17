import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_e_ticket/CommonWidgets/appBar.dart';
import 'package:flutter_e_ticket/CommonWidgets/appDrawer.dart';

class AddMovie extends StatefulWidget {
  @override
  _AddMovieState createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  TextEditingController _movieName = TextEditingController();
  TextEditingController _movieDetail = TextEditingController();
  TextEditingController _ticketPrice = TextEditingController();
  TextEditingController _cast1 = TextEditingController();
  TextEditingController _cast5 = TextEditingController();
  TextEditingController _cast2 = TextEditingController();
  TextEditingController _cast3 = TextEditingController();
  TextEditingController _cast4 = TextEditingController();
  DateTime localDate;
  TimeOfDay localTime;
  var movieStartDate,
      movieEndDate,
      morningShowTime,
      noonShowTime,
      eveningShowTime,
      nightShowTime;
  Future<void> _showDatePicker(
      {@required BuildContext context, @required var movieDateVariable}) async {
    final DateTime dateTimePick = await showDatePicker(
      context: context,
      initialDate: localDate,
      firstDate: DateTime(2021, localDate.month, localDate.day),
      lastDate: DateTime(2022),
    );
    if (dateTimePick != null && dateTimePick != movieDateVariable) {
      setState(() {
        movieDateVariable == "movieStartDate"
            ? movieStartDate = dateTimePick
            : movieEndDate = dateTimePick;
      });
    }
  }

  Future<void> _showTimePicker(
      {@required BuildContext context, @required String showTime}) async {
    TimeOfDay timeOfDay = await showTimePicker(
        context: context,
        initialTime: localTime,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child,
          );
        });
    if (timeOfDay != null) {
      setState(() {
        switch (showTime) {
          case "morningShow":
            morningShowTime = timeOfDay;
            break;
          case "noonShow":
            noonShowTime = timeOfDay;
            break;
          case "eveningShow":
            eveningShowTime = timeOfDay;
            break;
          case "nightShow":
            nightShowTime = timeOfDay;
            break;
        }
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    localDate = DateTime.now();
    localTime = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar(),
      drawer: drawer(context: context),
      extendBodyBehindAppBar: true,
      body: Container(
        child: Stack(
          children: [
            Container(
              height: _height,
              width: _width,
              decoration: imageBoxDecoration(
                imagePath: "assets/images/movie-2.jpg",
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: new Container(
                  decoration: new BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            decoration: imageBoxDecoration(
                              imagePath: "assets/images/movie-1.jpg",
                              isBorderNeed: true,
                            ),
                            height: _height / 4,
                            width: _width / 4,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.photo_library,
                              size: 32,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Container(
                        width: _width / 6,
                        child: buildTextField(
                            textEditController: _movieName,
                            hintText: "Avengers Infinity War",
                            helperText: "Movie Name"),
                      ),
                      Container(
                        width: _width / 5,
                        child: buildTextField(
                            textEditController: _movieDetail,
                            helperText: "Movie Detail",
                            hintText: "This is Marvel Phase 3's most..."),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      datePickerColumn(
                          context: context, movieDate: "movieStartDate"),
                      Container(
                        width: _width / 17,
                        child: TextField(
                          textAlign: TextAlign.center,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.number,
                          controller: _ticketPrice,
                          decoration: InputDecoration(
                            prefixIcon: Icon(CupertinoIcons.money_dollar),
                            filled: true,
                            contentPadding: EdgeInsets.all(8),
                            border: InputBorder.none,
                            hintText: "20",
                            helperText: "Price",
                          ),
                        ),
                      ),
                      datePickerColumn(
                          context: context, movieDate: "movieEndDate"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      timePickerColumn(
                          context: context,
                          showTime: "morningShow",
                          timeOfShow: morningShowTime),
                      timePickerColumn(
                          context: context,
                          showTime: "noonShow",
                          timeOfShow: noonShowTime),
                      timePickerColumn(
                          context: context,
                          showTime: "eveningShow",
                          timeOfShow: eveningShowTime),
                      timePickerColumn(
                          context: context,
                          showTime: "nightShow",
                          timeOfShow: nightShowTime),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Stack(
                        children: [
                          castPhotoAndName(
                              width: _width, editingController: _cast1),
                          IconButton(
                            icon: Icon(
                              Icons.photo_library,
                              size: 32,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          castPhotoAndName(
                              width: _width, editingController: _cast2),
                          IconButton(
                            icon: Icon(
                              Icons.photo_library,
                              size: 32,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          castPhotoAndName(
                              width: _width, editingController: _cast3),
                          IconButton(
                            icon: Icon(
                              Icons.photo_library,
                              size: 32,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          castPhotoAndName(
                              width: _width, editingController: _cast4),
                          IconButton(
                            icon: Icon(
                              Icons.photo_library,
                              size: 32,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          castPhotoAndName(
                              width: _width, editingController: _cast5),
                          IconButton(
                            icon: Icon(
                              Icons.photo_library,
                              size: 32,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Reset"),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Submit"),
                      ),
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: null,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column castPhotoAndName(
      {double width, TextEditingController editingController}) {
    return Column(
      children: [
        Container(
          width: 90,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage("assets/images/face.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: width / 8,
          child: buildTextField(
            textEditController: editingController,
            hintText: "Cast Name",
          ),
        ),
      ],
    );
  }

  Column datePickerColumn({BuildContext context, String movieDate}) {
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: () =>
              _showDatePicker(context: context, movieDateVariable: movieDate),
          icon: Icon(Icons.calendar_today),
          label: Text(movieDate == "movieEndDate" ? "End Date" : "Start Date"),
        ),
        movieDate == "movieEndDate"
            ? Text(movieEndDate == null
                ? "Select Date"
                : "$movieEndDate".split(' ')[0])
            : Text(movieStartDate == null
                ? "Select Date"
                : "$movieStartDate".split(' ')[0]),
      ],
    );
  }

  Column timePickerColumn(
      {BuildContext context, String showTime, TimeOfDay timeOfShow}) {
    return Column(
      children: [
        ElevatedButton.icon(
            onPressed: () =>
                _showTimePicker(context: context, showTime: showTime),
            icon: Icon(Icons.lock_clock),
            label: Text(showTime)),
        Text(
          timeOfShow == null ? "Select time" : timeOfShow.format(context),
        ),
      ],
    );
  }

  TextField buildTextField({textEditController, helperText, hintText}) {
    return TextField(
      controller: textEditController,
      decoration: InputDecoration(
        filled: true,
        helperText: helperText,
        hintText: hintText,
        border: InputBorder.none,
      ),
    );
  }

  BoxDecoration imageBoxDecoration(
      {String imagePath, bool isBorderNeed: false}) {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.cover,
      ),
      borderRadius: !isBorderNeed ? null : BorderRadius.circular(8),
    );
  }
}
