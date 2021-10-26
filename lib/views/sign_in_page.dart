import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deneme1/services/auth.dart';
import 'package:flutter_deneme1/views/email_sign_in.dart';
import 'package:provider/provider.dart';

import '../widgets/my_raised_button.dart';
import './email_sign_in.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          icon: Icon(Icons.logout),
          onPressed: () async {
            Provider.of<Auth>(context, listen: false)
                .signOut()
                .then((value) => setState(() {}));

            print('cikis yapildi');
          },
        )
      ]),
      body: FirebaseAuth.instance.currentUser != null
          ? Center(
              child: Text("Giriş Yapıldı"),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'sign in page',
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MyRaisedButon(
                    child: Text('sign in anonymously'),
                    onPressed: () async {
                      final user =
                          await Provider.of<Auth>(context, listen: false)
                              .signInAnonymously();
                      // UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
                      if (user != null) {
                        setState(() {
                          Navigator.pop(context);
                        });
                      }
                      print(user.uid);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MyRaisedButon(
                    child: Text('sign in Email/PassWord'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmailSignInPage()));
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  /*
          MyRaisedButon(
            child: Text('google sign in '),s
            onPressed: () {},
          ) ,    */
                ],
              ),
            ),
    );
  }
}
