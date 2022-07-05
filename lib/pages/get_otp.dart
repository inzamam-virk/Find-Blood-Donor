import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:term_project1/pages/main_page.dart';
import 'phone_verify.dart';

class GetOtp extends StatefulWidget {
  GetOtp({Key? key}) : super(key: key);
  static const String id = 'get-otp';

  @override
  State<GetOtp> createState() => _GetOtpState();
}

class _GetOtpState extends State<GetOtp> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final String text = _controller.text;
      _controller.value = _controller.value.copyWith(
        text: text,
        selection:
        TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,

      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            leading: IconButton (icon:const Icon(Icons.arrow_back),onPressed: ()
            {Navigator.pop(context, false);}),
            backgroundColor: Colors.redAccent),
        body: Form(
          key: _FormKey,
          child: Column(
            children: [
              Container(child: Image.asset('assets/images/image2.png'),
                height: 200,
                width: 200,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Verification",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              const SizedBox(
                height: 10,
              ),
              const Text("Please enter otp sent to your phone number"),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding:const EdgeInsets.all(50),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length<=3 || value.length>=5) {
                      return 'Please enter correct OTP';
                    }
                  },
                  decoration:const InputDecoration(labelText: 'Enter OTP Here'),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CupertinoButton(child: const Text("Verify"),
                  color: Colors.redAccent,
                  onPressed: (){
                if(_FormKey.currentState!.validate()){
                Navigator.pushNamed(context, MainPage.id);
                }

                  }
              )

            ],
          ),
        ),

      ),
    );
  }
}
