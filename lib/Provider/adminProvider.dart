import 'dart:io';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../constants/snackBar.dart';
import '../models/class.dart';

class Adminprovider extends ChangeNotifier{

  Adminprovider(){
    getWorkoutDetails();
    getInstructorDetails();
    getFoodDetails();
  }
  final FirebaseFirestore db = FirebaseFirestore.instance;

  // Iinstructor Details

  TextEditingController insNameController= TextEditingController();
  TextEditingController expController= TextEditingController();
  TextEditingController medalController= TextEditingController();
  TextEditingController clintController= TextEditingController();
  TextEditingController priceController= TextEditingController();

 // WorkOut Details

  TextEditingController workOutNameController= TextEditingController();
  TextEditingController minsController= TextEditingController();
  TextEditingController calController= TextEditingController();
  TextEditingController setsController= TextEditingController();


  // Food Controllers

  TextEditingController foodNameController= TextEditingController();
  TextEditingController calorieController= TextEditingController();
  TextEditingController proteinController= TextEditingController();
  TextEditingController cabsController= TextEditingController();
  TextEditingController fatController= TextEditingController();


  // image add function...
  String workOutImageUrl = '';
  String instructorImageUrl = '';
  File? workOutImageFile;
  File? instructorImageFile;
  File? selectedWorkOutImageFile;
  String? selectedWorkOutmageUrl;
  Future<void>adminAddImage(ImageSource source,String from)async{
    // image picker option
    final adminSelectImage = ImagePicker();
    // user selected image store
    final userPickedImage = await adminSelectImage.pickImage(source:source);

    if(userPickedImage != null){
      await adminCropImage(userPickedImage.path, from);
      notifyListeners();
    }else{
      print('No image selected.');
    }
  }

  Future<void>adminCropImage(String path,String from)async{
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
      selectedWorkOutImageFile = File(cropedFile.path);
      if(from == "adminInstructorImage"){
        instructorImageFile = File(cropedFile.path); // profile image set
      }else if(from == "adminWorkOutImage"){
        workOutImageFile = File(cropedFile.path);
      }
      notifyListeners();
    }
  }
  // save image to firebase
  Future<void> saveAdminAddImageToFireBase(String from)async{
    String instructorId = DateTime.now().millisecondsSinceEpoch.toString();
    String workOutId = DateTime.now().millisecondsSinceEpoch.toString();
    // map to store user Details
    Map<String, dynamic> dataToSave = {};
    File? fileToUpload;
    String collection = '';
    if(from == "adminInstructorImage"){
      fileToUpload = instructorImageFile;
      collection = 'INSTRUCTOR_IMAGE';
      dataToSave ={
        "ID":instructorId,
        "I_IMAGE":instructorImageUrl,
        "INSTRUCTOR_NAME":insNameController.text,
        "INSTRUCTOR_EXP":expController.text,
        "INSTRUCTOR_MEDAL":medalController.text,
        "INSTRUCTOR_CLINT":clintController.text,
        "INSTRUCTOR_PRICE":priceController.text,
      };

    }else if(from == "adminWorkOutImage"){
      fileToUpload = workOutImageFile;
      collection = "WORKOUT_IMAGE";
      dataToSave = {
        "ID":workOutId,
        "W_IMAGE":workOutImageUrl,
        "WORKOUT_NAME":workOutNameController.text,
        "WORKOUT_MINS":minsController.text,
        "WORKOUT_CAL":calController.text,
        "WORKOUT_SETS":setsController.text,
      };
      notifyListeners();
    }
    // create image url

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
        if (from == "adminInstructorImage") {
          dataToSave["I_IMAGE"] = downloadUrl;
        } else if (from == "adminWorkOutImage") {
          dataToSave["W_IMAGE"] = downloadUrl;
        }
        // Save data to Firestore
        db.collection(collection).doc(from == "adminInstructorImage" ?instructorId:workOutId).set(dataToSave);
        notifyListeners();
      });

    }
  }

  // getInstructorDetails  Details
  String? paymentInstructorImage;
  String? paymentInstructorName;
  String? insPrice;

