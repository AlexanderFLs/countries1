import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
  final String title;
  const Header({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150.sp,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.sp),
            bottomRight: Radius.circular(30.sp),
          )),
      child: Center(
        child: SafeArea(
            child: Text(
          title,
          style: TextStyle(
              fontSize: 36.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
