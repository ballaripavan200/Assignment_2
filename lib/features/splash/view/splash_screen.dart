import 'package:assignment2/features/splash/view_model/splash_view_model.dart';
import 'package:assignment2/routers/routes_const.dart';
import 'package:assignment2/services/navigation_serv.dart';
import 'package:assignment2/widgets/logo/logo_w.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wellcome to ",
        style: TextStyle(color: Color.fromARGB(255, 14, 14, 14), fontSize: 20,fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: const Center(
        child: LogoW(width: 300,height: 300),
      ),
    );
  }
  @override
  void initState() {
    checkUserSession();
    super.initState();
  }

  checkUserSession() async {
    await Future.delayed(const Duration(seconds: splashDuration));
    NavigationServ().navigateTo(RoutesConst.homeScreen);
  }
}