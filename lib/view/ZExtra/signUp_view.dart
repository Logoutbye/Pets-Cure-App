import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_practice_app/res/components/round_button.dart';
import 'package:mvvm_practice_app/utils/routes/routes_names.dart';
import 'package:mvvm_practice_app/utils/utils.dart';
import 'package:mvvm_practice_app/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  // for hiding and unhiding password
  ValueNotifier<bool> _obsecureText = ValueNotifier<bool>(true);

  // textfield controller
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();

  // focus nodes
  var emialFocusNode = FocusNode();
  var passwordFocusNode = FocusNode();

  // dispose all the things to free the Ram

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emialFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsecureText.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emialFocusNode,
                onSubmitted: (value) {
                  Utils.fieldfocusChange(
                      context, emialFocusNode, passwordFocusNode);
                },
                decoration: InputDecoration(
                  hintText: 'Email',
                  label: Text('Email'),
                  prefixIcon: Icon(Icons.alternate_email_sharp),
                ),
              ),
              ValueListenableBuilder(
                  valueListenable: _obsecureText,
                  builder: (context, value, child) {
                    return TextField(
                      controller: _passwordController,
                      obscureText: _obsecureText.value,
                      focusNode: passwordFocusNode,
                      onSubmitted: (value) {},
                      decoration: InputDecoration(
                        hintText: 'Password',
                        label: Text('Password'),
                        prefixIcon: Icon(Icons.password),
                        suffixIcon: InkWell(
                          onTap: () {
                            _obsecureText.value = !_obsecureText.value;
                          },
                          child: Icon(_obsecureText.value
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                    );
                  }),
              SizedBox(
                height: height * 0.085,
              ),
              RoundButton(
                  title: 'SignUp',
                  loading: authViewModel.signUploading,
                  onpress: () {
                    if (_emailController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          'Email Field is empty', context);
                    } else if (_passwordController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          'Password Field is empty', context);
                    } else if (_passwordController.text.length < 6) {
                      Utils.flushBarErrorMessage(
                          'Password lenght is less then 6 characters', context);
                    } else {
                      // Calling the Login Api From Button
                      Map data = {
                        'email': _emailController.text.toString(),
                        'password': _passwordController.text.toString(),
                      };
                      authViewModel.SignUpApi(data, context);
                      print('Api hit');
                    }
                  }),
              SizedBox(
                height: height * 0.03,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.login);
                  },
                  child: Text("Already have an account? Login! ")),
            ],
          ),
        ),
      ),
    );
  }
}
