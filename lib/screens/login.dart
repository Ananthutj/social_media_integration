// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unused_import, avoid_print


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:tokoto/screens/Homepage.dart';
import 'package:tokoto/screens/Homepage2.dart';


import '../services/firebase_services.dart';

class Login extends StatefulWidget {
  Map? _userData;
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        title: Text("Login"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 90),
            Container(
              width: 320,
              margin: EdgeInsets.only(left: 20),
              child: Image(
                image: AssetImage('assets/images/social.webp'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 25),
              width: 305,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[800],elevation: 3),
                onPressed: ()  async
                {
                  var details = await FirebaseServices().signInWithFacebook();
                  print(details);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen2(name: details['name'],imageUrl:details['picture']['data']['url'] ,email: details['email'])));
                   
                },
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(width: 15),
                    Container(
                      child: Icon(
                        Icons.facebook,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 25),
                    Text(
                      "Login with Facebook",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      thickness: 0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('OR'),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      thickness: 0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 0),
              width: 305,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 230, 234, 237),elevation: 3),
                onPressed: () async {
                  await FirebaseServices().signInWithGoogle();
                  Navigator.push(context, MaterialPageRoute(builder:(_)=> HomeScreen()));
                  
                },
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(width: 15),
                    Container(
                      height: 24,
                      child: Image(
                        image: AssetImage('assets/images/g1.png'),
                      ),
                    ),
                    SizedBox(width: 25),
                    Text(
                      "Sign In with Google",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 18, top: 25),
                child: Text(
                  "By Clicking on login ,you are accepting our Privacy Policy",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                )),
            Container(
                margin: EdgeInsets.only(left: 18, top: 5),
                child: Text(
                  "and Terms & Conditions",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
  
    Future<UserCredential>signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance
        .login(permissions: ['email','public_profile', ]);

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    
    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    }
}