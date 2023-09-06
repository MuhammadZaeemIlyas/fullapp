import 'package:flutter/material.dart';
import 'package:mini_ui_project/Strings/Data.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/constan/appIcons.dart';
import 'package:mini_ui_project/screens/BuyScreen.dart';
import 'package:mini_ui_project/screens/Shoppincart.dart';
import 'package:mini_ui_project/widget/Customwidgets.dart';
import 'package:mini_ui_project/widget/appLargeText.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

int v = 0;
int amount = 2;
int fixedamount = 12;
int result = 12;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                    trailing: AppIcons.bag,
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
                        hintStyle: TextStyle(color: AppColors.black45),
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
                    padding: const EdgeInsets.only(top: 2, left: 25),
                    child: Customwidgets(
                      text1: "Get",
                      text2: "50% OFF",
                      text3: "On first 03 Order",
                    ),
                  ),
                  //SizedBox(width: 2),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 5),
                    child: Customwidgets(
                      text1: "Get",
                      text2: "50% OFF",
                      text3: "On first 03 Order",
                    ),
                  ),
                  //              SizedBox(width: 2),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 5),
                    child: Customwidgets(
                      text1: "Get",
                      text2: "50% OFF",
                      text3: "On first 03 Order",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisExtent: 300,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 50),
              itemCount: Data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
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
                      firstUnittext: 'Unit',
                      itemname: Data[index]['name'],
                      itemtype: Data[index]['object type'],
                      pricetext: Data[index]['Price'],
                      pressed: () {
                        setState(() {
                          if (index >= 0 && index < AddtoCart.length) {
                            // Check if the index is within the valid range
                            AddtoCart.add(
                                Data[index]["Image"]["name"]["Price"]);
                            print(AddtoCart);
                            print('afdsafasdfhello');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => ShoppingCart(
                                      simageurl: AddtoCart[index]['Image'],
                                      sitemname: AddtoCart[index]['name'],
                                      sprice: AddtoCart[index]['Price'],
                                    )),
                              ),
                            );
                          } else {
                            // Handle the case where index is out of bounds
                            print('Index out of bounds: $index');
                          }
                        });
                      },
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
