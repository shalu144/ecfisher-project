import 'package:ecfisher/core/app_color.dart';
import 'package:flutter/material.dart';


class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.press, required child,
  }) : super(key: key);
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
  double scrwidth = MediaQuery.of(context).size.width;
  double scrheight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: double.infinity,
      height: (26/ 375.0) * scrheight,
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: AppColor.theme,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: (18/ 375.0) * scrwidth,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
