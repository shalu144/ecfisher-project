
import 'package:flutter/material.dart';
import 'dart:math';


import '../../../core/app_color.dart';
import 'drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../core/app_data.dart';
import '../../controller/product_controller.dart';
import '../widget/product_grid_view.dart';
import 'order_tracking.dart';



final ProductController controller = Get.put(ProductController());
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool drwearopen = false;
  int selectBtn = 0;
  final _searchvalue = TextEditingController();
  int pageIndex = 0;


  double vlu = 0;

  @override
  Widget build(BuildContext context) {
    double scrheight = MediaQuery.of(context).size.height;
    double scrwidth = MediaQuery.of(context).size.width;
    
  Widget _recommendedProductListView(BuildContext context) {
    return SizedBox(
      height: 170,

      child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10),
          shrinkWrap: true,
          
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: AppData.recommendedProducts.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                  image: const DecorationImage(
            image: NetworkImage("https://ecfisher.com/admin/upload/slider/1621235992666.png"),
            fit: BoxFit.cover,
          ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                    const Spacer(),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: AppData.recommendedProducts[index]
                                  .buttonBackgroundColor,
                              elevation: 0,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: Text(
                              "Get Now",
                              style: TextStyle(
                                  color: AppData.recommendedProducts[index]
                                      .buttonTextColor!),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _topCategoriesHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Top categories",
            style: Theme.of(context).textTheme.headline4,
          ),
          TextButton(
            onPressed: () {
              setState(() {
                controller.switchBetweenBottomNavigationItems (2);
              });
            },
            style: TextButton.styleFrom(primary: AppColor.theme),
            child: Text(
              "SEE ALL",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: AppColor.theme.withOpacity(0.7)),
            ),
          )
        ],
      ),
    );
  }

  Widget _topCategoriesListView() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
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
                  child: IconButton(
                    splashRadius: 0.1,
                    icon: FaIcon(controller.categories[index].icon,
                        color: controller.categories[index].isSelected == false
                            ? AppColor.theme
                            : Colors.white),
                    onPressed: () => controller.filterItemsByCategory(index),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }


    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                // gradient: LinearGradient(
                //     // colors: [Colors.purpleAccent, Colors.deepPurpleAccent],
                //     begin: Alignment.bottomCenter,
                //     end: Alignment.topCenter)
                ),
          ),
          SafeArea(child: MyDrawer()),
          TweenAnimationBuilder(
              curve: Curves.easeInOut,
              tween: Tween<double>(begin: 0, end: vlu),
              duration: const Duration(milliseconds: 500),
              builder: (_, double val, __) {

                return (Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..setEntry(0, 3, 200 * val)
                      ..rotateY((pi / 6) * val),
                    child: Scaffold(
                      backgroundColor: AppColor.light,
                      appBar: AppBar(
                        automaticallyImplyLeading: false,
                        backgroundColor: AppColor.theme,
                        toolbarHeight: scrheight * 0.136,
                        title: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: (() { 
                                        setState(() {
                                          vlu == 0 ? vlu = 1 : vlu = 0;
                                          if(drwearopen== true){
                                            drwearopen= false;
                                          }
                                          else{ drwearopen= true;}
                                        });
                                      }),
                                      tooltip: MaterialLocalizations.of(context)
                                          .openAppDrawerTooltip,
                                      icon:drwearopen== true?Icon(Icons.close): Icon(Icons.menu)),
                                  const Text(
                                    "ECFisher",
                                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                  ),
                                  InkWell(
                                      onTap: (() {
                                       
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (_) => OrderTracking(),
                                          ),
                                        );
                                      }),
                                      child:  Icon(Icons.shopping_cart)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    padding: const EdgeInsets.only(
                                        bottom: 5, right: 10, left: 10),
                                    height: scrheight * 0.06,
                                    width: scrwidth * 0.8,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: TextField(
                                        controller: _searchvalue,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(fontSize: 20),
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    150, 255, 255, 255)),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          focusedBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255)),
                                          ),
                                          hintText: "Search",
                                          hintTextDirection: TextDirection.ltr,
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              // filterorder(orderid, context);
                                            },
                                            icon: const Icon(
                                              Icons.search,
                                              color: Color.fromARGB(
                                                  255, 73, 73, 73),
                                            ),
                                          ),
                                          hintStyle: const TextStyle(
                                            color: Color.fromARGB(
                                                149, 122, 122, 122),
                                            fontSize: 16,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        // onChanged: _onItemTapped,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    body:SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Container(child: _recommendedProductListView(context)),
                _topCategoriesHeader(context),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: _topCategoriesListView(),
                ),
                const SizedBox(height: 800, child: ProductGridView())
              ],
            ),
          ),
        ),
      ), 
                    ))
                    );
              }),
          // GestureDetector(
          //   onHorizontalDragUpdate: (e) {
          //     if (e.delta.dx > 0) {
          //       setState(() {
          //         vlu = 1;
          //       });
          //     } else {
          //       setState(() {
          //         vlu = 0;
          //       });
          //     }
          //   },
          // )
        ],
      ),
    );
  }

}
