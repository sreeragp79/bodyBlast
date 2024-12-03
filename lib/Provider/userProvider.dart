import 'dart:io';

import 'package:body_blast/Provider/adminProvider.dart';
import 'package:body_blast/Provider/loginProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/Navigator.dart';
import '../constants/snackBar.dart';
import '../models/class.dart';
import '../user/PaymentOption.dart';

class Userprovider extends ChangeNotifier{
Userprovider(){
 getReviews();
 getBookingDetails();
 getBookingDetails();
}

 final FirebaseFirestore db = FirebaseFirestore.instance;

 // Reciew controllers
 TextEditingController reviewSubController = TextEditingController();

 // user profile pick function

 String userProfileUrl = '';
 String userReviewPickURL = '';
 File? userProfileFile;
 File? userReviewFile;


 Future<void>userPickImage(ImageSource source, String from)async{
  // image picker option
  final userSelectImage = ImagePicker();
  // user selected image store
  final userPickedImage = await userSelectImage.pickImage(source:source);

  if(userPickedImage != null){
   await userCropImage(userPickedImage.path, from);
   notifyListeners();
  }else{
   print('No image selected.');
  }
 }

 Future<void>userCropImage(String path,String from)async{
  final cropedFile = await ImageCropper().cropImage(
   sourcePath: path,
   aspectRatioPresets: [
    CropAspectRatioPreset.original,
    CropAspectRatioPreset.square,
    CropAspectRatioPreset.ratio3x2,
    CropAspectRatioPreset.ratio4x3,
    CropAspectRatioPreset.ratio16x9,
   ],
   uiSettings: [
    AndroidUiSettings(
     toolbarTitle: 'Cropper',
     toolbarColor: Colors.white,
     toolbarWidgetColor: Colors.black,
     initAspectRatio: CropAspectRatioPreset.original,
     lockAspectRatio: false,
    ),
    IOSUiSettings(title: 'Cropper'),
   ],
  );

  // image save based on frome
  if(cropedFile != null){
   if(from == "userProfileAddImage"){
    userProfileFile = File(cropedFile.path); // profile image set
   }else if(from == "userReviewAddImage"){
    userReviewFile = File(cropedFile.path);
   }
   notifyListeners();
  }
 }

 // save image to firebase based on from

 Future<void>saveImageToFireBase(String from)async{
  String id = DateTime.now().millisecondsSinceEpoch.toString();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userId = prefs.getString("SIGN_USER_ID");
  // map to store user Details
  Map<String, dynamic> dataToSave = {};
  File? fileToUpload;
  String collection = '';

  if(from =="userProfileAddImage"){
     fileToUpload = userProfileFile;
     collection = "SIGNUP_DETAILS";
     dataToSave ={
      "USER_IMAGE":userProfileUrl,
     };
  }else if(from ==  "userReviewAddImage"){
   fileToUpload = userReviewFile;
   collection = "REVIEW_USER_PICK";
   dataToSave = {
    "REVIEW_USER_IMAGE":userReviewPickURL,
   };
  }
  if(fileToUpload != null){
   // create photo id
   String photoId = DateTime.now().millisecondsSinceEpoch.toString();
   // get firebase reference
   Reference ref = FirebaseStorage.instance.ref().child(photoId);
   // upload the file
   await ref.putFile(fileToUpload).whenComplete(()async{
    // Get download URL
    String downloadUrl = await ref.getDownloadURL();

    // Update the URL in the map
    if (from == "userProfileAddImage") {
     userProfileUrl = downloadUrl;
     dataToSave["USER_IMAGE"] = downloadUrl;
    } else if (from == "userReviewAddImage") {
     dataToSave["REVIEW_USER_IMAGE"] = downloadUrl;
     userReviewPickURL = downloadUrl; // Store the review image URL

    }
    // Save data to Firestore
  if(from == "userProfileAddImage"){
   await db.collection("SIGNUP_DETAILS").doc(userId).update(dataToSave);
  }else{
   await db.collection(collection).doc(id).set(dataToSave);
  }
    notifyListeners();
   });

  }
 }


// Review Function
bool isLoading = false;

void reviewAdd(BuildContext context)async{
 isLoading = true;
 notifyListeners();
 String reviewId = DateTime.now().millisecondsSinceEpoch.toString();
 SharedPreferences prefs =await SharedPreferences.getInstance();
 String? userId = prefs.getString("SIGN_USER_ID"); // Get current userId

 // login provider detail get
 LoginProvider logDetails = Provider.of<LoginProvider>(context,listen: false);
 String userName = logDetails.signUpNameController.text;

 Map<String,dynamic> reviewAdd ={
  "REVIEW_USER_ID": userId,
  "REVIEW_USER_IMAGE": userReviewPickURL,
  "REVIEW_SUB": reviewSubController.text,
  "REVIEW_DATE": "1 day ago",
  "USER_NAME":userName,
  "REVIEW_ID":reviewId,
 };
 db.collection("USER_REVIEWS").doc(reviewId).set(reviewAdd,);
 notifyListeners();

 getReviews();
 clearRevies();
 isLoading = false;
 notifyListeners();
}

//get Review

List<ReviewsClass> reviewsList=[];
Future<void> getReviews()async{
 reviewsList.clear();
 db.collection("USER_REVIEWS").orderBy( "REVIEW_ID",descending: true).get().then((value){

  if(value.docs.isNotEmpty){
   for(var element in value.docs){

    Map<String,dynamic> map = element.data();
    reviewsList.add(ReviewsClass(
     map["REVIEW_ID"] ?? '',
     map["REVIEW_USER_IMAGE"] ?? '',
     map["REVIEW_SUB"] ?? '',
     map["REVIEW_DATE"] ?? '',
     map["USER_NAME"] ?? '',
     map["REVIEW_ID"] ?? '',
    ));
    notifyListeners();
   }
  }
 });
}

// cleara Reviews
 void clearRevies(){
  reviewSubController.clear();
  notifyListeners();
 }