List<AdminAddInstructor> instructorList = [];
  Future<void> getInstructorDetails()async{
   try{
     print("Fetching InstructorData details starting...");

     var datas1 = await db.collection('INSTRUCTOR_IMAGE').get();

     print("Instructor Documents found: ${datas1.docs.length}");

     if(datas1.docs.isNotEmpty){
       instructorList.clear();
         for(var element in datas1.docs){
           Map<String,dynamic> map = element.data();
           paymentInstructorImage = map["I_IMAGE"]??'';
           paymentInstructorName = map["INSTRUCTOR_NAME"]??'';
           insPrice = map["INSTRUCTOR_PRICE"]??'';

           map.forEach((key, value) {
             print("$key : $value");
           });

           instructorList.add(AdminAddInstructor(
             map["ID"]?? '',
             map["I_IMAGE"]?? '',
             map["INSTRUCTOR_NAME"]?? '',
             map["INSTRUCTOR_EXP"]?? '',
             map["INSTRUCTOR_MEDAL"]?? '',
             map[ "INSTRUCTOR_CLINT"]?? '',
             map["INSTRUCTOR_PRICE"]?? '',
           ));
         }
         print("final InstructorList Length ${instructorList.length}");
         notifyListeners();
       }else{
       print("No documents found in INSTROCTOR_IMAGE collection");
     }
   }catch(erorrrrrrr){
     print("error fetching instructor datas${erorrrrrrr}");
   }
  }

  // get workOutDetails
  List<AdminAddWorkOut> workOutList = [];

  Future<void> getWorkoutDetails() async {
    try {
      print("Fetching workout details starting...");

      var datas = await db.collection("WORKOUT_IMAGE").get();

      print("WorkOut Documents found: ${datas.docs.length}");

      if (datas.docs.isNotEmpty) {
        workOutList.clear();
        for (var element in datas.docs) {
          Map<String, dynamic> map = element.data();

          map.forEach((key, value) {
            print("$key : $value");
          });

          workOutList.add(AdminAddWorkOut(
            map["ID"] ?? '',
            map["W_IMAGE"] ?? '',
            map["WORKOUT_NAME"] ?? '',
            map["WORKOUT_MINS"] ?? '',
            map["WORKOUT_CAL"] ?? '',
            map["WORKOUT_SETS"] ?? '',
          ));
        }

        print("Final workout list length: ${workOutList.length}");
        notifyListeners();
      } else {
        print("No documents found in WORKOUT_IMAGE collection");
      }
    } catch (errorrrrrrrrrrrr) {
      print("Error fetching workout details: $errorrrrrrrrrrrr");
    }
  }

  // clear fields
 void clearInstructorField(){
    instructorImageFile = null;
    insNameController.clear();
    expController.clear();
    medalController.clear();
    clintController.clear();
    priceController.clear();
    notifyListeners();
 }
 void clearWorkOutField(){
   workOutImageFile = null;
   workOutNameController.clear();
   minsController.clear();
   calController.clear();
   setsController.clear();
   notifyListeners();
 }


  // add category idd
  void addFoodCategory(String SelectCategory){
    String categoryId = DateTime.now().millisecondsSinceEpoch.toString();
    Map<String,dynamic> addCategory = {
      "CATEGORY_ID":categoryId,
      "NAME":SelectCategory.trim(),
    };
    db.collection("FOOD_CATEGORY").doc(categoryId).set(addCategory);
    notifyListeners();
  }


  List<StoreCategoryId> categoryIdList = [];
  // get category id
  Future<void>getCategory()async{
    var data = await db.collection("FOOD_CATEGORY").get();
    if(data.docs.isNotEmpty){
      categoryIdList.clear();
      for(var element in data.docs){
        Map<String,dynamic> map = element.data();
        print("category: ${map["NAME"]},ID${map["CATEGORY_ID"]}");
        categoryIdList.add(StoreCategoryId(
          map["CATEGORY_ID"]?? "",
          map["NAME"]?? "",
        ));
      }
      notifyListeners();
    }
  }

 // add food details
  bool isLoading = false;
  Future<void> addFood(String selectedCategory) async {
    String? categoryId;

    if (categoryIdList.isEmpty){
      await getCategory();
    }

    for (var category in categoryIdList) {
      print("Checking category: ${category.name}, ID: ${category.categoryiD}");
      if (category.name.trim() == selectedCategory.trim()){
        categoryId = category.categoryiD;
        break;
      }
    }

    if (categoryId == null) {
      print("Selected category ID not found");
    }
    String foodId = DateTime.now().millisecondsSinceEpoch.toString();
    Map<String, dynamic> addFood = {
      "FOOD_ID": foodId,
      "FOOD_NAME": foodNameController.text,
      "FOOD_CALORIE": calorieController.text,
      "FOOD_PROTEIN": proteinController.text,
      "FOOD_CABS": cabsController.text,
      "FOOD_FAT": fatController.text,
      "CATEGORY_ID": categoryId,
      "CATEGORY_NAME":selectedCategory,
    };
    await db.collection("FOODS").doc(foodId).set(addFood);

    await addFoodTofirebase(selectedCategory,foodId);

  print("food added uder category ${categoryId},${selectedCategory}");
    notifyListeners();
  }


