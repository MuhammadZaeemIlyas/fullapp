import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/widget/Customwidgets.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';

class BuyScreen extends StatefulWidget {
  final String productname;
  final String productprice;
  final String Imageontap;

  const BuyScreen(
      {super.key,
      required this.productname,
      required this.productprice,
      required this.Imageontap});

  @override
  State<BuyScreen> createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.black100,
          ),
        ),
        elevation: 0,
        title:
            AppSmallText(text: widget.productname, color: AppColors.black100),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.black10),
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            child: Image.network(widget.Imageontap),
          ),
          Container(
            child: Column(
              children: [
                AppSmallText(
                  text: widget.productname,
                  size: 25,
                  family: "Manrope",
                  weight: FontWeight.bold,
                  color: AppColors.black100,
                ),
                AppSmallText(
                  text: widget.productprice,
                  size: 25,
                  weight: FontWeight.bold,
                  family: "Manrope",
                  color: AppColors.blue,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(onPressed: () {}, child: Text("asdas")),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.09,
                          child: AppButton(
                            family: "Manrope",
                            size: 15,
                            weight: FontWeight.bold,
                            text: 'Buy Now',
                            color: AppColors.black1,
                            pressed: () {},
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
