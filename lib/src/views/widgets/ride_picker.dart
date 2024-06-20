import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RidePicker extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RidePickerState();
  }
}

class _RidePickerState extends State<RidePicker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          width: 350,
          height: 50,
          child: InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 20),
                      child: const Icon(Icons.location_on),
                    ),
                    const Text(
                      'P17, Bình Thạnh, HCM',
                      style: TextStyle(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: () {
                      print('Xóa địac chỉ 1');
                    },
                    icon: Icon(Icons.close, color: Colors.grey),
                  ),
                ),
              ],
            ),
            onTap: () {
              print('Sự kiện chọn địa chỉ 1');
            },
          ),
        ),
        Container(
          color: Colors.white,
          width: 350,
          height: 50,
          child: InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 20),
                      child: const Icon(
                        Icons.my_location,
                        color: Colors.blue,
                      ),
                    ),
                    const Text(
                      'Home',
                      style: TextStyle(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: () {
                      print('Sự kiện xóa địa chủi 2 ');
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {
              print('Sự kiện chọn địa chỉ 2');
            },
          ),
        ),
      ],
    );
  }
}
