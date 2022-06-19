import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:pa_kelompok4/alert.dart';
import 'switchController.dart';
import 'landing_page.dart';

class testimoni extends StatelessWidget {
  final switchController d = Get.put(switchController());
  final TextEditingController testiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference testimoni = firestore.collection("testimoni");
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
          decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/background4.jpeg"),
          fit: BoxFit.cover,
        )),
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
                          'TESTIMONI',
                          style: TextStyle(
                            fontSize: 25,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = Color.fromARGB(255, 36, 33, 33),
                          ),
                        ),
                        Text(
                          'TESTIMONI',
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
                      controller: testiController,
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
                          hintText: "Testimoni"),
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                    Container(
                      height: 90,
                      width: 130,
                      padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                      child: Obx(() => ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: d.switchValue.value
                  ? Color.fromARGB(255, 178, 255, 0)
                  : Color.fromARGB(255, 238, 255, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(
                                  context,
                                  );
                              CustomAlert(context,
                                  "Terima kasih atas testimoninya");
                              testimoni.add({
                                'email': FirebaseAuth.instance.currentUser?.email,
                                'testimoni': testiController.text,
                              });
                      
                              testiController.text = '';
                            }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ),
    );
  }
}