// food image adding
  String breackFastFoodImageUrl = '';
  File? breackFastFoodImageFile;
  String gainFoodImageUrl = '';
  File? gainFoodImageFile;
  String lossFoodImageUrl ="";
  File? lossFoodImageFile;
  String preworkOutFoodImageUrl ="";
  File? preworkOutFoodImageFile;
  File? selectedFoodImageFile;
  String? selectedFoodImageUrl;


  Future<void>adminAddFoodImage(ImageSource source,String selectCategory)async{
    // image picker option
    final adminSelectFoodImage = ImagePicker();
    // user selected image store
    final adminPickedFoodImage = await adminSelectFoodImage.pickImage(source:source);

    if(adminPickedFoodImage != null){
      await adminCropFoodImage(adminPickedFoodImage.path, selectCategory);
      notifyListeners();

    }else{
      print('No image selected.');
    }
  }

  Future<void>adminCropFoodImage(String path,String selectCategory)async{
    final cropedFoodFile = await ImageCropper().cropImage(
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
    if (cropedFoodFile != null) {
      selectedFoodImageFile = File(cropedFoodFile.path);
      switch (selectCategory) {
        case 'BreackFast':
          breackFastFoodImageFile = File(cropedFoodFile.path);
          break;
        case 'Gain':
          gainFoodImageFile = File(cropedFoodFile.path);
          break;
        case 'Loss':
          lossFoodImageFile = File(cropedFoodFile.path);
          break;
        case 'Preworkout':
          preworkOutFoodImageFile = File(cropedFoodFile.path);
          break;
      }
      notifyListeners(); // Add this after setting the image file
    }
    }

   //  image to add firebase
   Future<void> addFoodTofirebase(String selectCategory,String foodId)async{
    File? foodFleToUpload;
    String collection = "FOODS";

    if(selectCategory == 'BreackFast'){
      foodFleToUpload = breackFastFoodImageFile;
    }else if(selectCategory == 'Gain'){
      foodFleToUpload = gainFoodImageFile;
    }else if(selectCategory == 'Loss'){
      foodFleToUpload = lossFoodImageFile;
    }else if(selectCategory == 'Preworkout'){
      foodFleToUpload = preworkOutFoodImageFile;
    }
    // create image url

    if(foodFleToUpload != null){
      // create photo id
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      // get firebase reference
      Reference ref = FirebaseStorage.instance.ref().child(photoId);
      // upload the file
      await ref.putFile(foodFleToUpload).whenComplete(()async{
        // Get download URL
        String downloadUrl = await ref.getDownloadURL();

        // Update the food document with the new image URL
        Map<String, dynamic> updateFoodData = {
          "FOOD_IMAGE": downloadUrl,
        };
         db.collection(collection).doc(foodId).update(updateFoodData);
        notifyListeners();
      });

    }
   }

   // getFood Details based on category id

  List<FoodModel> breackFastList = [];
  List<FoodModel> gainList = [];
  List<FoodModel> lossList = [];
  String? categoryId;
  String? categoryName ;
  String? foodId ;

  Future<void>getFoodDetails()async{
    print("Documet fetching starting................");
  var foodDatas =  await db.collection("FOODS").get();

  if(foodDatas.docs.isNotEmpty){
    breackFastList.clear();
    gainList.clear();
    lossList.clear();

    for(var element in foodDatas.docs){
      Map<String,dynamic> map = element.data();

      categoryId = map["CATEGORY_ID"]?? '';
      categoryName = map["CATEGORY_NAME"]?? '';
      foodId = map["FOOD_ID"]?? '';
      map.forEach((key, value) {
        print("$key : $value");
      });

      FoodModel foods = FoodModel(
          map["CATEGORY_ID"]?? '',
          map["CATEGORY_NAME"]?? '',
          map["FOOD_ID"]?? '',
          map["FOOD_NAME"]?? '',
          map["FOOD_CABS"]?? '',
          map["FOOD_CALORIE"]?? '',
          map["FOOD_FAT"]?? '',
          map["FOOD_PROTEIN"]?? '',
          map["FOOD_IMAGE"]?? '',
      );
     if(categoryName == 'BreackFast'){
       breackFastList.add(foods);
     }else if(categoryName == 'Gain'){
       gainList.add(foods);
     }else if(categoryName == 'Loss'){
       lossList.add(foods);
     }
    }
  }
  print("catogory Name:${categoryName},${gainList}");
  print("catogory Name:${categoryName},${lossList}");
  print("catogory Name:${categoryName},${breackFastList}");
  notifyListeners();
  }

  // clear food
  void clearFoodField(){
    preworkOutFoodImageFile = null;
    breackFastFoodImageFile = null;
    gainFoodImageFile = null;
    lossFoodImageFile = null;
    foodNameController.clear();
    calorieController.clear();
    proteinController.clear();
    cabsController.clear();
    fatController.clear();
    notifyListeners();
  }

    // admin Update Food Details
  String? foodImage;
    Future<void> lodeFoodDetails(String foodIdd)async{
      var foodData = await db.collection("FOODS").doc(foodIdd).get();
      if(foodData.exists){
        var map = foodData.data();
        print("get food details");
        map?.forEach((key,value){
          print('$key,$value');
        });
        foodNameController.text =map?["FOOD_NAME"]?? '';
        calorieController.text =map?["FOOD_CALORIE"]?? '';
        proteinController.text =map?["FOOD_PROTEIN"]?? '';
        cabsController.text =map?["FOOD_CABS"]?? '';
        fatController.text =map?["FOOD_FAT"]?? '';
        foodImage = map?["FOOD_IMAGE"]?? '';
        print("foodIdd: $foodIdd");

        notifyListeners();
      }
    }
    // update food imge
    Future<void> updateFoodDetails(String uFoodId)async{
     String? imageUrl = foodImage;
      if(selectedFoodImageFile != null ){
        final photoId = DateTime.now().millisecondsSinceEpoch.toString();
        Reference ref = FirebaseStorage.instance.ref().child(photoId);
        await ref.putFile(selectedFoodImageFile!).whenComplete(() async {
          imageUrl = await ref.getDownloadURL();
          selectedFoodImageUrl = imageUrl;
        });
      }
      db.collection("FOODS").doc(uFoodId).update({
        "FOOD_NAME": foodNameController.text,
        "FOOD_CALORIE": calorieController.text,
        "FOOD_PROTEIN": proteinController.text,
        "FOOD_CABS": cabsController.text,
        "FOOD_FAT": fatController.text,
        "FOOD_IMAGE":imageUrl
      });
      notifyListeners();
      await getFoodDetails();
    }

    // clear update filed
    void  clearFoodUpdate(){
      foodNameController.clear();
      calorieController.clear();
      proteinController.clear();
      cabsController.clear();
      fatController.clear();
      selectedFoodImageFile = null;
      notifyListeners();
    }
    // update WorkOutImage and instrocor image
    Future<void> workOutUpdate(String workOutId)async{
      String? wImageUrl;
      Map<String, dynamic> updateData = {
        "WORKOUT_NAME": workOutNameController.text,
        "WORKOUT_MINS": minsController.text,
        "WORKOUT_CAL": calController.text,
        "WORKOUT_SETS": setsController.text,
      };

     if(selectedWorkOutImageFile != null){
       final photoId = DateTime.now().millisecondsSinceEpoch.toString();
       Reference ref =FirebaseStorage.instance.ref().child(photoId);
       await ref.putFile(selectedWorkOutImageFile!).whenComplete(() async {
         wImageUrl = await ref.getDownloadURL();
         selectedWorkOutmageUrl = wImageUrl;
         updateData["W_IMAGE"] = wImageUrl;
       });
       await db.collection("WORKOUT_IMAGE").doc(workOutId).update(updateData);
       notifyListeners();
       await getWorkoutDetails();
     }
    }
    }
