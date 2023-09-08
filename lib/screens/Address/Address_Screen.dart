import 'package:flutter/material.dart';
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
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.only(right: 25, left: 25),
          itemCount:
              Address.length, // Replace with the actual number of addresses

          itemBuilder: (context, index) {
            return AddressContainer(
              isSelected: selectedAddressIndex == index,
              onSelect: (isSelected) {
                setState(() {
                  selectedAddressIndex = isSelected ? index : -1;
                });
              },
            );
          },
        ),
      ),
    );
  }
}
