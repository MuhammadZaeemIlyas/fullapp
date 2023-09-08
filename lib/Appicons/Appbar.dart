import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: AppColors.black1,
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_sharp, size: 15),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Container(
          //     width: MediaQuery.of(context).size.width - 56, // Adjust the width to account for the back button
          //     height: MediaQuery.of(context).size.height * 0.2,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(20),
          //       // Add other decorations as needed
          //     ),
          //     child: Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
          //       child: AppSmallText(text: "Checkout", color: AppColors.black100),
          //     ),
          //   ),
          // ),
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 20),
         child: AppSmallText(text: 'Checkout',color: AppColors.black100, family: "Manrope",size: 20),
       )
        ],
      ),
    );
  }
}
class Stackbar extends StatefulWidget {
  final String imagedo; 

  const Stackbar({super.key, required this.imagedo});

  @override
  State<Stackbar> createState() => _StackbarState();
}

class _StackbarState extends State<Stackbar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(widget.imagedo),
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 20, // Adjust the top position as needed
                  left: 20, // Adjust the left position as needed
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.black1),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_sharp, size: 15),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            );
  }
}