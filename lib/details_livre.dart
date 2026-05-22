import 'package:_9503477_exam/librairie.dart';
import 'package:_9503477_exam/login.dart';
import 'package:flutter/material.dart';


class DetailsLivre extends StatelessWidget {
  DetailsLivre({super.key, required this.livre});

  final Librairie livre; 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Scaffold(
      appBar: AppBar(
      actions: <Widget>[
    IconButton(
      icon: Icon(
        
        Icons.logout,
        // color: Colors.white,
      ),
      onPressed: (){

    Navigator.of(context).pushReplacement(
            MaterialPageRoute<void>(
            builder: (context) => Login(),
    ),
  );

      },
    )
  ],
        centerTitle: true,
        title: Text(livre.nom)),
        

body:Center(
        child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(livre.photolivre),
          
          // Text("Description : Lorem ipsum dolor sit amet consectetur adipisicing elit. Aut, eaque asperiores blanditiis aspernatur in ipsum, soluta explicabo adipisci odio vitae sunt voluptatem animi a! Dolorum illum optio cupiditate tempore inventore?Lorem ipsum dolor sit amet consectetur adipisicing elit. Aut, eaque asperiores blanditiis aspernatur in ipsum, soluta explicabo adipisci odio vitae sunt voluptatem animi a! Dolorum illum optio cupiditate tempore inventore?")
            Text(livre.details),



        ]
        
)
    ),


    )
    
    );
  }
}