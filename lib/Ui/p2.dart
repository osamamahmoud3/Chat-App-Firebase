import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
String? email;
String? password;
class p2 extends StatefulWidget {
  @override
  State<p2> createState() => _p2State();
}

class _p2State extends State<p2> {
  bool inslouding =false;

GlobalKey<FormState> Formkey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: inslouding,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset('Images/icons8-back-24.png',height: 5,width: 5,color:Colors.blue ,)),
          backgroundColor: Colors.black,),
        backgroundColor: Colors.black,
        body: Form(
          key: Formkey,
          child: Column(
            children: [
          const    Center(child: Text('Create a password',style: TextStyle(color: Colors.white, fontSize: 24,fontWeight: FontWeight.bold),)),
          const    SizedBox(height: 15,),
          const    Center(child: Text("We can remember the password ,so you won't ",style: TextStyle(color: Colors.white60, fontSize: 15, ),)),
          const     Center(child: Text('need to enter it on your icould device.',style: TextStyle(color: Colors.white60, fontSize: 15),)),
               Padding(
                padding: const EdgeInsets.only(right: 30,left: 30,top: 20),
                child: Center(
                  child: TextFormField(
                    obscureText: true,
                    style:const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Password please';
                      }
                    },
                    onChanged: (data){
                      password=data;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                
                borderRadius: BorderRadius.circular(10),
              ),
                      contentPadding:const EdgeInsets.all(10),
                      
                      
                      focusColor: Colors.white70,
                      border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10)),
              hintText: 'Password',
              hintStyle: const TextStyle(color: Colors.white)
                    ),
                  ),
                ),
                
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30,left: 30,top: 20),
                child: GestureDetector(
                  onTap: () async{
                    if (Formkey.currentState!.validate()) {
                      inslouding=true;
                      setState(() {
                        
                      });
                                    try {
                    UserCredential userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email!, password: password!);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.transparent,
            behavior: SnackBarBehavior.floating,
            content: Container(
          padding: EdgeInsets.all(20),
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.green),
          
          child: const Center(child: Text('Email Created ',style: TextStyle(color: Colors.black),)))));
                  }on FirebaseAuthException catch (e) {
                   {
          if (e.code == 'weak-password') {
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.transparent,
            behavior: SnackBarBehavior.floating,
            content: Container(
          padding:const EdgeInsets.all(20),
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red),
          
          child:const Center(child: Text('weak password',style: TextStyle(color: Colors.black),)))));
          } else if (e.code == 'email-already-in-use') {
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.transparent,
            behavior: SnackBarBehavior.floating,
            content: Container(
          padding:const EdgeInsets.all(20),
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red),
          
          child:const Center(child: Text('email already used',style: TextStyle(color: Colors.black),)))));
          }
        }
                  }catch (e){
                   print('error');
                  }
        
                    } else {
                      
                    }inslouding=false;
                    setState(() {
                      
                    });
                  
                  },
                  child: Container(
                    
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.blue.shade800,),
                    height: 50,
                    width: 400,
                    
                    child:const  Center(child: Text('Next')),
                  
                  ),
                ),
              )
        
            ],
          ),
        ),
      ),
    );
  }
}