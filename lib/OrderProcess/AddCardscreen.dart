import 'package:flutter/material.dart';
import 'package:mini_ui_project/Appicons/Appbar.dart';
import 'package:mini_ui_project/OrderProcess/Showorder.dart';
import 'package:mini_ui_project/OrderProcess/Widgets/widgets.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/screens/Shoppincart.dart';
import 'package:mini_ui_project/widget/Customwidgets.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';

class AddCardscreen extends StatefulWidget {
  const AddCardscreen({super.key});

  @override
  State<AddCardscreen> createState() => _AddCardscreenState();
}

bool paymentsuccess = false;

class _AddCardscreenState extends State<AddCardscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    CustomAppbar(
                      Appback: () {
                        Navigator.pop(context);
                      },
                      bartitle: "Add Card",
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 30),
                      child: Container(
                        child: Column(
                          children: [
                            CustomTextfield(
                              title: "CARD HOLDER NAME",
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomTextfield(
                              title: "CARD NUMBER",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: CustomTextfield(title: "EXP DATE")),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                        child: CustomTextfield(
                      title: "CVC",
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.20,
              ),
              Customcalculator(
                  text1: 'Subtotal',
                  text2: '$Subtotal',
                  text3: 'Delivery',
                  text4: '$Delivery',
                  text5: 'Total',
                  text6: '$Total',
                  buttonpressed: () {
                    setState(() {
                      paymentsuccess = true;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowOrder(
                            backshow: () {
                              Navigator.pop(context);
                            },
                          ),
                        ));
                  },
                  BtnText: 'Make Payment')
            ],
          ),
        ),
      ),
    );
  }
}
