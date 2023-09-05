import 'package:flutter/material.dart';
import 'package:ecfisher/src/view/widget/safearea_widget.dart';
import 'package:ecfisher/src/view/widget/app_loader_widget.dart';


class AccountOrderDetailScreen extends StatefulWidget {
  // final AccountOrderDetailController controller =AccountOrderDetailController();
  AccountOrderDetailScreen({Key? key}):super(key:key);


  State<AccountOrderDetailScreen> createState() => AccountOrderDetailScreenState();

}

class AccountOrderDetailScreenState extends State<AccountOrderDetailScreen>{
  int? _orderId;
  // Order? _order;
  bool _isLoading =true;


  // init() async {
  //   _orderId=widget.controller.data();
  //   await _fetchOrder();

  // }
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      leading: Container(
        child:IconButton(onPressed: ()=> Navigator.pop(context), 
        icon:Icon(Icons.arrow_back_ios), ),
        margin: EdgeInsets.only(left:0),
      ),
      // title:Text("${trans("Order").capitalize()} #${_orderId.toString()}"),
      centerTitle: true,
    ),
    resizeToAvoidBottomInset: false,
    body:SafeAreaWidget(
      child:_isLoading
      ?AppLoaderWidget()
      :Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(padding:EdgeInsets.only(top:8),
          // child:Text("${trans("Date Order").capitalize()}:${dateFormatted(
          //   date:_order?.dateCreated ?? "",
          //   formatType:formatForDateTime(FormatType.date),
          // )}")
          ),
          // Container(
          //   margin:EdgeInsets.only(top:10, bottom:10),
          //   padding:EdgeInsets.symmetric(horizontal:16, vertical: 16),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,

          //     children: <Widget>[
          //       Flexible(child: Text("${trans("Fish to").capitalize()}:"),
          //       ),
          //       Flexible(child: Text(
          //         [
          //           [
          //             _order!.shipping!.firstName,
          //             _order!.shipping!.lastName
                      
          //           ].
          //         ]
          //       ),)
          //     ]),
          // )
        ],)
    )
  );
}

}