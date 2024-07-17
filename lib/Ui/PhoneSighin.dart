import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class PhoneSighin extends StatelessWidget {
  PhoneSighin({super.key});
  GlobalKey<FormState> formkey = GlobalKey();
  var verificationId = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              'Images/icons8-back-24.png',
              height: 5,
              width: 5,
              color: Colors.blue,
            )),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Form(
        key: formkey,
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Center(
                child: Text(
              'Enter Your Phone Number',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
            Padding(
              padding:
                  EdgeInsets.only(right: 30, left: 30, top: 20, bottom: 20),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Your Phone Numebr";
                  }
                },
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusColor: Colors.white70,
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: '+20 000 000 000 0',
                    hintStyle: const TextStyle(color: Colors.white30)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: GestureDetector(
                onTap: () {
                  if (formkey.currentState!.validate()) {}
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue.shade800,
                  ),
                  height: 50,
                  width: 340,
                  child: const Center(child: Text('Sent code ')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
