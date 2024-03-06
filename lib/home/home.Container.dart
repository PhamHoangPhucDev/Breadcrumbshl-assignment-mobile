import 'package:flutter/material.dart';
import 'elements/footer.Element.dart';
import 'elements/title.Element.dart';

import 'elements/header.Element.dart';
import 'home.Controller.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  HomeController controller = HomeController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      controller.listJokes = await controller.loadDataJokes();
      await controller.clearJokesWatched();
      await controller.saveJokesWatched(controller.index,"joke");
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            HeaderHomeElement(),
            TitleElement(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    controller.listJokes.isEmpty
                    ?CircularProgressIndicator()
                    :Text('${controller.listJokes[controller.index].description}'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildButton(color: Colors.blue,text: "This is Funny!",),
                        _buildButton(color: Colors.green,text: "This is not funny.",),
                      ],
                    )
                  ],
                ),
              ),
            ),
            FooterElement(),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({String? text,Color? color}){
    final ButtonStyle flatButtonStyle = ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: color,
      padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
      side: BorderSide.none,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero))
    );
    return ElevatedButton(
      onPressed: (){
        if(controller.index<controller.listJokes.length-1) {
          controller.index++;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("That's all the jokes for today! Come back another day!"))
          );
        }
        controller.saveJokesWatched(controller.index,text??"");
        setState(() {});
      },
      style: flatButtonStyle,
      child: Align(
        alignment: Alignment.center,
        child: Text(text??"",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.normal)),
      ),
    );
  }

}