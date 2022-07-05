import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:term_project1/pages/donor_page1.dart';
import 'package:term_project1/pages/first_page.dart';
import 'package:term_project1/pages/main_page.dart';
import 'package:term_project1/pages/main_page1.dart';
import 'package:term_project1/pages/phone_verify.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Find DONOR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      initialRoute: HomePage.id,
      routes: {
        MainPage.id : (context) => MainPage1(),
        Initializer.id : (context) => Initializer(),
        HomePage.id : (context) => HomePage(),
        VerifyNumber.id : (context) => VerifyNumber(),
        MainPage.id : (context) => MainPage(),
        DonorInfo.id : (context) => DonorInfo(),
      },
    );
  }
}

class Initializer extends StatefulWidget {
  static const String id = 'initializer';
  const Initializer({Key? key}) : super(key: key);

  @override
  _InitializerState createState() => _InitializerState();
}

class _InitializerState extends State<Initializer> {
  bool Loader = true;
  User? user;
  @override
  void initState(){
    super.initState();

    FirebaseAuth auth = FirebaseAuth.instance;
    user = auth.currentUser;

    Loader = false;
  }

  Widget build(BuildContext context) {
    return Loader? const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      )
    ) : user == null ? MainPage() : HomePage();

  }
}

