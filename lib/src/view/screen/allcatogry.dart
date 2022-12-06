
import 'package:ecfisher/core/app_color.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/app_data.dart';
import '../../controller/product_controller.dart';
import '../widget/product_grid_view.dart';

final ProductController controller = Get.put(ProductController());
class CatagoryListPage extends StatefulWidget {
  const CatagoryListPage({Key? key}) : super(key: key);

  @override
  State<CatagoryListPage> createState() => _CatagoryListPageState();
}

class _CatagoryListPageState extends State<CatagoryListPage> {
  int selectBtn = 0;
  @override
  Widget build(BuildContext context) {
    double scrheight = MediaQuery.of(context).size.height;
    double scrwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.light,
      appBar: AppBar(
        backgroundColor: AppColor.theme,
        title: Text(
          firscategory[selectBtn],
          style: const TextStyle(
            fontSize: 20
          ),
        ),
        actions: const[
           Center(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: InkWell(
              child: Icon(Icons.search),
            ),
          ))
        ],
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: navigationBar(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: EdgeInsets.all(8),
              width: scrwidth - 75,
              child: ProductGridView(),
              
            ),
          ),
        ],
      ),
     );
  }

  AnimatedContainer navigationBar() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: SizedBox( width: 75.0,
        child: ListView.builder(
          itemCount: controller.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 5),
              child: GetBuilder<ProductController>(
                builder: (ProductController controller) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: 50,
                    height: 100,
                    decoration: BoxDecoration(
                      color: controller.categories[index].isSelected == false
                          ?  Colors.white
                          : AppColor.theme,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: () => controller.filterItemsByCategory(index),
                      child: Column(
                        children: [
                          IconButton(
                            splashRadius: 0.1,
                            icon: FaIcon(controller.categories[index].icon,
                                color: controller.categories[index].isSelected == false
                                    ? AppColor.theme
                                    : Colors.white),
                            onPressed: () => controller.filterItemsByCategory(index),
                          ),
                          Text("Fish",style: TextStyle(color:  controller.categories[index].isSelected == false
                                    ? AppColor.theme
                                    : Colors.white),)
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   children: [
      //     for (int i = 0; i < navBtn.length; i++)
      //       GestureDetector(
      //         onTap: () {
      //           setState(() => selectBtn = i);
      //           print(selectBtn);
      //         },
      //         child: iconBtn(i),
      //       ),
      //   ],
      // ),
    );
  }

  SizedBox iconBtn(int i) {
    bool isActive = selectBtn == i ? true : false;
    return SizedBox(
      width: 75.0,
      child: Stack(
        children: [
          Container(
            width: 65,
            height: 70,
            decoration: BoxDecoration(
              color: isActive
                  ? AppColor.theme 
                  : Colors.transparent,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Icon(
                  FontAwesomeIcons.fish,
                  color: isActive ?  Colors.white:AppColor.theme ,
                ),
              ),
              // Center(
              //   child: Image.asset(
              //     navBtn[i].imagePath,
              //     color: isActive ? selectColor : black,
              //     scale: 2,
              //   ),
              // ),
              Center(
                child: Text(
                  firscategory[i],
                  style: TextStyle(
                      color: isActive ?Colors.white:AppColor.theme  ,
                      ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
