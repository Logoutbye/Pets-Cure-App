import 'package:flutter/material.dart';
import 'package:mvvm_practice_app/res/components/my_static_component%20.dart';
import 'package:mvvm_practice_app/utils/routes/routes.dart';
import 'package:mvvm_practice_app/utils/routes/routes_names.dart';
import 'package:mvvm_practice_app/view/auth_ui/LoginScreen.dart';
import 'package:mvvm_practice_app/view/chats/all_chats_screen.dart';
import 'package:mvvm_practice_app/view/pets_market_ui/PetsMarket.dart';
import 'package:mvvm_practice_app/view/pets_market_ui/grid_view_pets_market.dart';
import 'package:mvvm_practice_app/view/pets_market_ui/pets_registration.dart';
import 'package:mvvm_practice_app/view/users_ui/all_doctors.dart';
import 'package:mvvm_practice_app/view/users_ui/all_hospitals.dart';
import 'package:mvvm_practice_app/view/users_ui/user_profile/edit_profile.dart';
import 'package:mvvm_practice_app/view/users_ui/home_screen.dart';
import 'package:mvvm_practice_app/view_model/all_pets_petsmarket_post_view_model.dart';
import 'package:mvvm_practice_app/view_model/auth_view_model.dart';
<<<<<<< HEAD
import 'package:mvvm_practice_app/view_model/update_user_profile_image_view_model.dart';
=======
import 'package:mvvm_practice_app/view_model/get_user_by_id_view_model.dart';
>>>>>>> 8030b0fc9674ec9345a132465bb93fa2050b9413
import 'package:mvvm_practice_app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('isLogedIn') ?? false;
  final userId = await prefs.getInt('userId') ?? 0;
  runApp(MyApp(
    isUserLogedIn: showHome,
    userId: userId,
  ));
}

class MyApp extends StatelessWidget {
  final bool isUserLogedIn;
  final int userId;

  const MyApp({super.key, required this.isUserLogedIn, required this.userId});

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
<<<<<<< HEAD
        ChangeNotifierProvider(
            create: (_) => UpdateUserProfileImageViewModel()),
=======
        ChangeNotifierProvider(create: (_) => GetUserByIdViewModel()),
>>>>>>> 8030b0fc9674ec9345a132465bb93fa2050b9413
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
