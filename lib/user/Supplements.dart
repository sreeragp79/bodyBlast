import 'package:body_blast/Provider/adminProvider.dart';
import 'package:body_blast/constants/Loading.dart';
import 'package:body_blast/constants/bodyContainer.dart';
import 'package:body_blast/models/class.dart';
import 'package:body_blast/user/SupplementsDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/AppBar Texts.dart';
import '../constants/Navigator.dart';
import 'Bottom Navigation.dart';

class Supplements extends StatefulWidget {
  const Supplements({super.key});

  @override
  State<Supplements> createState() => _SupplementsState();
}

class _SupplementsState extends State<Supplements> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Consumer<AdminProvider>(
      builder: (context,value1,child) {
        final supplementItem = value1.supplementsList;
        return Scaffold(
          body:  bodyContainer(height, width,
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height / 16.45),
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
                  SizedBox(width: width / 6.34),
                  appbarText("Supplements",width/18.84),
                ],
              ),
              SizedBox(height: height / 50.56),
              // search funciton..
          
              Autocomplete<AdminSupplementsClass>(
                optionsBuilder: (TextEditingValue textEditingValue){
                  if (textEditingValue.text.isEmpty) {
                    return const Iterable<AdminSupplementsClass>.empty();
                  }
                  return value1.supplementsList.where((AdminSupplementsClass option) {
                    return option.supplementName.toLowerCase().contains(textEditingValue.text.toLowerCase());
                  });
                },
                fieldViewBuilder: (context, fieldController, focusNode, onFieldSubmitted) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    fieldController.text = value1.supplementSearchController.text;
                  });
                  return Padding(
                    padding: EdgeInsets.only(left: width / 21.45),
                    child: Container(
                      width: width / 1.11,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.45),
                          width: width / 999.99,
                        ),
                      ),
                      child: TextField(
                        controller: fieldController,
                        focusNode: focusNode,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "interlight",
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search...',
                          contentPadding: EdgeInsets.symmetric(horizontal: width / 13.56),
                          hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.80),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                onSelected: (AdminSupplementsClass supple) {
                  callNext(context, Supplementsdetails(
                   suppleImage: supple.supplementImage,
                    suppleName: supple.supplementName,
                    suppleBrand: supple.supplementBrand,
                    supplePrice: supple.supplementPrice,
                  ));
                },
                optionsViewBuilder: (context, onSelected, options) {
                  return Align(
                    alignment: Alignment.topCenter,
                    child: Material(
                      child: Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.zero,
                        width: width/1.2,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        child: ListView.builder(padding: EdgeInsets.zero,
                          itemCount: options.length,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            List<AdminSupplementsClass> optionsList = options.toList();
                            return SizedBox(
                              height: 50,
                              child: ListTile(
                                // contentPadding: EdgeInsets.symmetric(vertical: 0),
                                title: Text(optionsList[index].supplementName,
                                  style: TextStyle(
                                      color: Colors.blue.withOpacity(1)
                                  ),
                                ),
                                onTap: (){
                                  onSelected(optionsList[index]);
                                },
                                trailing: SizedBox(
                                  child: Image.network(optionsList[index].supplementImage,
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: height/70.56,),
              Padding(
                padding: EdgeInsets.only(left: width / 15.10),
                child: appbarText("Supplements",width/18.84),
              ),
              Expanded(
                child: SizedBox(
                  height: height/5.45,
                  child: Padding(
                    padding: EdgeInsets.only(left: width / 20.45),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: supplementItem.length,
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                             onTap: () {
                               callNext(context, Supplementsdetails(
                                 suppleImage: supplementItem[index].supplementImage,
                                 suppleName: supplementItem[index].supplementName,
                                 suppleBrand: supplementItem[index].supplementBrand,
                                 supplePrice: supplementItem[index].supplementPrice,
                               ));
                             },
                              child:Container(
                                margin: EdgeInsets.only(top: height/50.56,),
                                width: width/1.10,
                                height: height/3.30,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(22),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                    image: NetworkImage(supplementItem[index].supplementImage)
                                  )
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(22),
                                  child: Image.network(
                                    supplementItem[index].supplementImage,
                                    fit: BoxFit.cover,
                                    loadingBuilder: (context, child, loadingProgress){
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: loader(),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90.56,),
                            Padding(
                              padding: EdgeInsets.only(left: width / 39.45),
                              child: Text(
                                supplementItem[index].supplementName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontFamily: "intersemi",
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width / 39.45),
                              child: Text(
                                supplementItem[index].supplementBrand,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontFamily: "InterLight",
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width / 39.45),
                              child: Text(
                                supplementItem[index].supplementPrice,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontFamily: "interbold",
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          )
          ),
        );
      }
    );
  }
}