 void clearImage(){
  userProfileFile = null;
  notifyListeners();
 }

 // call function

 Future<bool> handlePhonePermission() async {
  var status = await Permission.phone.status;
  if (status.isGranted) {
   return true;
  }

  status = await Permission.phone.request();
  return status.isGranted;
 }

 // Make phone call with permission check
 Future<void> makePhoneCall(BuildContext context, String phoneNumber) async {
  if (await handlePhonePermission()) {
   final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
   );
   try {
    if (await canLaunchUrl(launchUri)) {
     await launchUrl(launchUri);
    } else {
     if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(content: Text('Could not launch phone dialer')),
      );
     }
    }
   } catch (e) {
    if (context.mounted) {
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: ${e.toString()}')),
     );
    }
   }
  } else {
   if (context.mounted) {
    showDialog(
     context: context,
     builder: (BuildContext context) => AlertDialog(
      title: const Text('Permission Required'),
      content: const Text('Phone permission is required to make calls. Please enable it in settings.'),
      actions: [
       TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Text('Cancel'),
       ),
       TextButton(
        onPressed: () => openAppSettings(),
        child: const Text('Open Settings'),
       ),
      ],
     ),
    );
   }
  }
 }


// date time add
 void dateAndTimeAdd(String? selectDate, String time, String toTime){

  if (selectDate == null || selectDate.isEmpty) {
   print("Error: Select Date is null or empty");
   return;
  }

  String userId = DateTime.now().millisecondsSinceEpoch.toString();

  DateTime selectedDateTime = DateFormat('dd/MM/yyyy').parse(selectDate!);
  String day = DateFormat('dd').format(selectedDateTime);
  String month = DateFormat('MMMM').format(selectedDateTime);
  String dayName = DateFormat('EEEE').format(selectedDateTime);

   Map<String,dynamic> addDate={
    "USER_ID":userId,
    "DATE": selectDate,
    "TIME": time,
    "TO_TIME": toTime,
    "DAY": day,
    "MONTH": month,
    "DAY-NAME": dayName,
   };
   db.collection("USER_DATE_TIME").doc(userId).set(addDate);
   notifyListeners();
 }

 // get date details

  String? day;
  String? month;
  String? dayName;
  String? time;
  String? toTime;
 List<DateClass> dateDetails =[];
 Future<void>getDateDetails()async{
  await db.collection("USER_DATE_TIME").get().then((value){

   if(value.docs.isNotEmpty){
    for(var element in value.docs){

     Map<String,dynamic> map =element.data();

     day = map["DAY"] ;
     month = map[ "MONTH"] ;
     dayName = map["DAY-NAME"] ;
     time = map["TIME"] ;
     toTime = map["TO_TIME"] ;

     dateDetails.add(DateClass(
         map["USER_ID"]?? '',
         map["DATE"]?? '',
         map["TIME"]?? '',
         map["TO_TIME"]?? '',
         map["DAY"]?? '',
         map["MONTH"]?? '',
         map["DAY-NAME"]?? '',

     ));
    }
    notifyListeners();
   }
  });
  notifyListeners();
 }

 // The selected date and time is already booked

 Future<void> availableDateAndTime(
     String date, String time, String toTime, BuildContext context,
     String price, String image, String name) async {

  // Step 1: Null or Empty Check for Inputs
  if (date == null || date.isEmpty || date.trim().isEmpty ||
      time == null || time.isEmpty || time.trim().isEmpty ||
      toTime == null || toTime.isEmpty || toTime.trim().isEmpty) {
   // Show Specific Error Message and exit the function
   showCustomSnackBar(context, 'Please select a date and time.');
   return;
  }

  try {
   // Step 2: Firestore query to check if the selected date/time is already booked
   var data = await FirebaseFirestore.instance
       .collection("USER_DATE_TIME")
       .where("DATE", isEqualTo: date)
       .where("TIME", isEqualTo: time)
       .where("TO_TIME", isEqualTo: toTime)
       .get();

   // Step 3: Check if the date/time slot is already booked
   if (data.docs.isEmpty) {
    // No booking found: Add new booking and proceed
    dateAndTimeAdd(date, time, toTime);
    callNext(context, Paymentoption(price: price, name: name, image: image));
   } else {
    // Slot is already booked: Show message
    showCustomSnackBar(context, 'The selected date and time are already booked.');
   }
  } catch (e) {
   // Step 4: Error Handling
   print('Error occurred while checking availability: ${e.toString()}');
  }

  notifyListeners();
 }



 // add booking details and notification
 Future<void> addBookingDetails(String paymentInstructorImage,String paymentInstructorName,BuildContext context)async{

   SharedPreferences prefs = await SharedPreferences.getInstance();
   String? userId = prefs.getString("SIGN_USER_ID"); // get current userId
   String bookingId = DateTime.now().millisecondsSinceEpoch.toString();
   Adminprovider insData = Provider.of<Adminprovider>(context ,listen: false);
   Map<String,dynamic> addBookingDetails = {
    "USER_ID":userId,
    "BOOKING_ID": bookingId?? '',
    "INSTRUCTOR_IMAGE":paymentInstructorImage,
    "INSTRUCTOR_NAME":paymentInstructorName,
    "TIME": time ,
    "TO_TIME": toTime,
    "DAY": day,
    "MONTH": month,
    "DAY-NAME": dayName,
    "INS_PRICE":insData.insPrice,
    "NOTIFICATION_TITLE": "Your trainer has been booked\nSuccessfully!"
   };
   print("Booking details");
   addBookingDetails.forEach((key,value){
    print("$key:$value");
   });

   try {
    await db.collection("BOOKING_DETAILS").doc(bookingId).set(addBookingDetails);
    print("Data added to Firestore");  // Check if data is added
   } catch (e) {
    print("Error adding data: $e");
   }
   notifyListeners();
 }

 // get Booking Details
 List<BookingDetailsClass> bookingDetailsList = [];

 Future<void>getBookingDetails()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? currentUserId = prefs.getString("SIGN_USER_ID");

  var datas =await db.collection("BOOKING_DETAILS").
  where("USER_ID",isEqualTo: currentUserId).get();

  if(datas.docs.isNotEmpty){
   bookingDetailsList.clear();
   for(var element in datas.docs){
    Map<String,dynamic> map = element.data();
    bookingDetailsList.add(BookingDetailsClass(
        map["USER_ID"]?? '',
        map["BOOKING_ID"]?? '',
        map["INSTRUCTOR_IMAGE"]?? '',
        map["INSTRUCTOR_NAME"]?? '',
        map["TIME"]?? '',
        map["TO_TIME"]?? '',
        map["DAY"]?? '',
        map["MONTH"]?? '',
        map["DAY-NAME"]?? '',
        map["INS_PRICE"]?? '',
        map["NOTIFICATION_TITLE"]?? '',
    ));
   }
   notifyListeners();
  }
  notifyListeners();
 }
}
