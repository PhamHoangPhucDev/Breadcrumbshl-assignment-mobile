import 'package:flutter/material.dart';

class HeaderHomeElement extends StatelessWidget {
  const HeaderHomeElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*.1,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/logo.png',width: MediaQuery.of(context).size.width*.2,),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Handicrafted by",style: TextStyle(color: Colors.grey),),
                  Text("JimHLS")
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*.2,
                child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage("assets/images/nu-cuoi-tieng-anh-la-gi.png"),
                      backgroundColor: Colors.transparent,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}