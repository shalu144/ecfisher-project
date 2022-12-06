

import 'package:ecfisher/core/app_color.dart';
import 'package:flutter/material.dart';

import 'view/widget/default_button.dart';


class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];


  @override
  Widget build(BuildContext context) {
  double scrwidth = MediaQuery.of(context).size.width;
  double scrheight = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height:(20/ 375.0) * scrheight,),
          buildPasswordFormField(),
          SizedBox(height: (20/ 375.0) * scrheight,),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: AppColor.theme,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                // onTap: () => Navigator.pushNamed(
                //     context, ForgotPasswordScreen.routeName),
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline,color: AppColor.theme),
                ),
              )
            ],
          ),
          // FormError(errors: errors),
          SizedBox(height:(10/ 375.0) * scrheight),
          DefaultButton(
            text: "Continue",
            press: () {
              // if (_formKey.currentState!.validate()) {
              //   _formKey.currentState!.save();
              //   // if all are valid then go to success screen
              //   KeyboardUtil.hideKeyboard(context);
              //   Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              // }
            },
          ),
          SizedBox(height: (10/ 375.0) * scrheight,),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        
      },
      validator: (value) {
        
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.remove_red_eye,color: AppColor.theme,), border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
       
      },
      validator: (value) {
       
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const Icon(Icons.mail,color:AppColor.theme),
      ),
    );
  }
}
