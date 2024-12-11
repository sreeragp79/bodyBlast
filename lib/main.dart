import 'package:body_blast/Provider/adminProvider.dart';
import 'package:body_blast/Provider/loginProvider.dart';
import 'package:body_blast/Provider/userProvider.dart';
import 'package:body_blast/admin/Food%20List.dart';
import 'package:body_blast/admin/SupplementAdd.dart';
import 'package:body_blast/admin/WorkOut%20List.dart';
import 'package:body_blast/user/AddReview.dart';
import 'package:body_blast/user/Address.dart';
import 'package:body_blast/user/AgeSelection.dart';
import 'package:body_blast/user/Appointment.dart';
import 'package:body_blast/user/Bottom%20Navigation.dart';
import 'package:body_blast/user/CheckOut.dart';
import 'package:body_blast/user/ChooseWorkout.dart';
import 'package:body_blast/user/Edit%20Profile.dart';
import 'package:body_blast/user/Fill%20Your%20Profile.dart';
import 'package:body_blast/user/FoddDetails.dart';
import 'package:body_blast/user/Foods.dart';
import 'package:body_blast/user/GenderSelection.dart';
import 'package:body_blast/user/Get%20Premium.dart';
import 'package:body_blast/user/GoalSelection.dart';
import 'package:body_blast/user/Home%20Page.dart';
import 'package:body_blast/user/Instructor.dart';
import 'package:body_blast/user/LoginPage.dart';
import 'package:body_blast/user/Notification.dart';
import 'package:body_blast/user/OtpPage.dart';
import 'package:body_blast/user/Payment%20Page.dart';
import 'package:body_blast/user/PaymentCompleted.dart';
import 'package:body_blast/user/PaymentOption.dart';
import 'package:body_blast/user/Privacy%20Policy.dart';
import 'package:body_blast/user/Profile.dart';
import 'package:body_blast/user/Receipt.dart';
import 'package:body_blast/user/Reviews.dart';
import 'package:body_blast/user/SignUpPage.dart';
import 'package:body_blast/user/SliderPage.dart';
import 'package:body_blast/user/SplashScreen.dart';
import 'package:body_blast/user/Supplements.dart';
import 'package:body_blast/user/Track%20Order.dart';
import 'package:body_blast/user/WeightSelection.dart';
import 'package:body_blast/user/WorkOut%20Vedio.dart';
import 'package:body_blast/user/instructorDetails.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'admin/Add Option.dart';
import 'admin/Admin BottomBar.dart';
import 'admin/Admin Home.dart';
import 'admin/Food Add.dart';
import 'admin/Food Update.dart';
import 'admin/Instructor Update.dart';
import 'admin/WorkOut Update.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
options: FirebaseOptions(
    apiKey: "AIzaSyBbWwLyzvU-5X1uTKwVJPCdn0XFS9CkibU",
    appId: "1:983159323243:android:e74838cfdeab57c27acf2e",
    messagingSenderId:"983159323243",
    projectId: "comment-picker-76557",
    storageBucket:"comment-picker-76557.appspot.com"
),

);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
     providers: [
     ChangeNotifierProvider(create: (context) => Userprovider(),),
     ChangeNotifierProvider(create: (context) => LoginProvider(),),
     ChangeNotifierProvider(create: (context) => AdminProvider(),),
     ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavigationPage(),
      ),
    );
  }
}