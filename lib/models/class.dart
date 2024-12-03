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
