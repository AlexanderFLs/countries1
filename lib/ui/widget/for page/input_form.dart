import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputForm extends StatelessWidget {

  final TextEditingController textController;
  final GlobalKey<FormState> formKey;
  InputForm({
    Key? key, required this.textController, required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
          Container(
            width: 250.sp,
            child: Form(
              key: formKey,
              child: TextFormField(
                controller: textController,
                validator: (value) {
                  if (value!.isEmpty || int.parse(value) > 100) {
                    return 'Неправильное число';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                maxLength: 3,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    labelText: 'Input number 1-100',
                    labelStyle: TextStyle(color: Colors.white)),
              ),
            ),
          );
          
        
      
    
  }
}

