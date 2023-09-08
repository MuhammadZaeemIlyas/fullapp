import 'package:flutter/material.dart';
import 'package:mini_ui_project/Appicons/Appbar.dart';
import 'package:mini_ui_project/Strings/Data.dart';
import 'package:mini_ui_project/screens/Address/widgets.dart';

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
              CustomAppbar(),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: Address.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      AddressContainer(
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
                      SizedBox(height: 10), // Add spacing between address containers
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
