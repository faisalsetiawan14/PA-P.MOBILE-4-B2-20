import 'package:flutter/material.dart';
import 'package:pa_kelompok4/landing.dart';
import 'package:pa_kelompok4/landing_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'package:pa_kelompok4/riwayat_pesanan.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SplashScreenStart();
  }

  SplashScreenStart() {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) {
            return StreamBuilder<User?>(
            stream: FirebaseAuth.instance.userChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if(FirebaseAuth.instance.currentUser?.email == "kelompok4@gmail.com") {
                  return RiwayatPesanan();
                } else {
                  return Pisangcoklat();
                }
              } else {
                return landing();
              }
            });
          }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/logo.jpg'),
          )),
        ),
      ),
    );
  }
}
