import 'package:firebase_storage/firebase_storage.dart';

class ReviewsClass {
  String reviewUserId;
  String reviewImage;
  String reviewSub;
  String reviewDate;
  String userName;
  String reviewId;
  ReviewsClass(this.reviewUserId,this.reviewImage,this.reviewSub, this.reviewDate,
      this.userName, this.reviewId);
}

class DateClass {
  String userId;
  String date;
  String time;
  String toTime;
  String day;
  String month;
  String dayName;
  DateClass(this.userId, this.date, this.time, this.toTime, this.day,
      this.month, this.dayName);
}

class AdminAddInstructor {
  String instructorId;
  String instructorImage;
  String instructorName;
  String instructorExp;
  String instructorMedal;
  String instructorClint;
  String instructorPrice;
  AdminAddInstructor(
      this.instructorId,
      this.instructorImage,
      this.instructorName,
      this.instructorExp,
      this.instructorMedal,
      this.instructorClint,
      this.instructorPrice);
}

class AdminAddWorkOut {
  String workOutIdd;
  String workOutImage;
  String workOutName;
  String workOutMins;
  String workOutCal;
  String workOutSets;
  AdminAddWorkOut(this.workOutIdd, this.workOutImage, this.workOutName,
      this.workOutMins, this.workOutCal, this.workOutSets);
}

class StoreCategoryId {
  String categoryiD;
  String name;
  StoreCategoryId(this.categoryiD, this.name);
}
class FoodModel {
  String categoryId;
  String categoryName;
  String foodId;
  String foodName;
  String foodCabs;
  String foodCalorie;
  String foodFat;
  String foodProtein;
  String foodImage;

  FoodModel(
      this.categoryId,
      this.categoryName,
      this.foodId,
      this.foodName,
      this.foodCabs,
      this.foodCalorie,
      this.foodFat,
      this.foodProtein,
      this.foodImage,
      );
}
class ReviewImageClass{
  String reviewImage;
  ReviewImageClass(this.reviewImage);
}
class BookingDetailsClass{
  String userId;
  String bookingId;
  String instructorImage;
  String instructorIName;
  String time;
  String toTime;
  String day;
  String month;
  String dayName;
  String insPrice;
  String notificationSub;
  BookingDetailsClass(
      this.userId,
      this.bookingId,
      this.instructorImage,
      this.instructorIName,
      this.time,
      this.toTime,
      this.day,
      this.month,
      this.dayName,
      this.insPrice,
      this.notificationSub
      );
}
class AdminSupplementsClass{
  String supplementId;
  String supplementImage;
  String supplementName;
  String supplementBrand;
  String supplementPrice;
  AdminSupplementsClass(
      this.supplementId,
      this.supplementImage,
      this.supplementName,
      this.supplementBrand,
      this.supplementPrice,
      );
}

class AddressClass{
  String userId;
  String addressId;
  String addressName;
  String addressPhone;
  String addressPinCode;
  String addressState;
  String addressCity;
  String addressHouse;
  String addressRode;
  String month;
  String date;
  String dayName;
  AddressClass(
      this.userId,
      this.addressId,
      this.addressName,
      this.addressPhone,
      this.addressPinCode,
      this.addressState,
      this.addressCity,
      this.addressHouse,
      this.addressRode,
      this.month,
      this.date,
      this.dayName,
      );
}
class SupplementBookingClass{
  String BsupplementImage;
  String BsupplementName;
  String BsupplementBrand;
  String BsupplementPrice;
  SupplementBookingClass(
      this.BsupplementImage,
      this.BsupplementName,
      this.BsupplementBrand,
      this.BsupplementPrice,
      );
}