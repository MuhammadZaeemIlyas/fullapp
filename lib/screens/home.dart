import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mini_ui_project/Strings/Data.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/constan/appIcons.dart';
import 'package:mini_ui_project/screens/BuyScreen.dart';
import 'package:mini_ui_project/screens/Shoppincart.dart';
import 'package:mini_ui_project/widget/Customwidgets.dart';
import 'package:mini_ui_project/widget/appLargeText.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

List<Map> items = [];
int v = 0;
int amount = 2;
int fixedamount = 12;
int result = 12;

class _HomeState extends State<Home> {
  Future<void> saveSelectedItem(Map<String, String> selectedItem) async {
    final prefs = await SharedPreferences.getInstance();

    // Convert the selected item to JSON (or any format you prefer)
    final selectedItemJson = json.encode(selectedItem);

    // Save the JSON string representing the selected item
    await prefs.setString('selectedItem', selectedItemJson);
  }

  Future<void> loadSelectedIndices() async {
    final prefs = await SharedPreferences.getInstance();
    final loadedIndices = prefs.getString('selectedIndices');
    if (loadedIndices != null) {
      final indexList =
          loadedIndices.split(',').map((e) => int.tryParse(e)).toList();
      setState(() {
        selectedIndices =
            indexList.where((element) => element != null).cast<int>().toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 15, left: 5, right: 5),
                width: double.infinity,
                height: 200,
                color: AppColors.blue,
                child: Column(
                  children: [
                    ListTile(
                      title: AppSmallText(
                        text: "Hey Halal",
                        color: AppColors.black1,
                        size: 22,
                        family: "Manrope",
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => ShoppingCart())));
                          },
                          icon: Icon(Icons.shopping_bag)),
                      iconColor: AppColors.black1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        style: TextStyle(color: AppColors.black1),
                        decoration: InputDecoration(
                          hintText: "Search Products or Store",
                          hintStyle: TextStyle(
                              color: AppColors.black45, fontFamily: 'Manrope'),
                          prefixIconColor: AppColors.black1,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          fillColor: AppColors.darkBlue,
                          filled: true,
                          prefixIcon: AppIcons.search,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 200,
                            height: 45,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppSmallText(
                                  text: "Delivery To",
                                  color: AppColors.black45,
                                  family: "Manrope",
                                ),
                                Row(
                                  children: [
                                    AppSmallText(
                                      text: "Green Way 3000,Sylhet",
                                      color: AppColors.black10,
                                      size: 15,
                                      weight: FontWeight.w500,
                                      family: "Manrope",
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: AppColors.black1,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 45,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppSmallText(
                                  text: "WITHIN",
                                  color: AppColors.black45,
                                  family: "Manrope",
                                ),
                                Row(
                                  children: [
                                    AppSmallText(
                                      text: "1 HOUR",
                                      color: AppColors.black1,
                                      family: "Manrope",
                                      size: 14,
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: AppColors.black1,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Customwidgets(
                        text1: "Get",
                        text2: "50% OFF",
                        text3: "On first 03 Order",
                        imagebanner: Data[4]['Image'],
                      ),
                    ),
                    //SizedBox(width: 2),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 20),
                      child: Customwidgets(
                        imagebanner: Data[6]['Image'],
                        text1: "Get",
                        text2: "20% OFF",
                        text3: "On first 05 Order",
                      ),
                    ),
                    //              SizedBox(width: 2),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 20),
                      child: Customwidgets(
                        imagebanner: Data[2]['Image'],
                        text1: "Get",
                        text2: "10% OFF",
                        text3: "On first 1 Order",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12, left: 12),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      mainAxisExtent: 300,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 50),
                  itemCount: Data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () async {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BuyScreen(
                                          Imageontap: Data[index]["Image"],
                                          productname: Data[index]["name"],
                                          productprice: Data[index]["Price"],
                                        )));
                          });
                        },
                        child: imagecard(
                          imagechahiye: Data[index]['Image'],
                          firstUnittext: 'Price',
                          itemname: Data[index]['name'],
                          itemtype: Data[index]['object type'],
                          pricetext: Data[index]['Price'],
                          pressed: () {
                            setState(() {
                              if (items.contains(Data[index])) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: AppSmallText(
                                    text: 'Already Added',
                                  )),
                                );
                              } else {
                                items.add(Data[index]);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: AppSmallText(
                                    text: 'Item Added in Cart',
                                  )),
                                );
                                print(items);
                              }
                            });
                          },
                        ));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
