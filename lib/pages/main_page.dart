import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:term_project1/pages/donor_page1.dart';
import 'package:term_project1/pages/first_page.dart';
import 'phone_verify.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);
  static const String id = 'main-page';

  @override
  State<MainPage> createState() => _MainPageState();
}

Widget Drawerr() {
  return Drawer(
    backgroundColor: Colors.white,
    child: Column(
      children: [
        Container(
          padding:const EdgeInsets.fromLTRB(100, 100,100, 30),
          color: Colors.redAccent,
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  child: Image.asset("term_project1/assets/images/Me.jpg"),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text("+923039363244",style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
      ],
    ),
  );
}

class _MainPageState extends State<MainPage> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawerr(),
        appBar: AppBar(
          actions: [
            FloatingActionButton(onPressed: ()async{
              await auth.signOut();
              Navigator.pushNamed(context, HomePage.id);

            },
              child:const Icon(Icons.logout),
              backgroundColor: Colors.redAccent,
              elevation: 0,

            ),
          ],
          backgroundColor: Colors.redAccent,
        ),
        body: Form(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Container(
                  padding:const EdgeInsets.all(30),
                  child: CupertinoButton(child:const Text("Place a request",style: TextStyle(color: Colors.white),),
                      color: Colors.redAccent,
                      minSize: 130,
                      onPressed: (){}
                      ),
                ),
                // const SizedBox(
                //   height: 30,
                // ),
                Container(
                  padding:const EdgeInsets.all(30),
                  child: CupertinoButton(child:const Text("Join as a DONOR",style: TextStyle(color: Colors.white),),
                      color: Colors.redAccent,
                      minSize: 130,
                      onPressed: (){
                        Navigator.pushNamed(context, DonorInfo.id);
                      }
                      ),
                ),
                // const SizedBox(
                //   height: 30,
                // ),
                Container(
                  padding:const EdgeInsets.all(30),
                  child: CupertinoButton(child: const Text("Share with friends",style: TextStyle(color: Colors.white),),
                      color: Colors.redAccent,
                      padding:const EdgeInsets.all(20),
                      onPressed: (){
                      }
                      ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
