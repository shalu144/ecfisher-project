import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: 
        // Image.asset('assets/images/empty_cart.png'),
        Text(
          "Empty cart",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        )
      
    );
  }
}
