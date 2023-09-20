import 'package:flutter/material.dart';
import 'package:mini_ui_project/Appicons/Appbar.dart';
import 'package:mini_ui_project/OrderProcess/AddCardscreen.dart';
import 'package:mini_ui_project/MainData/Data.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/screens/Address/widgets.dart';
import 'package:mini_ui_project/widget/Customwidgets.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  int selectedAddressIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppbar(
                Appback: () {
                  Navigator.pop(context);
                },
                bartitle: "Checkout",
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: Address.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      AppSmallText(
                        text: 'Select Delivery Address',
                      ),

                      AddressContainer(
                        index: Address[index],
                        Maintext: Address[index]['home'],
                        address: Address[index]['Address'],
                        state: Address[index]['Status'],
                        isSelected: selectedAddressIndex == index,
                        onSelect: (isSelected) {
                          setState(() {
                            selectedAddressIndex = isSelected ? index : -1;
                          });
                        },
                      ),
                      SizedBox(
                          height: 10), // Add spacing between address containers
                    ],
                  );
                },
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_rounded,
                      color: Colors.green,
                      size: 30,
                    ),
                    DefaultText(
                      text: '    Add New Address',
                      color: AppColors.black100,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.8,
                child: AppButton(
                    text: "Add  Card",
                    color: AppColors.black1,
                    pressed: () {
                      deaddress.isEmpty
                          ? ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  duration: Duration(milliseconds: 300),
                                  content: AppSmallText(
                                    text: 'Please Select Adress to deliver',
                                  )),
                            )
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddCardscreen()));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
