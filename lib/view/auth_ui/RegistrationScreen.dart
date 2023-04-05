import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mvvm_practice_app/res/components/round_button.dart';
import 'package:mvvm_practice_app/res/my_app_colors.dart';
import 'package:mvvm_practice_app/utils/utils.dart';
import 'package:mvvm_practice_app/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController mobileNumberTextController = TextEditingController();
  TextEditingController PasswordTextController = TextEditingController();
  TextEditingController nameTextControl = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
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
    final authViewModel = Provider.of<AuthViewModel>(context);
    return ModalProgressHUD(
      inAsyncCall: authViewModel.signUploading,
      progressIndicator: Lottie.asset(
        "assets/lottie/loading.json",
        width: 100,
        fit: BoxFit.fill,
      ),
      child: Scaffold(
        //  backgroundColor: MyColors.KWhite,
        appBar: AppBar(
          backgroundColor: MyColors.kPrimary,
          foregroundColor: MyColors.KWhite,
          centerTitle: true,
          title: Text(
            'Create Account',
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
          child: 
          SingleChildScrollView(
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
                            height: MediaQuery.of(context).size.height / 1.55,
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
                                          'It\'s quick and easy !',
                                          style: TextStyle(
                                            color: MyColors.kPrimary,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      // Name  Textfield
                                      Container(
                                        // color: Colors.red,
                                        child: TextField(
                                          controller: nameTextControl,
                                          maxLength: 60,
                                          onTap: () {},
                                          keyboardType: TextInputType.name,
                                          // inputFormatters: [
                                          //   FilteringTextInputFormatter.digitsOnly,
                                          // ],
                                          style: TextStyle(
                                            color: MyColors.kBlack,
                                            // fontSize: 18,
                                          ),
                                          decoration: InputDecoration(
                                            // hintText: 'User',
                                            labelText: 'Name',
                                            labelStyle: TextStyle(
                                                color: MyColors.kPrimary),
                                            hintStyle: TextStyle(
                                                color: MyColors.kPrimary),
                                            enabledBorder:
                                                new OutlineInputBorder(
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

                                      // Mobile number text field
                                      Container(
                                        // color: Colors.red,
                                        child: TextField(
                                          controller:
                                              mobileNumberTextController,
                                          maxLength: 11,
                                          onTap: () {},
                                          keyboardType: TextInputType.number,
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
                                            enabledBorder:
                                                new OutlineInputBorder(
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

                                      // Email  Textfield
                                      Container(
                                        // color: Colors.red,
                                        child: TextField(
                                          controller: emailTextController,
                                          maxLength: 60,
                                          onTap: () {},
                                          keyboardType: TextInputType.name,
                                          // inputFormatters: [
                                          //   FilteringTextInputFormatter.digitsOnly,
                                          // ],
                                          style: TextStyle(
                                            color: MyColors.kBlack,
                                            // fontSize: 18,
                                          ),
                                          decoration: InputDecoration(
                                            hintText: 'example@gmail.com',
                                            labelText: 'Email',
                                            labelStyle: TextStyle(
                                                color: MyColors.kPrimary),
                                            hintStyle: TextStyle(
                                                color: MyColors.kPrimary),
                                            enabledBorder:
                                                new OutlineInputBorder(
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
                                            prefixIcon:
                                                Icon(Icons.email_outlined),
                                          ),
                                        ),
                                      ),

                                      // Password TextField
                                      Container(
                                        // color: Colors.red,
                                        child: TextField(
                                          controller: PasswordTextController,
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
                                            enabledBorder:
                                                new OutlineInputBorder(
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
                                        title: 'Sign Up',
                                        onpress: () {
                                          // nameTextControl.text.length < 1
                                          //     ? Utils.flushBarErrorMessage(
                                          //         "Name cannot be empty ", context)
                                          //     : mobileNumberTextController
                                          //             .text.isEmpty
                                          //         ? Utils.flushBarErrorMessage(
                                          //             "Please Enter Phone Number", context)
                                          //         : mobileNumberTextController
                                          //                     .text.length <
                                          //                 11
                                          //             ? Utils.flushBarErrorMessage(
                                          //                 "Please Enter Full Phone Number", context)
                                          //             : PasswordTextController
                                          //                         .text.length ==
                                          //                     0
                                          //                 ? Utils.flushBarErrorMessage(
                                          //                     "Please Enter Password",
                                          //                     context)
                                          //                 : PasswordTextController
                                          //                             .text
                                          //                             .length <
                                          //                         6
                                          //                     ? Utils.flushBarErrorMessage(
                                          //                         "Please Enter Minimum of 6 Characters",
                                          //                         context)
                                          //                     :
                                          ///////////////////

                                          Map data = {
                                            'name': nameTextControl.text,
                                            'mobile_no':
                                                mobileNumberTextController.text,
                                            'email': emailTextController.text,
                                            'token': PasswordTextController.text
                                          };

                                          authViewModel.SignUpApi(
                                              data, context);

                                          //////////////////

                                          // SignUP(
                                          //     nameTextControl.text,
                                          //     mobileNumberTextController.text,
                                          //     PasswordTextController.text);
                                        },
                                        width: 140,
                                      ),
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
      ),
    );
  }

  SignUP(var name, var mobile_number, var password) async {
    setState(() {
      _showSpinner = true;
    });
    try {
      Response response = await post(
        // Uri.parse("https://reqres.in/api/register"),
        Uri.parse("https://kawiishapps.com/api/postsignup"),

        body: {'name': name, 'mobile_no': mobile_number, 'token': password},
      );
      if (response.statusCode == 200) {
        print("/////////////////DATA in DAtabase");

        Utils.toastMessage("Account Created Successfully");
        Navigator.pop(context);
      } else {
        Utils.flushBarErrorMessage("Failed", context);
      }
    } catch (e) {
      print("Exception::${e}");
      Utils.flushBarErrorMessage("Sign Up Failed", context);
    }
    setState(() {
      _showSpinner = false;
    });
  }
}
