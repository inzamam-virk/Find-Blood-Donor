import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:term_project1/pages/phone_verify.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = 'home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            leading: null,
            backgroundColor: Colors.redAccent,
          ),
          body: Form(
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin:const EdgeInsets.only(top: 100),
                    child: Image.asset('assets/images/image1.jpg',height: 90,width: 90 ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("Donate To Save Life"),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Connecting Blood Donor With Recipient"),
                  const SizedBox(
                    height: 150,
                  ),
                  CupertinoButton(
                    onPressed: (){
                      Navigator.pushNamed(context, VerifyNumber.id);
                      },
                    child: const Text("CONTINUE WITH PHONE NUMBER"),
                    color: Colors.redAccent,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("By signing in ,you agree our"),
                      TextButton(onPressed: (){}, child: const Text("terms of service"))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("and"),
                      TextButton(onPressed: (){}, child: const Text("privacy policy"))

                    ],
                  )
                ],
              ),
            ),
          )
        );
  }
}
