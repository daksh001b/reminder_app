import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'conditional_builder.dart';

class Add_Reminder extends StatefulWidget {
  @override
  _Add_ReminderState createState() => _Add_ReminderState();
}

class _Add_ReminderState extends State<Add_Reminder> {
  //all variables used are defined here
  String title = '';
  String notes = '';
  bool isSwitched = false;
  bool isTime = false;
  DateTime _dateTime = null;
  DateTime time = null;
  DateTime initial_datetime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      //AppBar
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Add Reminder',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        titleSpacing: 20,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            //First Text Field to input title
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 2.0),
                color: Colors.white,
                child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  autofocus: true,
                  enableInteractiveSelection: true,
                  enableSuggestions: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.add_box,
                      color: Colors.blue,
                    ),
                    hintText: 'Title',
                    border: InputBorder.none,
                    focusColor: Colors.white,
                  ),
                  onChanged: (String str) {
                    setState(() {
                      title = str;
                    });
                  },
                ),
              ),
            ),
            //Second text field to input notes
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                margin: EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
                color: Colors.white,
                child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  autofocus: true,
                  enableInteractiveSelection: true,
                  enableSuggestions: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.note_add,
                      color: Colors.blue,
                    ),
                    hintText: 'Notes',
                    border: InputBorder.none,
                    focusColor: Colors.white,
                  ),
                  onChanged: (String str) {
                    setState(() {
                      notes = str;
                    });
                  },
                ),
              ),
            ),
            //following container contains the Remind me on a day function
            Container(
              margin: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 10.0),
              padding: EdgeInsets.only(left: 12.0),
              alignment: Alignment.topLeft,
              child: Row(
                children: <Widget>[
                  Text(
                    'Remind me on a Day',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blue.shade300,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 80),
                    child: Switch(
                      value: isSwitched,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: Colors.grey.shade300,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                      activeTrackColor: Colors.lightBlueAccent,
                      activeColor: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            ConditionalBuilder(
              condition: isSwitched,
              builder: (context) {
                return Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
                  // margin: EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 125.0,
                    child: CupertinoDatePicker(
                      backgroundColor: Colors.white,
                      initialDateTime: DateTime.now(),
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (dateTime) {
                        setState(() {
                          _dateTime = dateTime;
                        });
                        // print(_dateTime);
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

//following button was added to just check
//the working of the app
// FlatButton(
//   onPressed: () {
//     print(title);
//   },
//   child: Text(
//     'Save Reminder',
//     style: TextStyle(
//       color: Colors.white,
//       fontSize: 20.0,
//       fontWeight: FontWeight.bold,
//     ),
//   ),
// ),
