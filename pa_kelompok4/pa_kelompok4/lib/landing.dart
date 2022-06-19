import 'package:flutter/material.dart';
import 'package:pa_kelompok4/login.dart';
import 'package:pa_kelompok4/main_page.dart';
import 'package:get/get.dart';
import 'package:pa_kelompok4/regis.dart';
import 'package:pa_kelompok4/testimoni.dart';
import 'switchController.dart';

class landing extends StatelessWidget {
  final switchController d = Get.put(switchController());

  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;

    var width;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Obx(() => Container(
              color: d.switchValue.value
                  ? Color.fromARGB(255, 187, 255, 0)
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
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/background.jpeg"),
          fit: BoxFit.cover,
        )),
        child: ListView(
        children: [
          Text(
            "PISCOK LUMER SHOP",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            "Online Shop Pisang Coklat",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 250,
                margin: EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(65),
                  image: DecorationImage(
                    image: AssetImage("assets/logo.jpg"),
                  ),
                ),
              ),
              Text(
                "\n\n Kami Tidak Akan Meremehkan Permintaan Pelanggan Walaupun Permintaan Yang Aneh Aneh :)",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Obx(() => ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => regis()));
                  },
                  style: TextButton.styleFrom(
                    alignment: Alignment.center,
                    backgroundColor: d.switchValue.value
                  ? Color.fromARGB(255, 187, 255, 0)
                  : Color.fromARGB(255, 238, 255, 0),
                    shadowColor: d.switchValue.value
                  ? Color.fromARGB(255, 187, 255, 0)
                  : Color.fromARGB(255, 238, 255, 0),
                    elevation: 5,
                    side: BorderSide(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                  child: const Text(
                    "REGIS",
                    style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),
              Obx(() => ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => login()));
                  },
                  style: TextButton.styleFrom(
                    alignment: Alignment.center,
                    backgroundColor: d.switchValue.value
                  ? Color.fromARGB(255, 187, 255, 0)
                  : Color.fromARGB(255, 238, 255, 0),
                    shadowColor: d.switchValue.value
                  ? Color.fromARGB(255, 187, 255, 0)
                  : Color.fromARGB(255, 238, 255, 0),
                    elevation: 5,
                    side: BorderSide(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
