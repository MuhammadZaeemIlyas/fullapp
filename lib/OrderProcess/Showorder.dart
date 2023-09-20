import 'package:flutter/material.dart';
import 'package:mini_ui_project/Appicons/Appbar.dart';
import 'package:mini_ui_project/OrderProcess/AddCardscreen.dart';
import 'package:mini_ui_project/OrderProcess/PastScreen.dart';
import 'package:mini_ui_project/OrderProcess/Takingdelivery.dart';
import 'package:mini_ui_project/OrderProcess/Widgets/widgets.dart';
import 'package:mini_ui_project/MainData/Data.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/screens/Shoppincart.dart';
import 'package:mini_ui_project/screens/home.dart';
import 'package:mini_ui_project/screens/more.dart';
import 'package:mini_ui_project/widget/Customwidgets.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';

class ShowOrder extends StatefulWidget {
  final Function() backshow;
  const ShowOrder({
    super.key,
    required this.backshow,
  });

  @override
  State<ShowOrder> createState() => _ShowOrderState();
}

List<Map> deliveryorder = [];

class _ShowOrderState extends State<ShowOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            CustomAppbar(bartitle: 'Orders', Appback: widget.backshow),
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
            paymentsuccess == false
                ? Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.black10),
                    child: Center(
                        child: AppSmallText(
                      text: "Please make payment",
                      color: AppColors.black100,
                      family: "Manrope",
                      size: 18,
                    )),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Orderlisttile(
                        trackpressed: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TakingDelivery(
                                        riderimage: items[index]['riderimage'],
                                        imagechahiye: items[index]['Image'],
                                        ridername: items[index]['ridername'],
                                      )));
                          deliveryorder.add(items[index]);
                          print(deliveryorder);
                          items.clear();
                          setState(() {});
                        },
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
