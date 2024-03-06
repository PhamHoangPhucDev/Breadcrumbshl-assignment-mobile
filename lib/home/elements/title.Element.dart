import 'package:flutter/material.dart';

class TitleElement extends StatelessWidget {
  const TitleElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*.2,
      width: MediaQuery.of(context).size.width,
      color: Color(0xFF30a14e),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("A joke a day keeps the doctor away",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w500),),
          Text("If you joke wrong way, your teeth have to pay. (Serious)",style: TextStyle(fontSize: 14,color: Colors.white),),
          
        ],
      ),
    );
  }
}