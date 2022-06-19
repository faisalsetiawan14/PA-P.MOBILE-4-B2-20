import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pa_kelompok4/alert.dart';
import 'package:pa_kelompok4/riwayat_pesanan.dart';
import 'switchController.dart';
import 'landing_page.dart';

class login extends StatelessWidget {
  final switchController d = Get.put(switchController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Obx(() => Container(
              color: d.switchValue.value
                  ? Color.fromARGB(255, 178, 255, 0)
                  : Color.fromARGB(255, 238, 255, 0),
            )),
        actions: [
          Obx(() => Switch(
                value: d.switchValue.value,
                onChanged: (newValue) {
                  d.switchValue(newValue);
                },
              )),
        ],
      ),
      body: Center(
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(1), BlendMode.dstATop),
                image: AssetImage("assets/background2.jpeg"),
              ),
            ),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 200,
                    ),
                    Stack(
                      children: <Widget>[
                        Text(
                          'LOGIN',
                          style: TextStyle(
                            fontSize: 25,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = Color.fromARGB(255, 36, 33, 33),
                          ),
                        ),
                        Text(
                          'LOGIN',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 104, 109, 104),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 238, 255, 0),
                                width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 36, 33, 33),
                                width: 3),
                          ),
                          hintText: "Email"),
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: passController,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 104, 109, 104),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 238, 255, 0),
                                width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 36, 33, 33),
                                width: 3),
                          ),
                          hintText: "Password"),
                      keyboardType: TextInputType.text,
                    ),
                    Container(
                      height: 90,
                      width: 130,
                      padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                      child: Obx(
                        () => ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: d.switchValue.value
                                  ? Color.fromARGB(255, 178, 255, 0)
                                  : Color.fromARGB(255, 238, 255, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () async {
                              try {
                                await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passController.text);
                                Navigator.pop(context);
                                if(emailController.text == "kelompok4@gmail.com" && passController.text == "kelompok4pa") {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RiwayatPesanan()));
                                } else {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Pisangcoklat()));
                                }
                                emailController.text = '';
                                passController.text = '';
                              } on FirebaseAuthException catch(e) {
                                CustomAlert(context, e.message.toString());
                              }
                            }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
