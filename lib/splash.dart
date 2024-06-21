import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Splash extends StatelessWidget {


  const Splash({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 250, 0, 0),
        child: Center(
          child: Column(
            children: [
              Image.asset("Assets/images/man.png"
              ,height: 200,width: 200,alignment: Alignment.center,),
              const Text("Welcome to News App",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,),),
              const SizedBox(
                height: 2,
              ),
              const Spacer(),
              const Text("@Developed by Yash Chaturvedi",style: TextStyle(color: Colors.black38,fontSize: 13.4,),),
              const SizedBox(
                height: 12.5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
