import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/controller/controller.dart';
import 'package:to_do_list/ui/widget/button/custom_button.dart';
import 'package:to_do_list/ui/widget/layout/header.dart';
import 'package:to_do_list/ui/widget/layout/layot.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cities extends StatelessWidget {
  final Controller controller = Get.find();
  final int number = 1;
  Cities({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Header(
              title: 'Cities List',
            ),

            Padding(
              padding: EdgeInsets.all(15.sp),
              child: 
               GetBuilder<Controller>(
          builder: (controller) =>
              // Obx(
              //   () => controller.spinner == false
              //       ? 
                    FutureBuilder(
                        future: controller.getCities(),
                        builder: (context, snapshot) {
                          return SizedBox(
                            height: 500.h,
                            child:Obx (() => ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: controller.allCities.length,
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
                                              (index + number).toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 40.sp),
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
                                                      'ID: ${controller.allCities[index].id}',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20.sp),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Code: ${controller.allCities[index].name}',
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
                            ),),
                          );
                        },
                      ),
                    // : Center(
                    //     child: Container(
                    //         decoration: BoxDecoration(
                    //           color: Colors.blue,
                    //           borderRadius: BorderRadius.circular(20.sp),
                    //         ),
                    //         height: 150,
                    //         width: 150,
                    //         child: Padding(
                    //             padding: EdgeInsets.all(20.sp),
                    //             child: CircularProgressIndicator(
                    //               color: Colors.white,
                    //             ))),
                      // ),
              ),
            ),
            Container(
              height: 150.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(
                      onPress: () async {
                        await controller.cleare();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.blue,
                      ),
                      color: Colors.white),
                  CustomButton(
                      onPress: () async{
                        await controller.backCityList();
                        // await controller.getCities();
                      },
                      icon: Icon(
                        Icons.skip_previous,
                        color: Colors.white,
                        size: 40.sp,
                      ),
                      color: Colors.blue),
                      CustomButton(
                      onPress: () async{
                        await controller.nextCityList();
                        // await controller.getCities();
                      },
                      icon: Icon(
                        Icons.skip_next,
                        color: Colors.white,
                        size: 40.sp,
                      ),
                      color: Colors.blue),
                ],
              ),
            ),
            //  Container(
            // decoration: BoxDecoration(
            //     color: Colors.blue, borderRadius: BorderRadius.circular(30)),
            // child: IconButton(
            //   onPressed: () {
            //     controller.updateCityList();
            //   },

            //   icon: Icon(Icons.arrow_forward, color: Colors.white),
            // )),
          ],
        ),
      ),
    );
  }
}
