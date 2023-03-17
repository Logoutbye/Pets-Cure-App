import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mvvm_practice_app/res/components/round_button.dart';
import 'package:mvvm_practice_app/res/my_app_colors.dart';
import 'package:mvvm_practice_app/utils/utils.dart';
import 'package:mvvm_practice_app/view/auth_ui/RegistrationScreen.dart';
import 'package:mvvm_practice_app/view/users_ui/home_screen.dart';
import 'package:mvvm_practice_app/view_model/login_get_api_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController Password = TextEditingController();
  bool _showSpinner = false;

  //Function to send OTP to User
  // void submit() async {
  //   if (mobileNumber.text == "") return;

  //   var appSignatureID = await SmsAutoFill().getAppSignature;
  //   Map sendOtpData = {
  //     "mobile_number": mobileNumber.text,
  //     "app_signature_id": appSignatureID
  //   };
  //   print('My OTP Data : $sendOtpData');
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => const OTPVerfication()),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: MyColors.KWhite,
      appBar: AppBar(
        backgroundColor: MyColors.kPrimary,
        foregroundColor: MyColors.KWhite,
        centerTitle: true,
        title: Text(
          'Login to your Account',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        progressIndicator: Lottie.asset(
          "assets/lottie/loading.json",
          width: 100,
          fit: BoxFit.fill,
        ),
        dismissible: true,
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    // Welcome Container
                    Container(
                      decoration: BoxDecoration(
                        color: MyColors.kPrimary,
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              MyColors.kBlack, BlendMode.softLight),
                          image: AssetImage("assets/images/pet.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              'Welcome!',
                              style: TextStyle(
                                color: MyColors.KWhite,
                                fontSize: 40,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(
                              'Find Best Doctor for your pets care and sell and buy your pet.',
                              style: TextStyle(
                                color: MyColors.KWhite,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Coplete Login Form
                    Positioned(
                      top: MediaQuery.of(context).size.height / 3.8,
                      left: MediaQuery.of(context).size.height / 24,

                      // Main form Container
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: MediaQuery.of(context).size.height / 2,
                          decoration: BoxDecoration(
                            color: MyColors.kSecondary,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: MyColors.kPrimary,
                                // blurRadius: 15,
                                // spreadRadius: 2,
                                // offset: Offset(
                                //   0,
                                //   5,
                                // ), // Shadow position
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Center(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Login Text
                                    Container(
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                          color: MyColors.kPrimary,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    // Mobile Number Textfield
                                    Container(
                                      // color: Colors.red,
                                      child: TextField(
                                        controller: mobileNumber,
                                        // maxLength: 11,
                                        onTap: () {},
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        // inputFormatters: [
                                        //   FilteringTextInputFormatter.digitsOnly,
                                        // ],
                                        style: TextStyle(
                                          color: MyColors.kBlack,
                                          // fontSize: 18,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: '03XXXXXXXXX',
                                          labelText: 'Mobile Number',
                                          labelStyle: TextStyle(
                                              color: MyColors.kPrimary),
                                          hintStyle: TextStyle(
                                              color: MyColors.kPrimary),
                                          enabledBorder: new OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 180, 180, 180)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: MyColors.kPrimary),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          prefixIcon: Icon(Icons.flag),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    // Password TextField
                                    Container(
                                      // color: Colors.red,
                                      child: TextField(
                                        controller: Password,
                                        obscureText: true,
                                        onTap: () {},
                                        style: TextStyle(
                                          color: MyColors.kBlack,
                                          // fontSize: 18,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: 'Password',
                                          labelText: 'Password',
                                          labelStyle: TextStyle(
                                              color: MyColors.kPrimary),
                                          hintStyle: TextStyle(
                                              color: MyColors.kPrimary),
                                          enabledBorder: new OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 193, 198, 198),
                                              //Color.fromARGB(255, 115, 38, 38),
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: MyColors.kPrimary),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          prefixIcon: Icon(
                                            Icons.lock,
                                            // color:
                                            //     MyColors.kPrimary,
                                            // size: 25,
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      height: 30,
                                    ),
                                    RoundButton(
                                      title: 'Login',
                                      onpress: () {
                                        // mobileNumber.text.isEmpty
                                        //     ? Utils.flushBarErrorMessage(
                                        //         "Please Enter Phone Number",
                                        //         context)
                                        //     : mobileNumber.text.length < 11
                                        //         ? Utils.flushBarErrorMessage(
                                        //             "Please Enter Full Phone Number",
                                        //             context)
                                        //         : Password.text.length == 0
                                        //             ? Utils.flushBarErrorMessage(
                                        //                 "Please Enter Password",
                                        //                 context)
                                        //             : Password.text.length < 6
                                        //                 ? Utils.flushBarErrorMessage(
                                        //                     "Please Enter Minimum of 6 Characters",
                                        //                     context)
                                        //                 :
                                        SignIn(mobileNumber, Password);
                                      },
                                      width: 140,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RegistrationScreen()));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("Dont have an account? "),
                                                Text(
                                                  "Create Now",
                                                  style: TextStyle(
                                                      color: MyColors.kPrimary,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Main Form Container
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> getData(var name, var phone) async {
  //   var url =
  //       Uri.parse('https://kawiishapps.com/api/signup');
  //   var response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     // Success
  //     var data = json.decode(response.body);
  //     print("${data['mobile_no']}");
  //     // Check if data exists in database
  //     // Allow user to login if data exists
  //   } else {
  //     // Error
  //     print('Error: ${response.reasonPhrase}');
  //   }
  // }

  SignIn(var mobile_number, var password) async {
    setState(() {
      _showSpinner = true;
    });
    try {
      var request =
          http.Request('GET', Uri.parse('https://kawiishapps.com/api/signup'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        // var data = jsonDecode(await response.stream.bytesToString());
        // print("data from api ${data[0]},");

        // if (data['mobile_no'] == mobile_number && data['token'] == password) {
        Utils.toastMessage("Login In Successful");
        var prefs = await SharedPreferences.getInstance();
        prefs.setBool('showHome', true);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        // } else {
        //   Utils.flushBarErrorMessage("Please enter correct fileds", context);
        // }
      } else {
        print(response.reasonPhrase);
        Utils.flushBarErrorMessage("Log In Failed", context);
      }
    } catch (e) {
      print("Exception::${e}");
      Utils.flushBarErrorMessage("Sorry try again", context);
    }
    setState(() {
      _showSpinner = false;
    });
  }

  // List<LoginGetApiModel> model = [];
  // Future<List<LoginGetApiModel>> getPostApi(
  //     var mobile_number, var password) async {
  //   setState(() {
  //     _showSpinner = true;
  //   });
  //   try {
  //     final reponse =
  //         await http.get(Uri.parse("https://kawiishapps.com/api/signup"));
  //     if (reponse.statusCode == 200) {
  //       var data = jsonDecode(reponse.body);
  //       print(data['mobile_no']);
  //       for (var i in data) {
  //         model.add(LoginGetApiModel.fromJson(i));
  //       }
  //       print("llllll${model.length}");
  //       setState(() {
  //         _showSpinner = false;
  //       });
  //       return model;
  //     } else {
  //       return model;
  //     }
  //   } catch (e) {
  //     print("Exception::${e}");
  //     Utils.flushBarErrorMessage("Log In Failed", context);
  //   }
  //   setState(() {
  //     _showSpinner = false;
  //   });
  //   return model;
  // }
}
