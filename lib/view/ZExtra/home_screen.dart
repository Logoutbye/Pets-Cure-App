import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_practice_app/utils/routes/routes_names.dart';
import 'package:mvvm_practice_app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userSharedPrefrence = Provider.of<UserViewModel>(context);

    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            userSharedPrefrence.removeSession().then((value) {
              Navigator.pushNamed(context, RoutesName.login);
            }).onError((error, stackTrace) {});
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}
