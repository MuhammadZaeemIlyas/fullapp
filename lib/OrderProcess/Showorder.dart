import 'package:flutter/material.dart';
import 'package:mini_ui_project/Appicons/Appbar.dart';
import 'package:mini_ui_project/OrderProcess/Widgets/widgets.dart';
import 'package:mini_ui_project/Strings/Data.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/screens/Shoppincart.dart';
import 'package:mini_ui_project/screens/home.dart';
import 'package:mini_ui_project/widget/Customwidgets.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';

class ShowOrder extends StatefulWidget {
  const ShowOrder({super.key});

  @override
  State<ShowOrder> createState() => _ShowOrderState();
}

List<Map> items1 = [
  {
    "name": "Berries",
    "Image":
        'https://images.pexels.com/photos/326131/pexels-photo-326131.jpeg?auto=compress&cs=tinysrgb&w=600',
    "object type": "Fruit",
    "Price": 35,
    'Quantity': 1,
    "riderimage":
        'https://images.pexels.com/photos/6170398/pexels-photo-6170398.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'Ordertext': 'Your Berries are on the way',
    'ridername': 'Shahzad',
  },
];

class _ShowOrderState extends State<ShowOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            CustomAppbar(bartitle: 'Orders'),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.yellow),
                      child: Center(
                        child: AppSmallText(
                          text: 'Current',
                          color: AppColors.black1,
                          size: 17,
                          weight: FontWeight.bold,
                          family: "Manrope",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 100,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.black10),
                      child: Center(
                        child: AppSmallText(
                          text: 'Past',
                          color: AppColors.black100,
                          size: 17,
                          weight: FontWeight.bold,
                          family: "Manrope",
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Orderlisttile(
                  ridername: items[index]['ridername'],
                  Orderwaytext: items[index]['Ordertext'],
                  pprice: items[index]['Price'],
                  urlimage: items[index]['Image'],
                  text: items[index]['name'],
                  riderimage: items[index]['riderimage'],
                  quantitytext: (' ${items[index]['Quantity']}'),
                );
              },
            ),
          ],
        )),
      ),
    );
  }
}
