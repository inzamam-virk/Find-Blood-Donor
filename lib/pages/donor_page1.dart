import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:term_project1/pages/main_page1.dart';
class DonorInfo extends StatelessWidget {
  const DonorInfo({Key? key}) : super(key: key);
  static const id = 'donor_info';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(backgroundColor: Colors.redAccent,),
    body: MyFormState()
    ));
  }
}



class MyFormState extends StatefulWidget {
  const MyFormState({Key? key}) : super(key: key);

  @override
  State<MyFormState> createState() => _MyFormState();
}

class _MyFormState extends State<MyFormState> {
  final _controller = TextEditingController();
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();

  final GlobalKey<FormState> _Key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final String text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: text,
        selection:
        TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,

      );
    });
  }

  GetForm(String hint,String label,TextEditingController c){
    return TextFormField(
      controller: c,
      
      validator: (value){
        if (value == null || value.isEmpty ) {
          return 'Please enter correct value';
        }
        return null;
    },
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        border:const OutlineInputBorder(),
      ),
    );
}

  @override
  Widget build(BuildContext context) {
    return Form(
          key: _Key,
          child: Container(
            padding:const EdgeInsets.all(40),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  GetForm("Name","Enter Your Name",_controller1),
                  const SizedBox(
                    height: 25,
                  ),
                  GetForm("Age","Enter Your Age",_controller2),
                  const SizedBox(
                    height: 25,
                  ),
                  GetForm("Address","Enter Your Address",_controller3),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding:const EdgeInsets.all(10),
                    height: 60,
                    width: 280,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      children:const [
                         Icon(Icons.upload_file),
                         Text("Upload your blood testing reports",style: TextStyle(color: Colors.black),),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  CupertinoButton(child:const Text("CONTINUE"),
                      color: Colors.redAccent,

                      onPressed: (){
                        if(_Key.currentState!.validate()){
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data'))
                          );
                        }
                      })

                ],
              ),
            ),
          ),
        );
  }
}
