import 'package:flutter/material.dart';

import 'p2.dart';

class SighUpPAge extends StatelessWidget {
  SighUpPAge({super.key});
  GlobalKey<FormState> formkey = GlobalKey();
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
            const Center(
                child: Text(
              'Create usernsme',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            )),
            const SizedBox(
              height: 15,
            ),
            const Center(
                child: Text(
              'Pick s useranme for your new account. you can',
              style: TextStyle(
                color: Colors.white60,
                fontSize: 15,
              ),
            )),
            const Center(
                child: Text(
              ',always change it later',
              style: TextStyle(color: Colors.white60, fontSize: 15),
            )),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30, top: 20),
              child: Center(
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter email please';
                    }
                  },
                  onChanged: (value) {
                    email = value;
                  },
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
                      hintText: 'Email',
                      hintStyle: const TextStyle(color: Colors.white30)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30, top: 20),
              child: GestureDetector(
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return p2();
                    }));
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue.shade800,
                  ),
                  height: 50,
                  width: 400,
                  child: const Center(child: Text('Next')),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
