import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appColors.dart';

class AddressContainer extends StatefulWidget {
  final bool isSelected;
  final ValueChanged<bool> onSelect;

  const AddressContainer({
    Key? key,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  @override
  _AddressContainerState createState() => _AddressContainerState();
}

class _AddressContainerState extends State<AddressContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          widget.onSelect(!widget.isSelected);
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
            border: Border.all(
              color: widget.isSelected ? Colors.green : Colors.grey,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Home', style: TextStyle(fontWeight: FontWeight.bold)),
                    widget.isSelected
                        ? Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.green,
                                  width: 2.0,
                                ),
                                color: Colors.green),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 15,
                            ),
                          )
                        : Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                          ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('123 Main St'),
                    Text('City, Country'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
