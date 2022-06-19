import 'package:flutter/material.dart';
import 'package:pa_kelompok4/alert.dart';
import 'package:pa_kelompok4/landing_page.dart';
import 'package:pa_kelompok4/switchController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _State();
}

enum Jenis {
  Piscok,
  Piscokgt,
  Piscokst,
}

class _State extends State<MyHomePage> {
  Jenis jenis = Jenis.Piscok;
  num harga = 1500;
  num jumlah = 0;
  num total = 0;
  final ctrlNamaLengkap = TextEditingController();
  final ctrlAlamat = TextEditingController();
  final ctrlNomorHP = TextEditingController();
  final ctrlJumlah = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    ctrlNamaLengkap.dispose();
    ctrlAlamat.dispose();
    ctrlNomorHP.dispose();
    ctrlJumlah.dispose();
  }

  String getJenis(Jenis? value) {
    if (value == Jenis.Piscokgt) {
      return "Pisang Coklat Toping Green Tea";
    } else if (value == Jenis.Piscokst) {
      return "Pisang Coklat Topping Strawberry";
    } else {
      return 'Pisang Coklat Lumerr';
    }
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference pesanan = firestore.collection("pesanan");
    final switchController d = Get.put(switchController());
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Color.fromARGB(255, 238, 255, 0),
          child: ListView(
            children: [
              DrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 237, 255, 171)),
                child: Image.asset('assets/logo.jpg'),
              ),
              ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                onTap: () {
                  Navigator.pop(
                    context,
                  );
                  Navigator.pop(
                    context,
                  );
                  Navigator.pop(
                    context,
                  );
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
              ListTile(
                title: Text("Exit"),
                leading: Icon(Icons.close),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
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
      backgroundColor: Color.fromARGB(255, 41, 119, 124),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          Column(
            children: [
              Text(
                "SILAHKAN MENGISI NAMA DAN PILIH VARIAN PISCOK",
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
              ),
              TextField(
                controller: ctrlNamaLengkap,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 41, 119, 124),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 238, 255, 0), width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 36, 33, 33), width: 3),
                  ),
                  border: OutlineInputBorder(),
                  hintText: "Isikanlah Nama Lengkap",
                  labelText: "Nama Lengkap",
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: ctrlAlamat,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 41, 119, 124),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 238, 255, 0), width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 36, 33, 33), width: 3),
                  ),
                  border: OutlineInputBorder(),
                  hintText: "Isikanlah Alamat",
                  labelText: "Alamat",
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: ctrlNomorHP,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 41, 119, 124),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 238, 255, 0), width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 36, 33, 33), width: 3),
                  ),
                  border: OutlineInputBorder(),
                  hintText: "Isikanlah Nomor HP",
                  labelText: "Nomor HP",
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                onChanged: (text) {
                  setState(() {
                    jumlah = int.tryParse(ctrlJumlah.text) ?? 0;
                    total = harga * jumlah;
                  });
                },
                controller: ctrlJumlah,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 41, 119, 124),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 238, 255, 0), width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 36, 33, 33), width: 3),
                  ),
                  border: OutlineInputBorder(),
                  hintText: "Isikanlah Jumlah Pesanan",
                  labelText: "Jumlah Pesanan",
                ),
              ),
              ListTile(
                title: Text("Pisang Coklat Topping Strawberry"),
                leading: Radio(
                  groupValue: jenis,
                  value: Jenis.Piscokst,
                  onChanged: (Jenis? value) {
                    setState(() {
                      jenis = value!;
                      harga = 2500;
                      jumlah = int.tryParse(ctrlJumlah.text) ?? 0;
                      total = harga * jumlah;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text("Pisang Coklat Topping Green Tea"),
                leading: Radio(
                  groupValue: jenis,
                  value: Jenis.Piscokgt,
                  onChanged: (Jenis? value) {
                    setState(() {
                      jenis = value!;
                      harga = 2500;
                      jumlah = int.tryParse(ctrlJumlah.text) ?? 0;
                      total = harga * jumlah;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text("Pisang Coklat Lumerr"),
                leading: Radio(
                  groupValue: jenis,
                  value: Jenis.Piscok,
                  onChanged: (Jenis? value) {
                    setState(() {
                      jenis = value!;
                      harga = 1500;
                      jumlah = int.tryParse(ctrlJumlah.text) ?? 0;
                      total = harga * jumlah;
                    });
                  },
                ),
              ),
              Text(
                "Total : Rp. ${total}",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              Obx(
                () => ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    CustomAlert(context,
                        "Untuk Pemesanan Pisang Coklatnya Segera Ditunggu");
                    pesanan.add({
                      'userid': FirebaseAuth.instance.currentUser?.uid,
                      'nama_lengkap': ctrlNamaLengkap.text,
                      'alamat': ctrlAlamat.text,
                      'nomor_hp': ctrlNomorHP.text,
                      'jumlah': int.parse(ctrlJumlah.text),
                      'jenis': getJenis(jenis),
                      'harga': total,
                      'status': "Pending",
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: d.switchValue.value
                        ? Color.fromARGB(255, 187, 255, 0)
                        : Color.fromARGB(255, 238, 255, 0),
                    shadowColor: Colors.black,
                  ),
                  child: const Text(
                    "PESAN",
                    style: TextStyle(
                      fontSize: 35,
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
                    shadowColor: Color.fromARGB(255, 0, 0, 0),
                    elevation: 5,
                  ),
                  child: const Text(
                    "KEMBALI",
                    style: TextStyle(
                      fontSize: 35,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
