import 'package:flutter/material.dart';

import '../../../core/app_color.dart';

class ProdectImage extends StatelessWidget {
   ProdectImage({super.key,required this.image});
  var image;

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    
        backgroundColor: AppColor.light,
        appBar: AppBar(        backgroundColor: AppColor.theme,
    
          title: const Text("Fish",
            style: TextStyle(
              fontSize: 20
            ,fontWeight: FontWeight.bold
            ),)),
        
        
     body:Center(
    child: InteractiveViewer( boundaryMargin: EdgeInsets.all(80),
      panEnabled: false,
     
      minScale: 1.0,
      maxScale: 2.2,
      
      child: Image.network(
        image,
       fit: BoxFit.fitWidth
      ),
    ),
  )
  );
}
}