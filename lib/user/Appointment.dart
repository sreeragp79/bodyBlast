import 'package:body_blast/Provider/loginProvider.dart';
import 'package:body_blast/Provider/userProvider.dart';
import 'package:body_blast/constants/bodyContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../constants/AppBar Texts.dart';
import '../constants/BottonContainer.dart';
import '../constants/Navigator.dart';
import 'PaymentOption.dart';

class Appointment extends StatefulWidget {
  final image;
  final name;
  final experience;
  final price;
  const Appointment({
    super.key,required
    this.name,required
    this.image,required
    this.experience,required
  this.price
  });

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  String selectedDate = "Confirm Your Date";
  String selectedTime = "Confirm Your Time";
  String selectedTimeTo = "Confirm Your Time";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Consumer<Userprovider>(
        builder: (contex1,value1,child) {
          return bodyContainer(
              height,
              width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height / 16.45,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: width / 23.45),
                        child: GestureDetector(
                          onTap: () {
                            back(context);
                          },
                          child: Container(
                            width: width / 7.45,
                            height: height / 20.45,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.20),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/image/Backarow.png"),
                                scale: 4.20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width / 6.34,
                      ),
                      appbarText("Appointment"),
                    ],
                  ),
                  SizedBox(
                    height: height / 30.34,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: width/16.34),
                    child: Container(
                      margin: EdgeInsets.only(right: width / 400.45),
                      height: height / 7.70,
                      width: 360.70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.withOpacity(0.10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: width / 26.56),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height / 70.45,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: height / 10.81,
                                  width: width / 5.48,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(widget.image),
                                      )),
                                ),
                                SizedBox(
                                  width: width / 25.45,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.name,
                                      style: TextStyle(
                                          fontFamily: "jeju",
                                          height: height / 800.99,
                                          fontSize: 25,
                                          color: CupertinoColors.white),
                                    ),
                                    experience("High Intensity Trainer"),
                                    SizedBox(
                                      height: height / 67.58,
                                    ),
                                    Text(
                                      "${widget.experience} Year Experience",
                                      style: TextStyle(
                                        fontFamily: "intermedi",
                                        fontSize: 13,
                                        color: Color(0x4C76E7).withOpacity(1),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 20.58,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: width/16.34),
                    child: GestureDetector(
                      onTap: () async {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.black, // Dialog background color
                                content: Container(
                                  height: height / 3,
                                  width: width / 1.5,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1), // Container background color
                                    borderRadius: BorderRadius.circular(15), // Optional: rounded corners
                                  ),
                                  child: SfDateRangePicker(
                                    minDate: DateTime(1900),
                                    maxDate: DateTime(2025),
                                    selectionMode: DateRangePickerSelectionMode.single,
                                    backgroundColor: Colors.transparent, // Make date picker background transparent
                                    headerStyle: DateRangePickerHeaderStyle(
                                      textStyle: TextStyle(color: Colors.black), // Header text color
                                    ),
                                    monthCellStyle: DateRangePickerMonthCellStyle(
                                      textStyle: TextStyle(color: Colors.white), // Date text color
                                      disabledDatesTextStyle: TextStyle(color: Colors.grey), // Disabled dates color
                                    ),
                                    yearCellStyle: DateRangePickerYearCellStyle(
                                      textStyle: TextStyle(color: Colors.white), // Year text color
                                      disabledDatesTextStyle: TextStyle(color: Colors.grey), // Disabled years color
                                    ),
                                    selectionColor:Colors.blue, // Selected date color
                                    todayHighlightColor: Colors.white, // Today's date highlight color
                                    onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                                     setState (() {
                                         selectedDate = DateFormat('dd/MM/yyyy').format(args.value);
                                     });
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              );
                            }
                        );
                      },
                      child: Container(
                        height: height / 15.45,
                        width: width / 2.90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                          color: Colors.grey.withOpacity(0.10),
                        ),
                        child: Center(
                          child: Text(
                            selectedDate,
                            style: TextStyle(
                              fontFamily: "intermedi",
                              fontSize: 13,
                              color: CupertinoColors.white
                            ),
                          ),
                        ),
                      ),
                    ),
                  ) ,
                  SizedBox(
                    height: height / 50.58,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: width/16.34),
                        child: GestureDetector(
                          onTap: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                              builder: (context, child) {
                                return Theme(
                                  data: ThemeData.dark().copyWith(
                                    // Background color
                                    colorScheme: ColorScheme.dark(
                                      // Primary color (header, selected time)
                                      primary: Colors.blue,
                                      // Dialog background color
                                      surface: Colors.black,
                                      // Selected hour/minute background
                                      onSurface: Colors.white,
                                    ),
                                    // Time picker dialog background color
                                    timePickerTheme: TimePickerThemeData(
                                      backgroundColor: Colors.black,
                                      hourMinuteShape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      dayPeriodShape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      dayPeriodColor: Colors.grey.withOpacity(0.1),
                                      dayPeriodTextColor: Colors.white,
                                      hourMinuteColor: Colors.grey.withOpacity(0.1),
                                      hourMinuteTextColor: Colors.white,
                                      dialHandColor: Colors.blue,
                                      dialBackgroundColor: Colors.grey.withOpacity(0.1),
                                      dialTextColor: Colors.white,
                                      entryModeIconColor: Colors.white,
                                    ),
                                    // Text button color
                                    textButtonTheme: TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                            );

                            if (pickedTime != null) {
                              setState(() {
                                final now = DateTime.now();
                                final formattedTime = DateFormat('h:mm a').format(
                                  DateTime(now.year, now.month, now.day, pickedTime.hour, pickedTime.minute),
                                );
                                selectedTime = formattedTime;
                              });
                            }
                          },
                          child: Container(
                            height: height / 15.45,
                            width: width / 2.90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(23),
                              color: Colors.grey.withOpacity(0.10),
                            ),
                            child: Center(
                              child: Text(
                                selectedTime,
                                style: TextStyle(
                                  fontFamily: "intermedi",
                                  fontSize: 13,
                                  color: CupertinoColors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: width/18.56,),
                      Text("To",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "interlight",
                        fontSize: 15
                      ),
                      ),
                      SizedBox(
                        height: height / 50.58,
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: width/16.34),
                        child: GestureDetector(
                          onTap: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                              builder: (context, child) {
                                return Theme(
                                  data: ThemeData.dark().copyWith(
                                    // Background color
                                    colorScheme: ColorScheme.dark(
                                      // Primary color (header, selected time)
                                      primary: Colors.blue,
                                      // Dialog background color
                                      surface: Colors.black,
                                      // Selected hour/minute background
                                      onSurface: Colors.white,
                                    ),
                                    // Time picker dialog background color
                                    timePickerTheme: TimePickerThemeData(
                                      backgroundColor: Colors.black,
                                      hourMinuteShape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      dayPeriodShape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      dayPeriodColor: Colors.grey.withOpacity(0.1),
                                      dayPeriodTextColor: Colors.white,
                                      hourMinuteColor: Colors.grey.withOpacity(0.1),
                                      hourMinuteTextColor: Colors.white,
                                      dialHandColor: Colors.blue,
                                      dialBackgroundColor: Colors.grey.withOpacity(0.1),
                                      dialTextColor: Colors.white,
                                      entryModeIconColor: Colors.white,
                                    ),
                                    // Text button color
                                    textButtonTheme: TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                            );

                            if (pickedTime != null) {
                              setState(() {
                                final now = DateTime.now();
                                final formattedTime = DateFormat('h:mm a').format(
                                  DateTime(now.year, now.month, now.day, pickedTime.hour, pickedTime.minute),
                                );
                                selectedTimeTo = formattedTime;
                              });
                            }
                          },
                          child: Container(
                            height: height / 15.45,
                            width: width / 2.90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(23),
                              color: Colors.grey.withOpacity(0.10),
                            ),
                            child: Center(
                              child: Text(
                                selectedTimeTo,
                                style: TextStyle(
                                    fontFamily: "intermedi",
                                    fontSize: 13,
                                    color: CupertinoColors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 8.58,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: width/4.78),
                    child: bottonContainer(
                        width/1.70,
                        height/17.56,
                            (){
                          // value1.dateAndTimeAdd(selectedDate, selectedTime, selectedTimeTo);
                          value1.availableDateAndTime(
                              selectedDate,
                              selectedTime,
                              selectedTimeTo,
                              context,
                              widget.price,
                              widget.image,
                            widget.name

                          );
                        },
                        "Next"
                    ),
                  ),
                ],
              ),
          );
        }
      ),
    );
  }
}
