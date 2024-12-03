import 'dart:io';
import 'dart:math';
import 'package:body_blast/Provider/userProvider.dart';
import 'package:body_blast/user/Fill%20Your%20Profile.dart';
import 'package:body_blast/user/GenderSelection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:body_blast/constants/Navigator.dart';
import 'package:body_blast/constants/snackBar.dart';
import 'package:body_blast/user/Home%20Page.dart';
import 'package:body_blast/user/SplashScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../user/Bottom Navigation.dart';

class LoginProvider extends ChangeNotifier {
  LoginProvider(){
    // ifUserCloseApp(context);
  }
  final FirebaseFirestore db = FirebaseFirestore.instance;

  // Search controller
  TextEditingController searchController =TextEditingController();

  // Login Controllers

  TextEditingController logInNameController = TextEditingController();
  TextEditingController logInPasswordController = TextEditingController();


  // SignUp Controllers

  TextEditingController signUpNameController = TextEditingController();
  TextEditingController signUpPhoneController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();

  // Profile Controllers


  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();

  // signup add
  void addUserSignUpDetails() async {
    String userId = DateTime.now().millisecondsSinceEpoch.toString();
    Map<String, dynamic> addLoginDetails = {
      "SIGN_USER_ID": userId,
      "NAME": signUpNameController.text,
      "PHONE_NUMBER": signUpPhoneController.text,
      "PASSWORD": signUpPasswordController.text.toString(),
      "SIGN_UP_TIME": DateTime.now()
    };
    print("SignUp Details.....");
    addLoginDetails.forEach((key,value){
      print("$key,$value");
    });
    db.collection("SIGNUP_DETAILS").doc(userId).set(addLoginDetails, SetOptions(merge: true));
    notifyListeners();

    // userData sharedPreference save

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("NAME", signUpNameController.text,);
    await prefs.setString("PASSWORD", signUpPasswordController.text,);
    await prefs.setString("SIGN_USER_ID", userId,);
    notifyListeners();
  }

  // // user time Get
  // Future<String>getUserTime(String userId)async{
  //   var data =await db.collection("SIGNUP_DETAILS").doc(userId).get();
  //   if(data.exists){
  //     var signUpTime  = data.data()!["SIGN_UP_TIME"].toDate(); // Firebase timestamp to DateTime
  //     var currentTime = DateTime.now();
  //     var difference = currentTime.difference(signUpTime).inDays;
  //
  //     if (difference == 0) {
  //       return "Today";
  //     } else if (difference == 1) {
  //       return "1 day ago";
  //     } else {
  //       return "$difference days ago";
  //     }
  //   }
  //   return "";
  // }
  //
  // userData fetch

