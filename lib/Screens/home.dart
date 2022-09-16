import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauth/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebaseauth/Screens/in.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4")
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Center(
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    height: 70.0,
                    width: 220.0,
                    child: ElevatedButton(
                      child: Text(
                        "LOGOUT",
                        style: TextStyle(
                            color: Colors.white,
                            // backgroundColor: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w700),
                      ),
                      onPressed: () {
                        print("signed out");
                        FirebaseAuth.instance.signOut().then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => signin()));
                        });
                      },
                    )))));
  }
}
