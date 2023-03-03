import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm_practice_app/res/my_app_colors.dart';
import 'package:mvvm_practice_app/view/users_ui/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobileNumber = TextEditingController();

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
     // backgroundColor: MyColors.kBg,
      appBar: AppBar(
        backgroundColor: MyColors.kPrimary,
        foregroundColor: MyColors.kBg,
        centerTitle: true,
        title: Text(
          'Create Account',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        leading: InkWell(
          onTap: () {},
          child: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SingleChildScrollView(
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
                        colorFilter:
                            ColorFilter.mode(Colors.black, BlendMode.softLight),
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
                              color: Colors.white,
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
                              color: Colors.white,
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
                                      maxLength: 11,
                                      onTap: () {},
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      style: TextStyle(
                                        color: Colors.black,
                                        // fontSize: 18,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: '03XXXXXXXXX',
                                        labelText: 'Mobile Number',
                                        labelStyle:
                                            TextStyle(color: MyColors.kTextColor),
                                        hintStyle:
                                            TextStyle(color: MyColors.kPrimary),
                                        enabledBorder: new OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Color.fromARGB(255, 180, 180, 180)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: MyColors.kPrimary),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        prefixIcon: Container(
                                          width: 10,
                                          height: 10,
                                          child:Icon(Icons.flag)
                                          //  Image.asset(
                                          //   'assets/images/pakflag.png',
                                          //   //fit: BoxFit.contain,
                                          // ),
                                        ),
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
                                      obscureText: true,
                                      onTap: () {},
                                      style: TextStyle(
                                        color: MyColors.kTextColor,
                                        // fontSize: 18,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'Password',
                                        labelText: 'Password',
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        hintStyle:
                                            TextStyle(color: MyColors.kPrimary),
                                        enabledBorder: new OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Color.fromARGB(255, 193, 198, 198),
                                            //Color.fromARGB(255, 115, 38, 38),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: MyColors.kPrimary),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color:
                                              MyColors.kPrimary,
                                          size: 35,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  // Login Button Code
                                  Container(
                                    width: 150,
                                    height: 50,
                                    //   color: MyColors.mylightBlackColor,
                                    child: OutlinedButton(
                                      child: Text(
                                        'Login ',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                          //Color.fromARGB(255, 115, 38, 38),
                                          // Color.fromARGB(255, 2, 140, 253),
                                          MyColors.kPrimary,
                                        ),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            side:
                                                BorderSide(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        //submit();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomeScreen()),
                                        );
                                      },
                                    ),
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
    );
  }
}
