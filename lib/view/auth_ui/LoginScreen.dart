import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mvvm_practice_app/res/components/my_static_component%20.dart';
import 'package:mvvm_practice_app/res/components/round_button.dart';
import 'package:mvvm_practice_app/res/my_app_colors.dart';
import 'package:mvvm_practice_app/utils/utils.dart';
import 'package:mvvm_practice_app/view/auth_ui/RegistrationScreen.dart';
import 'package:mvvm_practice_app/view/pets_market_ui/pets_registration.dart';
import 'package:mvvm_practice_app/view/users_ui/home_screen.dart';
import 'package:mvvm_practice_app/view_model/auth_view_model.dart';
import 'package:mvvm_practice_app/view_model/get_user_by_id_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

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
    var authViewModel = Provider.of<AuthViewModel>(context);
    final getUserByIdViewModel = Provider.of<GetUserByIdViewModel>(context);

    return ModalProgressHUD(
      inAsyncCall: authViewModel.forgotLoading,
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
                            height: MediaQuery.of(context).size.height / 1.9,
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

                                      // forgot password
                                      Container(
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: TextButton(
                                            onPressed: () async {
                                              if (mobileNumber.text.isEmpty) {
                                                Utils.flushBarErrorMessage(
                                                    'Pleas put your mobile number',
                                                    context);
                                              } else {
                                                await authViewModel
                                                    .fetchUserDataForForgotPasswordFromRepository(
                                                        mobileNumber.text
                                                            .trim(),
                                                        context);

                                                var userEmail;
                                                var userPasword;
                                                var userName;

                                                Future.delayed(
                                                    Duration(seconds: 6),
                                                    () async {
                                                  print(
                                                      "statement print after 10 sec");
                                                  // print(
                                                  //     "My List Length in View : ${authViewModel.userDataForForgotPassword.data!.length}");
                                                  if (authViewModel
                                                      .isEmailSend) {
                                                    // Utils.flushBarErrorMessage(
                                                    //     "Mobile number is not registor",
                                                    //     context);

                                                    var userFetchedData =
                                                        await authViewModel
                                                            .userDataForForgotPassword
                                                            .data![0];

                                                    userEmail = userFetchedData
                                                        .email
                                                        .toString();
                                                    userPasword =
                                                        userFetchedData.token
                                                            .toString();
                                                    userName = userFetchedData
                                                        .name
                                                        .toString();

                                                    await sendForgotPasswordEmail(
                                                        userEmail,
                                                        userPasword,
                                                        userName);
                                                  }
                                                });
                                                // fech data from api list

                                              }
                                            },
                                            child: Text('Forgot password!'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      RoundButton(
                                        title: 'Login',
                                        onpress: () async {
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
                                          //SignIn(mobileNumber, Password);
                                          if (mobileNumber.text.isEmpty) {
                                            Utils.flushBarErrorMessage(
                                                'Pleas put your mobile number',
                                                context);
                                          } else if (Password.text.isEmpty) {
                                            Utils.flushBarErrorMessage(
                                                'Pleas put your Password',
                                                context);
                                          } else {
                                            // hit login api
                                            await authViewModel
                                                .getLoginDatafromAuthRepository(
                                                    //mobileNumber.text.trim(),
                                                    mobileNumber.text,
                                                    Password.text,
                                                    //Password.text.trim(),
                                                    context);
                                            //hit get user by id api to store data in shared prefrences so that we can later get the user data where needed

                                            Future.delayed(
                                              Duration(seconds: 4),
                                              () async {
                                                if (kDebugMode) {
                                                  print(
                                                      "Print message after 4 sec");
                                                }
                                                if (authViewModel
                                                    .isUserLoginDataFetched) {
                                                  var userFetchedData =
                                                      await authViewModel
                                                          .userDataForLogin
                                                          .data![0];

                                                  if (mobileNumber.text ==
                                                          userFetchedData
                                                              .mobileNo &&
                                                      Password.text ==
                                                          userFetchedData
                                                              .token) {
                                                    // Shared prefrences code
                                                    var prefs =
                                                        await SharedPreferences
                                                            .getInstance();
                                                    await prefs.setBool(
                                                        'isLogedIn', true);
                                                    await prefs.setInt('userId',
                                                        userFetchedData.id!);

                                                    // stroing true in static variable for session
                                                    MySharedPrefencesSessionHandling
                                                        .isUserLogedIn = true;
                                                    //storing data of get data by user id
                                                    //MySharedPrefencesSessionHandling
                                                    //.userId;

                                                    var id = userFetchedData.id;
                                                    print("check::${id}");

                                                    // await getUserByIdViewModel
                                                    //     .getUserByIdDatafromRepository(
                                                    //         id, context);
                                                    MySharedPrefencesSessionHandling
                                                        .setUserDataInSharedPreferences(
                                                            userFetchedData
                                                                .name,
                                                            userFetchedData
                                                                .mobileNo,
                                                            userFetchedData
                                                                .email,
                                                            userFetchedData
                                                                .userImage,
                                                            userFetchedData
                                                                .token);
                                                    // MySharedPrefencesSessionHandling
                                                    //         .name =
                                                    //     getUserByIdViewModel
                                                    //         .getUSerDataById
                                                    //         .data?[0]
                                                    //         .name;
                                                    // MySharedPrefencesSessionHandling
                                                    //         .mobile_no =
                                                    //     getUserByIdViewModel
                                                    //         .getUSerDataById
                                                    //         .data?[0]
                                                    //         .mobileNo;
                                                    // MySharedPrefencesSessionHandling
                                                    //         .email =
                                                    //     getUserByIdViewModel
                                                    //         .getUSerDataById
                                                    //         .data?[0]
                                                    //         .email;
                                                    // MySharedPrefencesSessionHandling
                                                    //         .user_image =
                                                    //     getUserByIdViewModel
                                                    //         .getUSerDataById
                                                    //         .data?[0]
                                                    //         .userImage;
                                                    if (kDebugMode) {
                                                      print(
                                                          "storing User data by id ::${MySharedPrefencesSessionHandling.name}");
                                                      print(
                                                          "User data by id stored in sharedPrefrences successfulyy");
                                                    }
                                                    //Navigator.of(context).pop();
                                                    String navigateToPage =
                                                        MySharedPrefencesSessionHandling
                                                            .navigateToPage;
                                                    Navigator.of(context)
                                                        .pushReplacement(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) {
                                                      return navigateToPage ==
                                                              "HomeScreen"
                                                          ? HomeScreen()
                                                          : navigateToPage ==
                                                                  "PetsRegistration"
                                                              ? PetsRegistration()
                                                              : HomeScreen();
                                                    }));
                                                  }
                                                }
                                                // else {
                                                //   Utils.flushBarErrorMessage(
                                                //       "Invilid Credentials",
                                                //       context);
                                                // }
                                              },
                                            );
                                          }
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
                                          padding:
                                              const EdgeInsets.only(top: 30),
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
                                                  Text(
                                                      "Dont have an account? "),
                                                  Text(
                                                    "Create Now",
                                                    style: TextStyle(
                                                        color:
                                                            MyColors.kPrimary,
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
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) =>  HomeScreen()),
        // );
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

  Future<Map<String, dynamic>> sendForgotPasswordEmail(
      String userEmail, String userPassword, String userName) async {
    String apiKey =
        "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";
    String url = "https://api.sendinblue.com/v3/smtp/email";

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "api-key": apiKey,
    };

    String body = jsonEncode({
      "sender": {"email": "petscure@gmail.com", "name": "Pets Cure App"},
      "to": [
        {"email": "$userEmail", "name": "$userName"}
      ],
      "subject": "Pets Cure Forgot Password",
      "htmlContent":
          "<h3> Your Pets Cure App login passwors is: </h3> <p>$userPassword@</p>",
    });

    http.Response response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    late Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    print("My json Response : $jsonResponse");

    return jsonResponse;
  }
}
