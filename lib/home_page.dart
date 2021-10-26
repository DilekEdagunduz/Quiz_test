import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_deneme1/data.dart';
import 'package:flutter_deneme1/deneme_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deneme1/views/sign_in_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Denemeler'),
        actions: [
          IconButton(
              icon: Icon(FirebaseAuth.instance.currentUser!=null
                  ? Icons.person
                  : Icons.person_add),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignInPage()));
              })
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Matematik denemesi"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DenemePage(denemeData: matematikSorular)));
            },
          ),
          ListTile(
            title: Text("Fizik denemesi"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DenemePage(denemeData: fizikSorular)));
            },
          ),
          ListTile(
            title: Text("Kimya denemesi"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DenemePage(denemeData: kimyaSorular)));
            },
          ),
          ListTile(
            title: Text("Biyoloji denemesi"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DenemePage(denemeData: biyolojiSorular)));
            },
          ),
          ListTile(
            title: Text("Türkçe denemesi"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DenemePage(denemeData: turkceSorular)));
            },
          ),
          ListTile(
            title: Text("Tarih denemesi"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DenemePage(denemeData: tarihSorular)));
            },
          ),
          ListTile(
            title: Text("Coğrafa denemesi"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DenemePage(denemeData: cografyaSorular)));
            },
          ),
          ListTile(
            title: Text("Felsefe denemesi"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DenemePage(denemeData: felsefeSorular)));
            },
          ),
          ListTile(
            title: Text("Yabancı dil denemesi"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DenemePage(denemeData: yabancidilSorular)));
            },
          ),
        ],
      ),
    );
  }
}
