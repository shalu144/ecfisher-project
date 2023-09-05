import 'package:ecfisher/src/view/test3.dart';
import 'package:flutter/material.dart';
import '../core/app_color.dart';
import '../src/view/widget/test3.dart';


class SignUpScreen extends StatelessWidget {
  static String id='SignUpScreen';

  

  @override
  Widget build(BuildContext context) {
  double scrwidth = MediaQuery.of(context).size.width;
  double scrheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: double.infinity,padding:
                EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          margin:   EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          decoration: BoxDecoration(
          color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                    color: AppColor.theme,
                    width: 2.0
                )
            ),
            
        
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: scrheight * 0.04),
                Text(
                  "Sign Up",
                  style: TextStyle(
                    color: AppColor.theme,
                    fontSize: (20/ 375.0) * scrwidth,
                    fontWeight: FontWeight.bold,
                  ),
                ),Text(
                  "Create a new account",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: (28/ 375.0) * scrwidth,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Text(
                //   "Sign in with your email and password  \nor continue with social media",
                //   textAlign: TextAlign.center,
                // ),
                SizedBox(height: scrheight * 0.08),
                SignUpForm(),
                NoAccountText(),
          SizedBox(height: (10/ 375.0) * scrheight,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  double scrwidth = MediaQuery.of(context).size.width;
  double scrheight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: (16/ 375.0) * scrwidth),
        ),
        GestureDetector(
          // onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: (16/ 375.0) * scrwidth,
                color: AppColor.theme),
          ),
        ),
      ],
    );
  }
}
