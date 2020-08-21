import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrentDateContainer extends StatelessWidget {
  const CurrentDateContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Get.height / 9,
      decoration: BoxDecoration(
          color: Color(0xff2AA1F6), borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Text("jue 25 aug".toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            )),
      ),
    );
  }
}
