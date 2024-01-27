import 'package:flutter/material.dart';
import 'package:quiz_app/pageone.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    timer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("QUIZ APP",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            SizedBox(height: 5,),
            Text("By Akshay Shine Krishna")
          ],
        ),
      ),
    );
  }

  Future<void> timer() async
  {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const HomeScreen()));
  }
}

