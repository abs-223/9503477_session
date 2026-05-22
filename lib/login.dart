import 'package:_9503477_exam/liste_livre.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final controllerLogin = TextEditingController();
  final controllerPassword = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text('Login = 3ii et MDP = gr3ii.2025')),
  
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Connectez-vous !",
          style: TextStyle(
            fontSize: 35,
            color: const Color.fromARGB(255, 14, 89, 151),
            fontWeight: FontWeight.bold,

          ),),
          SizedBox(height: 30),

      
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: controllerLogin,
            decoration: InputDecoration(
              label: Text("Login"),
              prefixIcon: Icon(Icons.account_circle),
              hintText: "Saisir votre login",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(height: 30),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            obscureText: true,
            controller: controllerPassword,
            decoration: InputDecoration(
              label: Text("Mot de passe "),
              prefixIcon: Icon(Icons.password),
              hintText: "Saisir le mot de passe",
              border: OutlineInputBorder(),
            ),
          ),
        ),

        SizedBox(height: 30),

        OutlinedButton(onPressed: () {
          if ((controllerLogin.text == "9503477" && controllerPassword.text == "session")
          
          ){
            Navigator.of(context).pushReplacement(
            MaterialPageRoute<void>(
            // builder: (context) => MyHomePage(title: controllerLogin.text),
            builder: (context) => ListeLivre(),
    ),
  );
          }else{

          ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text('incorrect username or password')));
          }

}, child: Text("Connexion"))

        ],
      ),
    );
  }
}