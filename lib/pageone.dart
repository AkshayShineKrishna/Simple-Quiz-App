import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/about_screen.dart';

import 'quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Quiz Hub"),
      ),
      body: Container(
        decoration:const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg.png"),fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              children: [
                const Image(image: AssetImage("assets/images/logo.png")),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      label: const Text('Name',style: TextStyle(color: Colors.grey),),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "Enter your Name"),
                ),
                const SizedBox(
                  height: 60,
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange
                    ),
                      onPressed: () {
                      final user = nameController.text;
                      if(user.isNotEmpty) {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (
                            context) => QuizScreen(userName: user,)));
                      }
                      else{
                        final snackBar = SnackBar(
                          behavior: SnackBarBehavior.floating,
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                                title: 'Oops!',
                                message: "Enter your name to start",
                                contentType: ContentType.failure));
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snackBar);
                      }

                      },
                      child: const Text("START",style: TextStyle(color: Colors.white),)),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutScreen()));
                        //print(_NameController.toString());
                      },
                      child: const Text("ABOUT",style: TextStyle(color: Colors.white),)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
