import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauth/Screens/up.dart';
import 'package:firebaseauth/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:firebaseauth/reusable_widget/reusable.dart';
import 'package:firebaseauth/Screens/home.dart';

class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text("Sign in Failed"),
      content: Text("Wrong email or password"),
      actions: [],
    );
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"), fit: BoxFit.cover)),
      // decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //         colors: [hexStringToColor("cc2b5e"), hexStringToColor("753a88")],
      //         begin: Alignment.topCenter,
      //         end: Alignment.bottomCenter)),
      child: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.fromLTRB(
            15, MediaQuery.of(context).size.height * 0.2, 15, 0),
        child: Column(
          children: <Widget>[
            logoWidget("assets/images/logoo.png"),
            SizedBox(
              height: 30,
            ),
            reusableTextField("Enter Email", Icons.person_outline, false,
                emailTextController),
            SizedBox(
              height: 20,
            ),
            reusableTextField("Enter Password", Icons.lock_outline, true,
                passwordTextController),
            SizedBox(
              height: 20,
            ),
            inupbutton(context, true, () {
              FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: emailTextController.text,
                      password: passwordTextController.text)
                  .then((value) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => home()));
              }).onError((error, stackTrace) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    });
              });
            }),
            inupoption()
          ],
        ),
      )),
    ));
  }

  Row inupoption() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text("Don't have account?",
          style: TextStyle(color: Colors.white70)),
      GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => up()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ))
    ]);
  }
}

Widget forgetPassword(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 35,
    alignment: Alignment.bottomRight,
    child: TextButton(
      child: const Text(
        "Forgot Password?",
        style: TextStyle(color: Colors.white70),
        textAlign: TextAlign.right,
      ),
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => up())),
    ),
  );
}
