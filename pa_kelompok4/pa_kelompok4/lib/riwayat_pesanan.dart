import 'package:flutter/material.dart';
import 'package:pa_kelompok4/alert.dart';
import 'package:pa_kelompok4/landing.dart';
import 'package:pa_kelompok4/landing_page.dart';
import 'package:pa_kelompok4/listtestimoni_admin.dart';
import 'package:pa_kelompok4/switchController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class RiwayatPesanan extends StatefulWidget {
  const RiwayatPesanan({Key? key}) : super(key: key);

  @override
  State<RiwayatPesanan> createState() => _State();
}

class _State extends State<RiwayatPesanan> {

  Container pesanan(String nama, String alamat, String nomor_hp, int jumlah, String jenis, int harga,
      String isStatusPesanan, Function delete, Function update) {
    AlertDialog alertUpdate = AlertDialog(
      title: Text("Konfirmasi"),
      content: Container(
        child: Text("Apakah anda ingin mengubah status pesanan"),
      ),
      actions: [
        TextButton(
          child: Text('TIDAK'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
            child: Text('YA'),
            onPressed: () {
              update();
              Navigator.of(context).pop();
            }),
      ],
    );

    AlertDialog alertDelete = AlertDialog(
      title: Text("Konfirmasi"),
      content: Container(
        child: Text("Apakah anda ingin menghapus pesanan"),
      ),
      actions: [
        TextButton(
          child: Text('TIDAK'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
            child: Text('YA'),
            onPressed: () {
              delete();
              Navigator.of(context).pop();
            }),
      ],
    );

    return Container(
        width: double.infinity,
        height: 220,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nama : $nama",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "Alamat : $alamat",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "Nomor HP : $nomor_hp",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "Jumlah Pesanan : $jumlah",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "Jenis Pesanan : $jenis",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "Harga Pesanan : $harga",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "Pembayaran : ${isStatusPesanan}",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      showDialog(context: context, builder: (context) => alertDelete);
                    },
                    child: Text("Hapus")),
                ElevatedButton(
                    onPressed: () {
                      showDialog(context: context, builder: (context) => alertUpdate);
                    },
                    child: Text("Update"))
              ],
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference pesanananda = firestore.collection("pesanan");
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
                title: Text("List Testimoni"),
                leading: Icon(Icons.book),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListTestimoniAdmin(),
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
      backgroundColor: Color.fromARGB(255, 41, 119, 124),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          Column(
            children: [
              Container(
                padding:EdgeInsets.only(bottom: 5),
                width: double.infinity,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  //                   <--- left side
                  color: Colors.grey,
                  width: 1,
                ))),
                child: const Text(
                  "Riwayat Pemesanan",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
              StreamBuilder<QuerySnapshot>(
                  stream: pesanananda.snapshots(),
                  builder: (_, snapshot) {
                    return (snapshot.hasData)
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: snapshot.data!.docs
                                .map((e) => pesanan(
                                        e.get('nama_lengkap'),
                                        e.get('alamat'),
                                        e.get('nomor_hp'),
                                        e.get('jumlah'),
                                        e.get('jenis'),
                                        e.get('harga'),
                                        e.get('status'), () {
                                      pesanananda.doc(e.id).delete();
                                    }, () {
                                      if(e.get('status') == "Pending") {
                                        pesanananda.doc(e.id).update({
                                          'status': "Proses",
                                        });
                                      } else if(e.get('status') == "Proses") {
                                        pesanananda.doc(e.id).update({
                                          'status': "Done",
                                        });
                                      }
                                    }))
                                .toList(),
                          )
                        : const Text('Loading...');
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
