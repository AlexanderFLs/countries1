import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListBuilder extends StatelessWidget {
  final Future request;
  final int lenght;
  final   Widget Function(BuildContext, int) child;
  const ListBuilder(
      {Key? key,
      required this.request,
      required this.lenght,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: request,
      builder: (context, snapshot) {
        return SizedBox(
          height: 500.h,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: lenght,
            itemBuilder: child
            
            
          ),
        );
      },
    );
  }
}
