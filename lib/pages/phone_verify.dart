import 'package:firebase_auth/firebase_auth.dart';
import 'package:term_project1/pages/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum MobileVerificationState{
  SHOW_MOBILE_NUMBER_STATE,
  SHOW_OTP_STATE,
}

class VerifyNumber extends StatefulWidget {
  const VerifyNumber({Key? key}) : super(key: key);
  static const String id = 'verify-page';

  @override
  State<VerifyNumber> createState() => _VerifyNumberState();
}


class _VerifyNumberState extends State<VerifyNumber> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  MobileVerificationState currentState = MobileVerificationState.SHOW_MOBILE_NUMBER_STATE;
  FirebaseAuth auth = FirebaseAuth.instance;
  late String verificationId ;
  bool loader = false;



  @override
  void initState() {
    super.initState();
    phoneController.addListener(() {
      final String text = phoneController.text.toLowerCase();
      phoneController.value = phoneController.value.copyWith(
        text: text,
        selection:
        TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,

      );
    });
  }

  void signinWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCredential) async{
    setState(() {
      loader = true;
    });

    try {
      final authCredential = await auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        loader = false;
        if(authCredential.user!=null){
          Navigator.pushNamed(context, MainPage.id);
        }
        _scaffoldKey.currentState!.showSnackBar(const SnackBar(content: Text("Verification Failed")));

      });

    } on FirebaseAuthException catch (e) {
      setState(() {
        loader = false;
      });
      _scaffoldKey.currentState!.showSnackBar(const SnackBar(content: Text("Verification Failed")));
    }
  }

  getMobileForWidget(context){
   return SingleChildScrollView(
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
       const Text("To get OTP please enter your phone number BELOW"),
       const SizedBox(
         height: 30,
       ),
       Container(
         padding:const EdgeInsets.all(50),
         child: TextFormField(
           controller: phoneController,
           validator: (value) {
             if (value == null || value.isEmpty || value.length<=10 || value.length>=12) {
               return 'Please enter correct number';
             }
           },
           decoration:const InputDecoration(
               hintText: 'e.g +923XX XXXXXXX',
               border: OutlineInputBorder(),
               labelText: 'Enter Your Number'),
           keyboardType: TextInputType.text,

         ),
       ),
       const SizedBox(
         height: 10,
       ),
       CupertinoButton(child:const Text("Get OTP"),
           color: Colors.redAccent,
           onPressed: () async{
             setState(() {
               loader = true;
             });

             await auth.verifyPhoneNumber(
                 phoneNumber: phoneController.text,
                 verificationCompleted: (PhoneAuthCredential credential)async{
                   setState(() {
                     loader = false;
                   });
                 },
                 verificationFailed: (verificationFailed)async{
                   setState(() {
                     loader = false;
                   });
                   _scaffoldKey.currentState!.showSnackBar(const SnackBar(content: Text("Verification FAILED")));

                 },
                 codeSent: (verificationId,resendToken)async{
                   setState(() {
                     loader = false;
                     currentState = MobileVerificationState.SHOW_OTP_STATE;
                     this.verificationId = verificationId;

                   });
                 },
                 codeAutoRetrievalTimeout: (verificationId)async{

                 }
             );

           }
       ),
     ],
   )
   );
  }
  getOtpFormWidget(context){
    return SingleChildScrollView(
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
              controller: otpController,
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
              onPressed: ()async{

            PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otpController.text);
            signinWithPhoneAuthCredential(phoneAuthCredential);

              }
          )

        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
        leading: IconButton (icon:const Icon(Icons.arrow_back),onPressed: ()
            {Navigator.pop(context, false);}),
            backgroundColor: Colors.redAccent),
        body: Form(
          child:loader ?const Center(child: CircularProgressIndicator(),): currentState == MobileVerificationState.SHOW_MOBILE_NUMBER_STATE?
          getMobileForWidget(context):
              getOtpFormWidget(context)
        ),

      ),
    );
  }
}
