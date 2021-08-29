import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/controller/controller.dart';

import 'package:to_do_list/ui/widget/button/custom_button.dart';
import 'package:to_do_list/ui/widget/for%20page/input_form.dart';
import 'package:to_do_list/ui/widget/layout/header.dart';
import 'package:to_do_list/ui/widget/layout/layot.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  final Controller controller = Get.find();

  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Header(
            title: 'Contries List',
          ),
          Padding(
            padding: EdgeInsets.all(15.sp),
            child: FutureBuilder(
              future: controller.getCountries(),
              builder: (context, snapshot) {
                return SizedBox(
                  height: 500.h,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: controller.allCountries.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(20.sp),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    (index + 1).toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 40.sp),
                                  ),
                                  Container(
                                    height: 100.h,
                                    width: 250.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            'Name: ${controller.allCountries[index].countryName}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.sp),
                                          ),
                                        ),
                                        Text(
                                          'Code: ${controller.allCountries[index].code}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.sp),
                                        ),
                                        Text(
                                          'GeoNameId: ${controller.allCountries[index].geonameid}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.sp),
                              child: Divider(
                                height: 3.h,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: 130.sp,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.sp),
                topRight: Radius.circular(30.sp),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InputForm(
                    textController: controller.textController,
                    formKey: controller.key),
                CustomButton(
                  color: Colors.white,
                  icon: Icon(Icons.forward),
                  onPress: () {
                    controller.validate();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
