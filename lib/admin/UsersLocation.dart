import 'package:body_blast/Provider/loginProvider.dart';
import 'package:body_blast/admin/Admin%20BottomBar.dart';
import 'package:body_blast/constants/bodyContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/AppBar Texts.dart';
import '../constants/Navigator.dart';
import '../user/Bottom Navigation.dart';
import 'Allusers Map.dart';

class Userslocation extends StatefulWidget {
  const Userslocation({super.key});

  @override
  State<Userslocation> createState() => _UserslocationState();
}

class _UserslocationState extends State<Userslocation> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Consumer<LoginProvider>(
      builder: (context1,value1,child) {
        return Scaffold(
          body: bodyContainer(
            height,
            width,
            Column(
              children: [
                SizedBox(height: height / 16.45),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width / 23.45),
                      child: GestureDetector(
                        onTap: () {
                          callNext(context, AdminBottomBar());
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
                    appbarText("Users Location", width / 14.84),
                    Container(
                      width: width / 5.50,
                      height: height / 20.45,
                    ),
                  ],
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await value1.getUserInfoForLocation(context);
                    },
                    child: ListView.builder(
                      itemCount: value1.userLocationList.length,
                      itemBuilder: (context, index) {
                        final item = value1.userLocationList[index];
                        return Padding(
                          padding: EdgeInsets.only(left: width / 16.34, bottom: height / 50),
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
                                  SizedBox(height: height / 70.45),
                                  Row(
                                    children: [
                                      Container(
                                        height: height / 10.81,
                                        width: width / 5.48,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(item.userImageLo),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: width / 25.45),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.userNameLo,
                                            style: TextStyle(
                                              fontFamily: "jeju",
                                              height: height / 800.99,
                                              fontSize: width / 17.6,
                                              color: CupertinoColors.white,
                                            ),
                                          ),
                                          SizedBox(height: height / 33.56),
                                          GestureDetector(
                                            onTap: () async{
                                         await value1.getUserCurrentLocatoin(item.userId, context);
                                            },
                                            child: Container(
                                              height: height / 33.67,
                                              width: width / 3.77,
                                              decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius: BorderRadius.circular(6),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Get Location",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width / 24.4,
                                                    fontFamily: "intermedi",
                                                  ),
                                                ),
                                              ),
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
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: height / 33.56),
                GestureDetector(
                  onTap: () async{
                    await value1.getUserInfoForLocation(context);
                    callNext(context, const AllUsersMap());
                  },
                  child: Container(
                    height: height / 33.67,
                    width: width / 1.77,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        "Get All Users Location",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width / 24.4,
                          fontFamily: "intermedi",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
