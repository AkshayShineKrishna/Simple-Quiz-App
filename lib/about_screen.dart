import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 40,),
              const Text("Developer",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50
              ),),
              const SizedBox(height: 80,),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  color: Colors.yellow,
                  child: ListTile(
                    tileColor: Colors.red,
                    title: const Text("Akshay Shine Krishna"),
                    subtitle: const Text("akshayshinekrishna@gmail.com"),
                    trailing: GestureDetector(
                      onTap: () async{
                        String email = Uri.encodeComponent("akshayshinekrishna@gmail.com");
                        String subject = Uri.encodeComponent("Feedback for Quiz Hub");
                        Uri mail = Uri.parse("mailto:$email?subject=$subject");
                        if (await launchUrl(mail)) {
                          //email app opened
                        }else{
                          //email app is not opened
                        }
                      },
                      child: const Icon(Icons.mail),
                    ),
                    leading: const CircleAvatar(
                      radius: 30,
                      child: Text("A.S.K",style: TextStyle(fontSize: 20),),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 150,
              ),
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: Text("Back"))
            ],
          ),
        ),
      ),
    );
  }
}
