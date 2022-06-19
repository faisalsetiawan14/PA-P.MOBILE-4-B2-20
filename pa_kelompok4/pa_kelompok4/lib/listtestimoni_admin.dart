import 'package:flutter/material.dart';
import 'package:pa_kelompok4/alert.dart';
import 'package:pa_kelompok4/landing_page.dart';
import 'package:pa_kelompok4/switchController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ListTestimoniAdmin extends StatefulWidget {
  const ListTestimoniAdmin({Key? key}) : super(key: key);

  @override
  State<ListTestimoniAdmin> createState() => _State();
}

class _State extends State<ListTestimoniAdmin> {
  Container testimoni(String email, String testimoni, Function delete) {
    AlertDialog alertDelete = AlertDialog(
      title: Text("Konfirmasi"),
      content: Container(
        child: Text("Apakah anda ingin menghapus testimoni"),
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
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email : $email",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "Testimoni : $testimoni",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context, builder: (context) => alertDelete);
                    },
                    child: Text("Hapus")),
              ],
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference listtestimoni = firestore.collection("testimoni");
    final switchController d = Get.put(switchController());
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
      backgroundColor: Color.fromARGB(255, 41, 119, 124),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 5),
                width: double.infinity,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  //                   <--- left side
                  color: Colors.grey,
                  width: 1,
                ))),
                child: const Text(
                  "List Testimoni",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
              StreamBuilder<QuerySnapshot>(
                  stream: listtestimoni.snapshots(),
                  builder: (_, snapshot) {
                    return (snapshot.hasData)
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: snapshot.data!.docs
                                .map((e) => testimoni(
                                        e.get('email'), e.get('testimoni'), () {
                                      listtestimoni.doc(e.id).delete();
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
