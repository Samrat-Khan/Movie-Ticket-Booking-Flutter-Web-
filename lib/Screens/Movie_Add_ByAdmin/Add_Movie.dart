import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_e_ticket/CommonWidgets/appBar.dart';
import 'package:flutter_e_ticket/CommonWidgets/appDrawer.dart';
import 'package:flutter_e_ticket/Services/addMovieService.dart';
import 'package:flutter_e_ticket/Services/photoPickerService.dart';

class AddMovie extends StatefulWidget {
  @override
  _AddMovieState createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  TextEditingController _movieName = TextEditingController();
  TextEditingController _movieDetail = TextEditingController();
  TextEditingController _ticketPrice = TextEditingController();
  TextEditingController _cast1Name = TextEditingController();
  TextEditingController _cast5Name = TextEditingController();
  TextEditingController _cast2Name = TextEditingController();
  TextEditingController _cast3Name = TextEditingController();
  TextEditingController _cast4Name = TextEditingController();
  DateTime localDate;
  TimeOfDay localTime;
  var movieStartDate,
      movieEndDate,
      morningShowTime,
      noonShowTime,
      eveningShowTime,
      nightShowTime;
  Uint8List moviePosterImage,
      cast1Image,
      cast2Image,
      cast3Image,
      cast4Image,
      cast5Image;

  ImagePicker imagePicker = ImagePicker();
  UploadMovieToFirebase uploadMovieToFirebase = UploadMovieToFirebase();
  selectImage({@required String whatImage}) async {
    Uint8List tempImage = await imagePicker.pickPhoto();

    if (tempImage != null) {
      switch (whatImage) {
        case "moviePoster":
          {
            setState(() {
              moviePosterImage = tempImage;
            });

            break;
          }
        case "cast_1":
          {
            setState(() {
              cast1Image = tempImage;
            });

            break;
          }
        case "cast_2":
          {
            setState(() {
              cast2Image = tempImage;
            });

            break;
          }
        case "cast_3":
          {
            setState(() {
              cast3Image = tempImage;
            });

            break;
          }
        case "cast_4":
          {
            setState(() {
              cast4Image = tempImage;
            });

            break;
          }
        case "cast_5":
          {
            setState(() {
              cast5Image = tempImage;
            });

            break;
          }
      }
    }
  }

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

  Future uploadMovie() async {
    try {
      await uploadMovieToFirebase
          .uploadMovieDetail(
              movieTitle: _movieName.text,
              aboutMovie: _movieDetail.text,
              moviePoster: moviePosterImage,
              ticketPrice: int.parse(_ticketPrice.text),
              cast_1: _cast1Name.text,
              cast1Photo: cast1Image,
              cast_2: _cast2Name.text,
              cast2Photo: cast2Image,
              cast_3: _cast3Name.text,
              cast3Photo: cast3Image,
              cast_4: _cast4Name.text,
              cast4Photo: cast4Image,
              cast_5: _cast5Name.text,
              cast5Photo: cast5Image,
              startDate: movieStartDate,
              endDate: movieEndDate,
              morningShow: morningShowTime,
              noonShow: noonShowTime,
              eveningShow: eveningShowTime,
              nightShow: nightShowTime,
              context: context)
          .whenComplete(() => clearAllVariable());
    } catch (e) {
      print("Soming happening due to button press $e");
    }
  }

  clearAllVariable() {
    setState(() {
      morningShowTime = null;
      noonShowTime = null;
      eveningShowTime = null;
      nightShowTime = null;
      movieStartDate = null;
      movieEndDate = null;
      cast1Image = null;
      cast2Image = null;
      cast3Image = null;
      cast4Image = null;
      cast5Image = null;
      moviePosterImage = null;
    });

    _cast1Name.clear();
    _cast2Name.clear();
    _cast3Name.clear();
    _cast4Name.clear();
    _cast5Name.clear();
    _ticketPrice.clear();
    _movieName.clear();
    _movieDetail.clear();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    localDate = DateTime.now();
    localTime = TimeOfDay.now();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cast5Name.dispose();
    _cast4Name.dispose();
    _cast3Name.dispose();
    _cast2Name.dispose();
    _cast1Name.dispose();
    _ticketPrice.dispose();
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
                      GestureDetector(
                        child: Container(
                          decoration: imageBoxDecoration(
                              imagePath: "assets/images/movie-1.jpg",
                              isBorderNeed: true,
                              uInt8listImage: moviePosterImage),
                          height: _height / 4,
                          width: _width / 4,
                        ),
                        onTap: () => selectImage(whatImage: "moviePoster"),
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
                              width: _width,
                              editingController: _cast1Name,
                              uInt8listImage: cast1Image),
                          IconButton(
                            icon: Icon(
                              Icons.photo_library,
                              size: 32,
                              color: Colors.white,
                            ),
                            onPressed: () => selectImage(whatImage: "cast_1"),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          castPhotoAndName(
                              width: _width,
                              editingController: _cast2Name,
                              uInt8listImage: cast2Image),
                          IconButton(
                            icon: Icon(
                              Icons.photo_library,
                              size: 32,
                              color: Colors.white,
                            ),
                            onPressed: () => selectImage(whatImage: "cast_2"),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          castPhotoAndName(
                              width: _width,
                              editingController: _cast3Name,
                              uInt8listImage: cast3Image),
                          IconButton(
                            icon: Icon(
                              Icons.photo_library,
                              size: 32,
                              color: Colors.white,
                            ),
                            onPressed: () => selectImage(whatImage: "cast_3"),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          castPhotoAndName(
                              width: _width,
                              editingController: _cast4Name,
                              uInt8listImage: cast4Image),
                          IconButton(
                            icon: Icon(
                              Icons.photo_library,
                              size: 32,
                              color: Colors.white,
                            ),
                            onPressed: () => selectImage(whatImage: "cast_4"),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          castPhotoAndName(
                              width: _width,
                              editingController: _cast5Name,
                              uInt8listImage: cast5Image),
                          IconButton(
                            icon: Icon(
                              Icons.photo_library,
                              size: 32,
                              color: Colors.white,
                            ),
                            onPressed: () => selectImage(whatImage: "cast_5"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => clearAllVariable(),
                        child: Text("Reset"),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        onPressed: () => uploadMovie(),
                        child: Text("Submit"),
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
      {double width,
      TextEditingController editingController,
      Uint8List uInt8listImage}) {
    return Column(
      children: [
        Container(
          width: 90,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: uInt8listImage == null
                  ? AssetImage("assets/images/face.png")
                  : MemoryImage(uInt8listImage),
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
      {String imagePath, bool isBorderNeed: false, Uint8List uInt8listImage}) {
    return BoxDecoration(
      image: DecorationImage(
        image: uInt8listImage == null
            ? AssetImage(imagePath)
            : MemoryImage(uInt8listImage),
        fit: BoxFit.cover,
      ),
      borderRadius: !isBorderNeed ? null : BorderRadius.circular(8),
    );
  }
}
