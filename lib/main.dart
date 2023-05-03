
import 'package:flutter/material.dart';
import 'package:mvvm_practice_app/res/components/my_static_component%20.dart';
import 'package:mvvm_practice_app/view/users_ui/home_screen.dart';
import 'package:mvvm_practice_app/view_model/all_pets_petsmarket_post_view_model.dart';
import 'package:mvvm_practice_app/view_model/auth_view_model.dart';
import 'package:mvvm_practice_app/view_model/delete_post_by_id_view_model.dart';
import 'package:mvvm_practice_app/view_model/get_user_by_id_view_model.dart';
import 'package:mvvm_practice_app/view_model/update_user_profile_image_view_model.dart';
import 'package:mvvm_practice_app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('isLogedIn') ?? false;
  final userId = await prefs.getInt('userId') ?? 0;
  //to get user data by id
  // final String? name = prefs.getString('name');
  // final String? mobile_no = prefs.getString('mobile_no');
  // final String? email = prefs.getString('email');
  // final String? user_image = prefs.getString('user_image');
  await MySharedPrefencesSessionHandling.getUserDataFromSharedPreferences();
  //this will check if user is logged in so that in drawer we can handle it easily
  await MySharedPrefencesSessionHandling.isUserLogedIn;

  runApp(MyApp(
    isUserLogedIn: showHome,
    userId: userId,
    // name: name,
    // mobile_no: mobile_no,
    // email: email,
    // user_image: user_image,
  ));
}

class MyApp extends StatelessWidget {
  final bool isUserLogedIn;
  final int userId;
  //to get user data by id
  // final String? name;
  // final String? mobile_no;
  // final String? email;
  // final String? user_image;

  const MyApp({
    super.key,
    required this.isUserLogedIn,
    required this.userId,
    // required this.name,
    // required this.mobile_no,
    // required this.email,
    // required this.user_image
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // assigning shared prefereces variable to static variables
    MySharedPrefencesSessionHandling.isUserLogedIn = isUserLogedIn;
    MySharedPrefencesSessionHandling.userId = userId;

    print("${MySharedPrefencesSessionHandling.isUserLogedIn = isUserLogedIn}");

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => AllPetsMarketPostPetViewModel()),
        ChangeNotifierProvider(create: (_) => DeletePostByIdViewModel()),
        ChangeNotifierProvider(
            create: (_) => UpdateUserProfileImageViewModel()),
        ChangeNotifierProvider(create: (_) => GetUserByIdViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pets Cure',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          // useMaterial3: true
        ),
        home: HomeScreen(),
        // it will be used later
        // initialRoute: RoutesName.splash,
        // onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
