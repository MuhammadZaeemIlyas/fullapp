import 'package:flutter/material.dart';
import 'package:mini_ui_project/Appicons/Appbar.dart';
import 'package:mini_ui_project/OrderProcess/Showorder.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/screens/favorite/widgets/favorite_widgets.dart';
import 'package:mini_ui_project/screens/home.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class TakingDelivery extends StatefulWidget {
  final String imagechahiye;
  final String riderimage;
  final String ridername;
  const TakingDelivery(
      {super.key,
      required this.imagechahiye,
      required this.ridername,
      required this.riderimage});

  @override
  State<TakingDelivery> createState() => _TakingDeliveryState();
}

class _TakingDeliveryState extends State<TakingDelivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            CustomAppbar(
              bartitle: "Track Order",
              Appback: () {
                Navigator.pop(context);
              },
            ),
            Container(
              margin: EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://images.pexels.com/photos/15949908/pexels-photo-15949908/free-photo-of-navigating-the-city-with-the-phone.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.black10),
            ),
            Delivertile(
                text: 'Delivery Man',
                Price: widget.ridername,
                urlImage: widget.riderimage,
                crosspressed: () {}),
            ListTile(
              leading: Icon(Icons.lock_clock),
              title:
                  AppSmallText(text: "Delivery in", color: AppColors.black100),
              subtitle: AppSmallText(text: "25 min", color: AppColors.black100),
            ),
            ListTile(
              leading: Icon(Icons.location_city),
              title: AppSmallText(
                  text: "Delivery Address", color: AppColors.black100),
              subtitle:
                  AppSmallText(text: "37 New Line", color: AppColors.black100),
            ),
          ],
        )),
      ),
    );
  }
}
