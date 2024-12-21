import 'dart:io';
import 'dart:math';
import 'package:body_blast/Provider/adminProvider.dart';
import 'package:body_blast/Provider/userProvider.dart';
import 'package:body_blast/admin/Map.dart';
import 'package:body_blast/models/class.dart';
import 'package:body_blast/user/Fill%20Your%20Profile.dart';
import 'package:body_blast/user/SliderPage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:body_blast/user/GenderSelection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
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
import 'package:url_launcher/url_launcher.dart';

import '../user/Bottom Navigation.dart';

class LoginProvider extends ChangeNotifier {
  LoginProvider(){
    // ifUserCloseApp(context);
  }
  final FirebaseFirestore db = FirebaseFirestore.instance;

  // Search controller
  TextEditingController searchController =TextEditingController();

 // otp controller
  TextEditingController otpController =TextEditingController();

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
      "SIGN_UP_TIME": DateTime.now(),
    };
    print("SignUpDetails");
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


  // add UserDetailsFor Location
  Future<void> addUserDatasForLocation(BuildContext context) async {

    // Get current location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    Userprovider userValue = Provider.of<Userprovider>(context,listen: false);
    userValue.userProfileUrl;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userIdForLocation = prefs.getString("SIGN_USER_ID");

    Map<String,dynamic> addUserDetails={
      "USER_ID_LO":userIdForLocation,
      "USER_NAME_LO":signUpNameController.text,
      "USER_IMAGE-LO":userValue.userProfileUrl,
      "LATITUDE":position.latitude,
      "LONGITUDE":position.longitude,
    };
    print("user details add for location");
    addUserDetails.forEach((key,value){
      print("$key,$value");
    });

    await db.collection("USER_DETAILS_LOCATION").doc(userIdForLocation).set(addUserDetails);
    notifyListeners();
  }


  // get User Details for Location
  List<GetUserDrtailaClassForLocation> userLocationList = [];
  Future<void>getUserInfoForLocation(context)async{
    try {
      userLocationList.clear();
      var datas = await db.collection("USER_DETAILS_LOCATION").get();

      if (datas.docs.isNotEmpty) {
        for (var element in datas.docs) {
          Map<String, dynamic> map = element.data();

          print("user details get for location");
          map.forEach((key, value) {
            print("$key,$value");
          });
          userLocationList.add(GetUserDrtailaClassForLocation(
            map["USER_ID_LO"] ?? '',
            map["USER_NAME_LO"] ?? '',
            map["USER_IMAGE-LO"] ?? '',
            map["LATITUDE"] ?? 0.0,
            map["LONGITUDE"] ?? 0.0,
          ));
        }
      }
      notifyListeners();
    }catch(eror){
      print("Location details cat get.........");
    }
  }

  // get user Location

  Future<void> getUserCurrentLocatoin(String userId, BuildContext context) async {
    try {

      var datas = await db.collection("USER_DETAILS_LOCATION").doc(userId).get();

      if (datas.exists) {
        var userData = datas.data() as Map<String, dynamic>;

        double? latitude = userData["LATITUDE"];
        double? longitude = userData["LONGITUDE"];
        String? userName = userData["USER_NAME_LO"];

        if (latitude != null && longitude != null && userName != null) {
          navigateToMap(context, latitude, longitude, userName);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('i dint get location details')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('dont get user details')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('somethingerorrr: $e')),
      );
    }
    notifyListeners();
  }

 // go to map page
   void navigateToMap(BuildContext context, double latitude, double longitude, String userName){
   callNext(context, GoogleMapScreen(latitude: latitude,longitude:longitude,userName: userName,));
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

  // pref clearing
  Future<void> logOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      AdminProvider admin = Provider.of<AdminProvider>(context,listen: false);
      Userprovider user = Provider.of<Userprovider>(context,listen: false);

      user.bookingDetailsList.clear();
      admin.supplementsBookingList.clear();
      admin.bookedSuppleImagesList.clear();
      admin.addressList.clear();

    } catch (e) {
      showCustomSnackBar(context, "Logout Failed. Please try again.");
    }
    notifyListeners();
  }



  // user Exist
  bool isOldUserLoading = false;
  Future<void> checkUser(BuildContext context,String name, String password) async {
    try {
      isOldUserLoading = true;
      // check name and password
      var data = await FirebaseFirestore.instance.collection("SIGNUP_DETAILS")
          .where("NAME", isEqualTo: name)
          .where("PASSWORD", isEqualTo: password)
          .get();

      if (data.docs.isNotEmpty) {
        // Get the user document
        var userDoc = data.docs.first;

        // Clear old user data and save new user ID in SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("SIGN_USER_ID", userDoc.id);

        // Load user details
        await loadUserDetails(context);

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
    isOldUserLoading = false;
    notifyListeners();
  }

  // user exist go to home screen

  Future<void>checkUserExist(BuildContext context)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userIdd = prefs.getString("SIGN_USER_ID");
    if(userIdd == null){
    callNextReplacement(context, SliderPage());
    }else{
      callNextReplacement(context, BottomNavigationPage());
    }
  }

  // load user details
  Future<void> loadUserDetails(BuildContext context )async{
    print("ffffffffff");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("SIGN_USER_ID");

    print("Current User ID: $userId");

    if(userId == null){
      print("No user ID found");
      return;
    }
    // get UserProvider User Image
    Userprovider userImage = Provider.of<Userprovider>(context,listen: false);
    AdminProvider admin = Provider.of<AdminProvider>(context,listen: false);

    var userDoc = await db.collection("SIGNUP_DETAILS").doc(userId).get();

    if(userDoc.exists){

      // Get user data from Firestore

      var userData = userDoc.data() ?? {};

      // load details to controller
      signUpNameController.text = userData["NAME"]?? "";
      lastNameController.text = userData["LAST_NAME"]?? '';
      emailController.text = userData[ "EMAIL"]?? '';
      dateOfBirthController.text = userData["DATE_OF_BIRTH"]?? '';
      userImage.userProfileUrl = userData["USER_IMAGE"]??'';

      print("loade old existing details");
      print("Name: ${signUpNameController.text}");
      print("Last Name: ${lastNameController.text}");
      print("Email: ${emailController.text}");
      print("Date of Birth: ${dateOfBirthController.text}");
      print("User Image URL: ${userImage.userProfileUrl}");
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
    lastNameController.clear();
    emailController.clear();
    dateOfBirthController.clear();
    otpController.clear();
     notifyListeners();
}

 // Google SignIn Function

  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth  auth = FirebaseAuth.instance;
  //
  // Future<void> signInMethod(BuildContext context) async {
  //   try {
  //
  //     await auth.signOut();
  //     print("Google Sign-In process started...");
  //
  //     // remove old sigin details
  //     await googleSignIn.signOut(); // Google Sign-Out
  //     await auth.signOut(); // Firebase Sign-Out
  //     print("Attempting Google Sign-In...");
  //
  //     // Start a new Google Sign-In process
  //     final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  //     if (googleUser == null) {
  //       return; // Sign-in cancelled
  //     }
  //
  //     // get account details
  //     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  //
  //     // Create a new credential
  //     final OAuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //
  //     // Sign in to Firebase with the Google credential
  //     UserCredential userCredential = await auth.signInWithCredential(credential);
  //
  //     // Get the signed-in user's details
  //     User? user = userCredential.user;
  //
  //     // get google account profile image
  //     Userprovider userVl = Provider.of<Userprovider>(context, listen: false);
  //     // userVl.userProfileUrl = user?.photoURL ?? '';
  //     notifyListeners();
  //
  //     signUpNameController.text = user!.displayName!;
  //     emailController.text = user.email ?? '';
  //
  //
  //     // Check if the user is new or already signed up
  //     final QuerySnapshot result = await FirebaseFirestore.instance
  //         .collection("SIGNUP_DETAILS")
  //         .where("EMAIL", isEqualTo: user.email)
  //         .get();
  //
  //     // If user already exists, navigate to the Home page
  //     if (result.docs.isNotEmpty) {
  //       await loadUserDetails(context);
  //       callNextReplacement(context, BottomNavigationPage());
  //     } else {
  //       // If user does not exist, navigate to profile page to fill details
  //       addUserSignUpDetails();
  //       callNextReplacement(context, FillYourProfile());
  //     }
  //
  //     if (user != null && user.displayName != null) {
  //       List<String> nameParts = user.displayName!.split(' ');
  //
  //       // Set first name (first part)
  //       signUpNameController.text = nameParts.isNotEmpty ? nameParts.first : '';
  //
  //       // Set last name (last part if present)
  //       lastNameController.text = nameParts.length > 1 ? nameParts.last : '';
  //
  //       // Set email
  //       emailController.text = user.email ?? '';  // Add email to the email controller
  //     }
  //
  //     print("User Info: ${user?.displayName}, ${user?.email}");
  //   } catch (e) {
  //     print("Error during Google Sign-In: $e");
  //   }
  // }

  Future<void> signInMethod(BuildContext context) async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await auth.signInWithCredential(credential);
      User? user = userCredential.user;

      if (user == null) return;

      signUpNameController.text = user.displayName ?? '';
      emailController.text = user.email ?? '';

      // Save user ID to SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("SIGN_USER_ID", user.uid);

      // Check if the user already exists in Firestore
      final QuerySnapshot result = await db
          .collection("SIGNUP_DETAILS")
          .where("EMAIL", isEqualTo: user.email)
          .get();

      if (result.docs.isNotEmpty) {
        await loadUserDetails(context);
        callNextReplacement(context, BottomNavigationPage());
      } else {
        addUserSignUpDetails();
        callNextReplacement(context, FillYourProfile());
      }

      notifyListeners();
    } catch (e) {
      print("Error during Google Sign-In: $e");
      showCustomSnackBar(context, "Google Sign-In Failed. Please try again.");
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