  Future<void> getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    signUpNameController.text = prefs.getString("NAME") ?? '';
    signUpPasswordController.text = prefs.getString("PASSWORD") ?? '';
    var userId = prefs.getString("SIGN_USER_ID") ?? '';
    notifyListeners();
  }

  // pref clearing

  Future<void> logOut()async{
    print("Prefs Clear Successfully");
    SharedPreferences prefs =await SharedPreferences.getInstance();
    await prefs.setBool("isUserSignedUp", false); // make flag false
    notifyListeners();
  }

  // user Exist

  Future<void> checkUser(BuildContext context,String name, String password) async {
    try {
      // check name and password
      var data = await FirebaseFirestore.instance.collection("SIGNUP_DETAILS")
          .where("NAME", isEqualTo: name)
          .where("PASSWORD", isEqualTo: password)
          .get();

      if (data.docs.isNotEmpty) {
        callNextReplacement(context, BottomNavigationPage());
      } else {
        showCustomSnackBar(context,  'Invalid details. Please check password and name."');
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error occurred. Please try again later.")),
      );
      print(error);
    }
    notifyListeners();
  }


  // add profile details

  void userFillProfile()async{
    // get the signup user userId
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("SIGN_USER_ID");
    Map<String, dynamic> userFillProfile ={
      "LAST_NAME": lastNameController.text,
      "EMAIL": emailController.text,
      "DATE_OF_BIRTH": dateOfBirthController.text,
    };
    db.collection("SIGNUP_DETAILS").doc(userId).update(userFillProfile);
    notifyListeners();
  }
  //

  // load user details

  Future<void> loadUserDetails(BuildContext context )async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("SIGN_USER_ID");

   Userprovider userImage = Provider.of<Userprovider>(context,listen: false);

    var userDoc = await db.collection("SIGNUP_DETAILS").doc(userId).get();

    if(userDoc.exists){
      var userData = userDoc.data(); // get firestore data
      // load details to controller
      signUpNameController.text = userData?["NAME"]?? "";
      lastNameController.text = userData?["LAST_NAME"]?? '';
      emailController.text = userData?[ "EMAIL"]?? '';
      dateOfBirthController.text = userData?["DATE_OF_BIRTH"]?? '';
      userImage.userProfileUrl = userData?["USER_IMAGE"]??'';

      print("loade details");
      print("Name: ${signUpNameController.text}");
      print("Last Name: ${lastNameController.text}");
      print("Email: ${emailController.text}");
      print("Date of Birth: ${dateOfBirthController.text}");
      print("User Image URL: ${userImage.userProfileUrl}");
      notifyListeners();

    }

  }

  // user update profile
  Future<void> updateUserProfile(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userId = prefs.getString("SIGN_USER_ID");
      Userprovider userImage = Provider.of<Userprovider>(context,listen: false);

      if (userImage.userProfileFile != null) {
        await userImage.saveImageToFireBase("userProfileAddImage"); // Upload image and get URL
        userImage.userProfileUrl = userImage.userProfileUrl; // Assign updated URL to userProfileUrl
      }

      Map<String, dynamic> userUpdateData = {
        "NAME": signUpNameController.text.trim(),
        "LAST_NAME": lastNameController.text.trim(),
        "EMAIL": emailController.text.trim(),
        "DATE_OF_BIRTH": dateOfBirthController.text.trim(),
        "UPDATED_AT": DateTime.now(),
        "USER_IMAGE":userImage.userProfileUrl,
      };
      print("Updated Data");
      userUpdateData.forEach((key,value){
        print("$key,$value");
      });

      await db.collection("SIGNUP_DETAILS").doc(userId).update(userUpdateData);
      notifyListeners();

    } catch (erorrr) {
      print("Error updating profile: $erorrr");
    }
  }

  void clearAll(){
    signUpNameController.clear();
    signUpPasswordController.clear();
    signUpPhoneController.clear();
    logInNameController.clear();
    logInPasswordController.clear();
     notifyListeners();
}

 // Google SignIn Function

  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth  auth = FirebaseAuth.instance;
  Future<void> signInMethod(BuildContext context) async {
    try {
      await googleSignIn.signOut(); // Google Sign-Out
      await auth.signOut(); // Firebase Sign-Out
      print("Attempting Google Sign-In...");

      // Disconnect any previous Google sign-in session
      // await googleSignIn.disconnect();

      // Start a new Google Sign-In process
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return; // Sign-in cancelled
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      UserCredential userCredential = await auth.signInWithCredential(credential);

      // Get the signed-in user's details
      User? user = userCredential.user;

      // check the user exist
      if(user != null &&  user.email != null){
        final QuerySnapshot result = await FirebaseFirestore.instance
            .collection("SIGNUP_DETAILS").get();
        if(result.docs.isNotEmpty){
          callNextReplacement(context, BottomNavigationPage());
        }else {
          callNextReplacement(context, Genderselection());
        }
      }

      if (user != null && user.displayName != null) {
        List<String> nameParts = user.displayName!.split(' ');

        // Set first name (first part)
        signUpNameController.text = nameParts.isNotEmpty ? nameParts.first : '';

        // Set last name (last part if present)
        lastNameController.text = nameParts.length > 1 ? nameParts.last : '';

        // Set email
        emailController.text = user.email ?? '';  // Add email to the email controller
      }

      print("User Info: ${user?.displayName}, ${user?.email}");
    } catch (e) {
      print("Error during Google Sign-In: $e");
    }
  }



}
//
// // OTP FUNCTION......
//
//   final String apiKey = "YHmNGfnWXjdKx5q081a4kRhDCPL7oVAJbyMTciQF26UIEOeSB9pX1IAwGNcBKPQbUi9OyHmVktofxT3Z";
//
//  int generateOtp(){
//    int min = 100000;
//    int max = 999999;
//    Random random = Random();
//    return min + random.nextInt(max - min);
//  }
//
//  Future<void> sentOtp(String phoneNumber)async{
//   int otp = generateOtp();
//
//   final uri = Uri.parse("https://www.fast2sms.com/dev/bulkV2");
//
//   // HTTP Post Request
//    final response = await http.post(
//      uri,
//      headers: {
//        'authorization': apiKey,
//      },
//      body: {
//    'sender_id': 'FSTSMS',
//    'message': 'Your OTP is $otp',
//    'language': 'english',
//    'route': '4',
//    'numbers': phoneNumber,
//    }
//    );
//    if(response.statusCode == 200){
//      print('OTP sent successfully!');
//    }else{
//      print('Failed to send OTP: ${response.body}');
//    }
//  }



