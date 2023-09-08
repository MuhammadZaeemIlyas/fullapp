import 'package:flutter/material.dart';
import 'package:mini_ui_project/Appicons/Appbar.dart';
import 'package:mini_ui_project/constan/appColors.dart';
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

class _BuyScreenState extends State<BuyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppColors.black10,
      //   shadowColor: AppColors.black10,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: Icon(
      //       Icons.arrow_back_ios_new_rounded,
      //       color: AppColors.black100,
      //     ),
      //   ),
      //   elevation: 0,
      //   title:
      //       AppSmallText(text: widget.productname, color: AppColors.black100),
      // ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stackbar(
            imagedo: widget.Imageontap,
          ),
     
    
          SizedBox(
            height: 10,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSmallText(
                    text: widget.productname,
                    size: 25,
                    family: "Manrope",
                    weight: FontWeight.bold,
                    color: AppColors.black100,
                  ),
                  SizedBox(width: 20,),
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
                        AppSmallText(text: 'Details',color: AppColors.black100,size: 25,family: 'Manrope',),
                         SizedBox(height: 7,),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal:2),
                           child: AppSmallText(text: 'Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Nullam quis risus eget urna mollis ornare vel eu leo.'
                           ,color: AppColors.black100,size: 15,),
                         )
                     
                      ],
                    ),

                  ),
                  SizedBox(height: 7,),
                  Container(
             
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.09,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: AppSmallText(
                                  text: 'Add to Cart',
                                  family: "Manrope",
                                  color: AppColors.blue,
                                  size: 15),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: AppColors.blue),
                                    borderRadius: BorderRadius.circular(20)),
                                fixedSize: Size(MediaQuery.of(context).size.width,
                                    MediaQuery.of(context).size.height),
                              )),
                        ),
            
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
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
          ),
        ],
      ),
    );
  }
}
