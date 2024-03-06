import 'package:flutter/material.dart';

class FooterElement extends StatelessWidget {
  const FooterElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*.3,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Divider(indent: 0,endIndent: 0,),
          Text("This appis created as part of Hlsolutions program. The materials con-tained on this website are provided for general information only and do not constitute any form of advice.HLS assumes no responsibility for the accuracy of any particular statement and accepts no liability for any loss or damage which may arise from reliance on the infor-mation contained on this site",style: TextStyle(color: Colors.black.withOpacity(.5),),textAlign: TextAlign.center,),
          SizedBox(height: 10,),
          Text("Copyright 2021 HLS",style: TextStyle(color: Colors.black,fontSize: 14),),
          Divider(indent: 0,endIndent: 0,),

        ],
      ),
    );
  }
}