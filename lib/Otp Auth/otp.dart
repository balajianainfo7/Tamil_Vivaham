import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => OtpScreenState();
}

class OtpScreenState extends State<OtpScreen> {

  final countryPicker = FlCountryCodePicker();
  CountryCode? countryCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            maxLines: 1,
            decoration: InputDecoration(
              labelText: "Enter the Mobile Number",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  GestureDetector(
                    onTap: () async{
                      final code = 
                      await countryPicker.showPicker(context: context);
                      setState(() {
                        countryCode = code;
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          child: countryCode !=null ? countryCode!.flagImage:null,
                        ),
                        SizedBox(width: 10,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                          ),  
                          child: Text( countryCode ?.dialCode ?? "+1" , style: TextStyle(color: Colors.white),),
                        ),
                      ],
                    ),
                  ),
                ],),
                ),
            ),
          ),
        ],
      ),
    );
  }
}
