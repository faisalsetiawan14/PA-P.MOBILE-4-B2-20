import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pa_kelompok4/landing.dart';
import 'package:pa_kelompok4/landing_page.dart';
import 'package:pa_kelompok4/main_page.dart';
import 'package:pa_kelompok4/pemesanan.dart';
import 'package:get/get.dart';
import 'switchController.dart';

class detail1 extends StatelessWidget {
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
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Order"),
                leading: Icon(Icons.shopping_cart),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MyHomePage(),
                    ),
                  );
                },
              ),
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
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Pisang Coklat",
                style: TextStyle(
                  fontFamily: "serif",
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                width: lebar,
                height: 300,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/piscok1.png'),
                )),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                color: Colors.yellow,
                child: const Text(
                  "Pisang dengan rasa coklat lumerr abisss bikin nagih sekali coba bikin ketagihan rasanya kayak mau meninggal",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment(-1.0, -1.0),
                child: const Text(
                  "Harga = Rp.1.500/pcs",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Obx(
                () => ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                      alignment: Alignment.center,
                      backgroundColor: d.switchValue.value
                          ? Color.fromARGB(255, 187, 255, 0)
                          : Color.fromARGB(255, 238, 255, 0),
                      elevation: 5,
                      side: BorderSide(
                        color: d.switchValue.value
                            ? Color.fromARGB(255, 187, 255, 0)
                            : Color.fromARGB(255, 238, 255, 0),
                        width: 3,
                      )),
                  child: const Text(
                    "PESAN",
                    style: TextStyle(
                      fontSize: 40,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),
              Obx(
                () => ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                      alignment: Alignment.center,
                      backgroundColor: d.switchValue.value
                          ? Color.fromARGB(255, 187, 255, 0)
                          : Color.fromARGB(255, 238, 255, 0),
                      elevation: 5,
                      side: BorderSide(
                        color: d.switchValue.value
                            ? Color.fromARGB(255, 187, 255, 0)
                            : Color.fromARGB(255, 238, 255, 0),
                        width: 3,
                      )),
                  child: const Text(
                    "KEMBALI",
                    style: TextStyle(
                      fontSize: 40,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//////////////////////// DETAIL 2 ///////////////////////////

class detail2 extends StatelessWidget {
  const detail2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final switchController d = Get.put(switchController());
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
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Order"),
                leading: Icon(Icons.shopping_cart),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MyHomePage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
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
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/background4.jpeg"),
            fit: BoxFit.cover,
          )),
          child: ListView(
            children: [
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Pisang Coklat Strawberry",
                style: TextStyle(
                  fontFamily: "serif",
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                width: lebar,
                height: 300,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/piscok2.png'),
                )),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                color: Colors.yellow,
                child: const Text(
                  "Pisang dengan rasa coklat lumerr dengan topping strawberry abisss bikin nagih sekali coba bikin ketagihan rasanya kayak mau meninggal",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment(-1.0, -1.0),
                child: const Text(
                  "Harga = Rp.2.500/pcs",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Obx(
                () => ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                      alignment: Alignment.center,
                      backgroundColor: d.switchValue.value
                          ? Color.fromARGB(255, 187, 255, 0)
                          : Color.fromARGB(255, 238, 255, 0),
                      elevation: 5,
                      side: BorderSide(
                        color: d.switchValue.value
                            ? Color.fromARGB(255, 187, 255, 0)
                            : Color.fromARGB(255, 238, 255, 0),
                        width: 3,
                      )),
                  child: const Text(
                    "PESAN",
                    style: TextStyle(
                      fontSize: 40,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),
              Obx(
                () => ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                      alignment: Alignment.center,
                      backgroundColor: d.switchValue.value
                          ? Color.fromARGB(255, 187, 255, 0)
                          : Color.fromARGB(255, 238, 255, 0),
                      elevation: 5,
                      side: BorderSide(
                        color: d.switchValue.value
                            ? Color.fromARGB(255, 187, 255, 0)
                            : Color.fromARGB(255, 238, 255, 0),
                        width: 3,
                      )),
                  child: const Text(
                    "KEMBALI",
                    style: TextStyle(
                      fontSize: 40,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//////////////////////// DETAIL 3 ///////////////////////////

class detail3 extends StatelessWidget {
  const detail3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final switchController d = Get.put(switchController());
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
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Order"),
                leading: Icon(Icons.shopping_cart),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MyHomePage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
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
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/background4.jpeg"),
            fit: BoxFit.cover,
          )),
          child: ListView(
            children: [
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Pisang Coklat Green Tea",
                style: TextStyle(
                  fontFamily: "serif",
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                width: lebar,
                height: 300,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/piscok3.png'),
                )),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                color: Colors.yellow,
                child: const Text(
                  "Pisang dengan rasa coklat lumerr dengan topping green tea abisss bikin nagih sekali coba bikin ketagihan rasanya kayak mau meninggal",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment(-1.0, -1.0),
                child: const Text(
                  "Harga = Rp.2.500/pcs",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Obx(
                () => ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                      alignment: Alignment.center,
                      backgroundColor: d.switchValue.value
                          ? Color.fromARGB(255, 187, 255, 0)
                          : Color.fromARGB(255, 238, 255, 0),
                      elevation: 5,
                      side: BorderSide(
                        color: d.switchValue.value
                            ? Color.fromARGB(255, 187, 255, 0)
                            : Color.fromARGB(255, 238, 255, 0),
                        width: 3,
                      )),
                  child: const Text(
                    "PESAN",
                    style: TextStyle(
                      fontSize: 40,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),
              Obx(
                () => ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                      alignment: Alignment.center,
                      backgroundColor: d.switchValue.value
                          ? Color.fromARGB(255, 187, 255, 0)
                          : Color.fromARGB(255, 238, 255, 0),
                      elevation: 5,
                      side: BorderSide(
                        color: d.switchValue.value
                            ? Color.fromARGB(255, 187, 255, 0)
                            : Color.fromARGB(255, 238, 255, 0),
                        width: 3,
                      )),
                  child: const Text(
                    "KEMBALI",
                    style: TextStyle(
                      fontSize: 40,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
