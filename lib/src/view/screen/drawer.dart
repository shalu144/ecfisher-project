import '/core/app_color.dart';
import 'package:flutter/material.dart';




class MyDrawer extends StatelessWidget {
  MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      // color: Colors.amberAccent,
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:const [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("ECFisher",
                        style: TextStyle(
                            fontSize: 28,
                            color: AppColor.theme,
                            fontFamily: "fount1",
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            const drwlistcard(
                name: "",
                titlename: "Notifications",
                icon: Icons.notifications),
            const drwlistcard(
                name: "", titlename: "Contect Us", icon: Icons.contact_page),
            const drwlistcard(name: "", titlename: "About Us", icon: Icons.help),
            const drwlistcard(name: "", titlename: "Rate Us", icon: Icons.star),
            const drwlistcard(name: "", titlename: "Share App", icon: Icons.share),
            const drwlistcard(name: "", titlename: "FAQ", icon: Icons.star),
            const drwlistcard(
                name: "",
                titlename: "Terms&conditions",
                icon: Icons.edit_calendar),
            const drwlistcard(
                name: "", titlename: "Privacy Policy", icon: Icons.privacy_tip),
          ],
        ),
      ),
    );
  }
}

class drwlistcard extends StatelessWidget {
  const drwlistcard({
    Key? key,
    required this.name,
    required this.titlename,
    required this.icon,
  }) : super(key: key);

  final String name;
  final String titlename;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        print(name);
      }),
      child: ListTile(
        title: Text(
          titlename,
          style: TextStyle(fontFamily: "fount3"),
        ),
        leading: Icon(
          icon,
          color: AppColor.theme,
        ),
      ),
    );
  }
}
