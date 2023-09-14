import 'package:flutter/material.dart';
import 'package:mini_ui_project/Appicons/Appbar.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/screens/Shoppincart.dart';
import 'package:mini_ui_project/widget/Customwidgets.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';

class BuyScreen extends StatefulWidget {
  final String productname;
  final int productprice;
  final String Imageontap;

  const BuyScreen(
      {super.key,
      required this.productname,
      required this.productprice,
      required this.Imageontap});

  @override
  State<BuyScreen> createState() => _BuyScreenState();
}

String Expansiontext =
    "Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Nullam quis risus eget urna mollis ornare vel eu leo.";

class _BuyScreenState extends State<BuyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stackbar(
                imagedo: widget.Imageontap,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.black10),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        AppSmallText(
                          text: widget.productname,
                          size: 25,
                          family: "Manrope",
                          weight: FontWeight.bold,
                          color: AppColors.black100,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        AppSmallText(
                          text: widget.productprice?.toString() ?? 'N/A',
                          size: 25,
                          weight: FontWeight.bold,
                          family: "Manrope",
                          color: AppColors.blue,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppSmallText(
                                text: 'Details',
                                color: AppColors.black100,
                                size: 25,
                                family: 'Manrope',
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                child: AppSmallText(
                                  text: Expansiontext,
                                  color: AppColors.black100,
                                  size: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        ExpansionTile(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: AppSmallText(
                                      text: Expansiontext,
                                      color: AppColors.black100,
                                      size: 15,
                                    ),
                                  ),
                                ],
                              )
                            ],
                            title: AppSmallText(
                              size: 20,
                              text: "Nutritional Facts",
                              color: AppColors.black100,
                              family: "Manrope",
                            )),
                        SizedBox(
                          height: 2,
                        ),
                        ExpansionTile(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: AppSmallText(
                                  text: Expansiontext,
                                  color: AppColors.black100,
                                  size: 15,
                                ),
                              ),
                            ],
                            title: AppSmallText(
                              size: 20,
                              text: "Reviews",
                              color: AppColors.black100,
                              family: "Manrope",
                            )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.09,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: DefaultText(
                                      text: 'Add to Cart',
                                      color: AppColors.blue,
                                      size: 15),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(color: AppColors.blue),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    fixedSize: Size(
                                        MediaQuery.of(context).size.width,
                                        MediaQuery.of(context).size.height),
                                  )),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  height:
                                      MediaQuery.of(context).size.height * 0.09,
                                  child: AppButton(
                                    family: "Manrope",
                                    size: 15,
                                    weight: FontWeight.bold,
                                    text: 'Buy Now',
                                    color: AppColors.black1,
                                    pressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ShoppingCart(
                                                    onbackchahiye: () {
                                                      Navigator.pop(context);
                                                    },
                                                  )));
                                    },
                                  )),
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
