import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pa_kelompok4/detail_page.dart';
import 'package:pa_kelompok4/landing.dart';
import 'package:pa_kelompok4/listtestimoni.dart';
import 'package:pa_kelompok4/pemesanan.dart';
import 'package:get/get.dart';
import 'package:pa_kelompok4/riwayat_pesanan_anda.dart';
import 'switchController.dart';

class Mainpage extends StatelessWidget {
  final switchController d = Get.put(switchController());

  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Color.fromARGB(255, 238, 255, 0),
          child: ListView(
            children: [
              DrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 237, 252, 171)),
                child: Image.asset('assets/logo.jpg'),
              ),
              ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Pesanan Anda"),
                leading: Icon(Icons.shopping_cart),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => RiwayatPesananAnda(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text("List Testimoni"),
                leading: Icon(Icons.book),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ListTestimoni(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text("Logout"),
                leading: Icon(Icons.close),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => landing(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
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
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/background4.jpeg"),
          fit: BoxFit.cover,
        )),
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Welcome",
                    style: TextStyle(
                      fontFamily: "Serif",
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    "To PISCOK LUMER SHOP",
                    style: TextStyle(
                      fontFamily: "Serif",
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Image.asset('assets/piscok1.png'),
                          iconSize: 200,
                          onPressed: () => Get.to(detail1()),
                        ),
                        IconButton(
                          icon: Image.asset('assets/piscok2.png'),
                          iconSize: 250,
                          onPressed: () => Get.to(detail2()),
                        ),
                        IconButton(
                          icon: Image.asset('assets/piscok3.png'),
                          iconSize: 300,
                          onPressed: () => Get.to(detail3()),
                        ),
                      ],
                    ),
                  ),
                  Obx(() => ElevatedButton(
                      onPressed: () => Get.to(MyHomePage()),
                      style: TextButton.styleFrom(
                          alignment: Alignment.center,
                          backgroundColor: d.switchValue.value
                  ? Color.fromARGB(255, 187, 255, 0)
                  : Color.fromARGB(255, 238, 255, 0),
                          onSurface: d.switchValue.value
                  ? Color.fromARGB(255, 187, 255, 0)
                  : Color.fromARGB(255, 238, 255, 0),
                          shadowColor: d.switchValue.value
                  ? Color.fromARGB(255, 187, 255, 0)
                  : Color.fromARGB(255, 238, 255, 0),
                          elevation: 5,
                          side: BorderSide(
                            color: Color.fromARGB(255, 36, 33, 33),
                            width: 3,
                          )),
                      child: const Text(
                        "ORDER",
                        style: TextStyle(
                          fontSize: 40,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
