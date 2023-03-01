import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
      //backgroundColor: Color.fromARGB(255, 92, 177, 247),
      //Color.fromARGB(255, 206, 211, 224),
      backgroundColor: Color.fromARGB(
          255, 93, 180, 251), //Color.fromARGB(255, 92, 177, 247),
      //Color.fromARGB(255, 206, 211, 224),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Create Account',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        leading: InkWell(
          splashColor: Colors.blue,
          onTap: () {},
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      // appBar: AppBar(
      //   title: Text('Login Screen'),
      //   centerTitle: true,
      // ),
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
                      color: Color.fromARGB(255, 2, 140, 253),
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
                            'Welecom!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 15,
                              spreadRadius: 2,
                              offset: Offset(
                                0,
                                5,
                              ), // Shadow position
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
                                        color: Color.fromARGB(255, 2, 140, 253),
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
                                        fontSize: 18,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: '03XXXXXXXXX',
                                        labelText: 'Mobile Number',
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        hintStyle:
                                            TextStyle(color: Colors.black),
                                        enabledBorder: new OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        prefixIcon: Container(
                                          width: 10,
                                          height: 10,
                                          child: Image.asset(
                                            'assets/images/pakflag.png',
                                            //fit: BoxFit.contain,
                                          ),
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
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'Password',
                                        labelText: 'Password',
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        hintStyle:
                                            TextStyle(color: Colors.black),
                                        enabledBorder: new OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            //Color.fromARGB(255, 115, 38, 38),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color:
                                              Color.fromARGB(255, 2, 140, 253),
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
                                          Color.fromARGB(255, 2, 140, 253),
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
