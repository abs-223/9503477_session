import 'package:_9503477_exam/login.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loadingscreen extends StatefulWidget {
  const Loadingscreen({super.key});

  @override
  State<Loadingscreen> createState() => _LoadingscreenState();
}

class _LoadingscreenState extends State<Loadingscreen> {
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
            MaterialPageRoute<void>(
            builder: (context) => Login(),
    ),
  );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.network('https://lottie.host/e10283e7-0d85-4bc3-bbb3-334d5fcbaf24/5sVTQlrv0j.json'),),
    );
  }
}