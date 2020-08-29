import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/Functionality/auth.dart';
import 'package:reminder_app/Models/user.dart';
import 'package:reminder_app/Pages/Authentication.dart';
import 'package:reminder_app/Pages/Home/Reminders_Home.dart';
import 'package:reminder_app/Functionality/Database.dart';
import 'sign_up.dart';
import 'login.dart';
import 'edit_reminders.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    //DatabaseService(uid: user.uid);

    if (user == null)
      return Edit_Reminder();
    else {
      return reminders_Home();
    }
  }
}