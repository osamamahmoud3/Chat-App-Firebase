import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mnaaa/Ui/Chats.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'PhoneSighin.dart';
import 'SighUpPAge.dart';

import 'p2.dart';

class Wellcome extends StatefulWidget {
  Wellcome({super.key});

  @override
  State<Wellcome> createState() => _WellcomeState();
}

class _WellcomeState extends State<Wellcome> {
  bool inslouding = false;

  GlobalKey<FormState> Frmkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ModalProgressHUD(
        inAsyncCall: inslouding,
        child: Form(
          key: Frmkey,
          child: ListView(
            children: [
              const Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Image(
                        height: 50,
                        image: AssetImage(
                          'Images/maxresdefault.jpg',
                        )),
                  ),
                ],
              ),
              const Padding(
                padding: const EdgeInsets.only(left: 210),
                child: Image(
                    height: 50,
                    image: AssetImage(
                      'Images/maxresdefault.jpg',
                    )),
              ),
              const Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Image(
                    height: 50,
                    image: AssetImage(
                      'Images/maxresdefault.jpg',
                    )),
              ),
              const SizedBox(
                height: 50,
              ),
              const Center(
                  child: Text(
                "Osama's Chat",
                style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: ''),
              )),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white24,
                  ),
                  child: Center(
                    child: TextField(
                      onChanged: (value) {
                        email = value;
                      },
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'Phone number, username or email',
                          hintStyle: TextStyle(color: Colors.white70),
                          focusColor: Colors.white70,
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white24,
                  ),
                  child: Center(
                    child: TextField(
                      obscureText: true,
                      onChanged: (value) {
                        password = value;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.white70),
                          focusColor: Colors.white70,
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 270),
                child: Text(
                  'Forget password?',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lobster'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: GestureDetector(
                  onTap: () async {
                    if (Frmkey.currentState!.validate()) {
                      inslouding = true;
                      setState(() {});
                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .signInWithEmailAndPassword(
                                email: email!, password: password!);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const Chatspage();
                        }));
                      } on FirebaseAuthException catch (e) {
                        {
                          if (e.code == 'user-not-found') {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.transparent,
                                behavior: SnackBarBehavior.floating,
                                content: Container(
                                    padding: EdgeInsets.all(20),
                                    height: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.red),
                                    child: const Center(
                                        child: Text(
                                      'user not found',
                                      style: TextStyle(color: Colors.black),
                                    )))));
                          } else if (e.code == 'wrong-password') {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.transparent,
                                behavior: SnackBarBehavior.floating,
                                content: Container(
                                    padding: const EdgeInsets.all(20),
                                    height: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.red),
                                    child: const Center(
                                        child: Text(
                                      'wrong password',
                                      style: TextStyle(color: Colors.black),
                                    )))));
                          }
                        }
                      } catch (e) {
                        print('error');
                      }
                    } else {}
                    inslouding = false;
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue.shade800,
                    ),
                    height: 50,
                    width: 400,
                    child: Center(child: Text('Log in')),
                  ),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              const Divider(
                thickness: 0.1,
                color: Colors.white,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'Images/659187.png',
                    height: 20,
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return PhoneSighin();
                          }));
                        },
                        child: const Text(
                          'Continue With Phone Number',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              const Divider(
                thickness: 0.1,
                color: Colors.white,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SighUpPAge();
                        }));
                      },
                      child: const Text(
                        "Sigh Up",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
