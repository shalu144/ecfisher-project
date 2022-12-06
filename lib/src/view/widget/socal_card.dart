import 'package:flutter/material.dart';

class SocalCard extends StatelessWidget {
  const SocalCard({
    Key? key,
    this.icon,
    this.press,
  }) : super(key: key);

  final String? icon;
  final Function? press;

  @override
  Widget build(BuildContext context) {
  double scrwidth = MediaQuery.of(context).size.width;
  double scrheight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal:  (10/ 375.0) * scrwidth),
        padding: EdgeInsets.all((12/ 375.0) * scrwidth),
        height: (40/ 375.0) * scrheight,
        width: (40/ 375.0) * scrwidth,
        decoration: const BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle,
        ),
        // child: SvgPicture.asset(icon!),
      ),
    );
  }
}
