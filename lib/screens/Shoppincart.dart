import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_ui_project/Strings/Data.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/widget/Customwidgets.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';

class ShoppingCart extends StatefulWidget {
  final String? sitemname;
  final String? sprice;
  final String? simageurl;

  const ShoppingCart({super.key, this.sitemname, this.sprice, this.simageurl});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/banner.jpg'),
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high),
                ),
              ),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: AddtoCart.length,
                  padding: EdgeInsets.only(top: 5),
                  itemBuilder: (context, index) {
                    return CustomListTile(
                      pprice: widget.sprice,
                      urlimage: widget.simageurl,
                      text: widget.sitemname,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 100, left: 100, top: 15),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppSmallText(
                            text: "Subtotal",
                            color: AppColors.black100,
                          ),
                          AppSmallText(
                            text: "\$35.96",
                            color: AppColors.black100,
                            weight: FontWeight.bold,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppSmallText(
                            text: "Delivery",
                            color: AppColors.black100,
                          ),
                          AppSmallText(
                            text: "\$2.00",
                            color: AppColors.black100,
                            weight: FontWeight.bold,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppSmallText(
                            text: "Total",
                            color: AppColors.black100,
                          ),
                          AppSmallText(
                            text: "\$37.96",
                            color: AppColors.black100,
                            weight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.09,
                  child: AppButton(
                    pressed: () {
                      print('afdsafasdfhello');
                    },
                    text: "Proceed to Checkout",
                    color: AppColors.black1,
                    family: 'Manrope',
                    weight: FontWeight.bold,
                    size: 15,
                  )),
            ],
          ),
        ));
  }
}
